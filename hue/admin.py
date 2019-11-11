from django.contrib import admin
from .models import State, Room, RoomPath, Device, User, RoomReservation, SignMappingData, Nodes, Edges, EmergencyPos, TempHumPm

from django.db.models.signals import post_save
from django.dispatch import receiver
from django import forms

# Register your models here.


class StateAdmin(admin.ModelAdmin):
    list_display = ['id', 'target', 'code', 'state']


class UserChoiceField(forms.ModelChoiceField):
    def label_from_instance(self, obj):
        return "User : {}".format(obj.first_name)

class RoomAdmin(admin.ModelAdmin):
    list_display = ['id', 'room_name', 'code', 'user_name', 'car_no', 'updated_date', 'device1', 'device2', 'device3']

    def user_name(self, obj):
        if not obj.user:
            return ''
        return obj.user.first_name

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        mode = request.resolver_match.url_name.split('_')[-1]
        if db_field.name == 'user':
            return UserChoiceField(queryset=User.objects.all())
        if mode == 'add':
            if db_field.name == "device1" or db_field.name == "device2" or db_field.name == "device3":
                kwargs["queryset"] = Device.objects.filter(code='D00')
            return super().formfield_for_foreignkey(db_field, request, **kwargs)
        return super().formfield_for_foreignkey(db_field, request, **kwargs)

# device가 없을 경우, 미사용 중에 가져와야 함

# room에 device 항목이 있으면, device에서 사용중(D01)으로 업데이트
@receiver(post_save, sender=Room)
def my_handler(sender, instance, **kwargs):
    print('post_save callback')

    ds = []
    for d in Room.objects.all():
        ds.append(str(d.device1))
        ds.append(str(d.device2))
        ds.append(str(d.device3))
    dsset = set(ds)
    dsset.remove('None')
    Device.objects.update(code='D00')

    for d in set(ds):
        Device.objects.filter(device=d).update(code='D01')


class RoomPathAdmin(admin.ModelAdmin):
    list_display = ['id', 'room_name', 'path1', 'path2', 'path3', 'path4', 'path5', 'path6', 'path7', 'path8', 'path9']

    def room_name(self, obj):
        return obj.room.room_name


class DeviceAdmin(admin.ModelAdmin):
    list_display = ['id', 'device', 'code', 'user_name', 'phone']

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == "room_name":
            kwargs["queryset"] = Room.objects.filter(id='D00')
        return super().formfield_for_foreignkey(db_field, request, **kwargs)

class RoomReserveAdmin(admin.ModelAdmin):
    list_display = ['roomid', 'carno', 'reserveOrder']

class SignMappingDataAdmin(admin.ModelAdmin):
    list_display = ['signid', 'svgdata']

class HueNodesAdmin(admin.ModelAdmin):
    model = Nodes
    list_display = ['type', 'roomid', 'x', 'y', 'label', 'shape', 'image', 'size']

class HueEdgesAdmin(admin.ModelAdmin):
    model = Edges
    list_display = ['toseqid', 'arrows', 'pid']

class HueEmergency(admin.ModelAdmin):
    model = EmergencyPos
    list_display = ['deviceUuid', 'deviceLng', 'deviceLat', 'deviceState', 'callDate']

class HueTempHumPm(admin.ModelAdmin):
    model = TempHumPm
    list_display = ['deviceUuid', 'deviceLng', 'deviceLat', 'deviceTempature', 'deviceHum', 'devicePm', 'callDate']


admin.site.register(State, StateAdmin)
admin.site.register(Room, RoomAdmin)
admin.site.register(RoomPath, RoomPathAdmin)
admin.site.register(Device, DeviceAdmin)
admin.site.register(RoomReservation, RoomReserveAdmin)
admin.site.register(SignMappingData, SignMappingDataAdmin)
admin.site.register(Nodes, HueNodesAdmin)
admin.site.register(Edges, HueEdgesAdmin)
admin.site.register(EmergencyPos, HueEmergency)
admin.site.register(TempHumPm, HueTempHumPm)

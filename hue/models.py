from django.db import models
from django.contrib.auth.models import AbstractUser
import datetime
from django.utils import timezone
from pytz import timezone
from django.contrib.auth.models import User


# Create your models here.
'''
    ID  TARGET  CODE    STATE
	10	navi	N00	END
	9	navi	N03	우회전
	8	navi	N02	좌회전
	7	navi	N01	직진
	6	device	D01	사용중
	5	device	D00	미사용
	4	room	R03	사용중
	3	room	R02	안내중
	2	room	R01	예약
	1	room	R00	미사용
'''


class State(models.Model):
    target = models.CharField(max_length=10) # 'device' or 'room' or 'navi'
    code = models.CharField(max_length=3, unique=True)
    state = models.CharField(max_length=20)

    def __str__(self):
        return self.state


class Device(models.Model):
    device = models.CharField(max_length=20)
    code = models.ForeignKey(State, to_field='code', on_delete=models.CASCADE, limit_choices_to={'target': 'device'}, default='D00')
    user_name = models.CharField(max_length=20, default=None, blank=True)
    phone = models.CharField(max_length=20, default=None, blank=True)

    def __str__(self):
        return self.device



class Room(models.Model):
    room_name = models.CharField(max_length=20)
    code = models.ForeignKey(State, to_field='code', on_delete=models.CASCADE, limit_choices_to={'target': 'room'}, default='R00')
    user_name = models.CharField(max_length=20, default=None, blank=True, null=True)
    car_no = models.CharField(max_length=20, default=None, blank=True)
    updated_date = models.DateTimeField('date_published', auto_now=True)

    device1 = models.ForeignKey(Device, on_delete=models.CASCADE, default=None, blank=True, null=True,
                                related_name='device1')
    device2 = models.ForeignKey(Device, on_delete=models.CASCADE, default=None, blank=True, null=True,
                                related_name='device2')
    device3 = models.ForeignKey(Device, on_delete=models.CASCADE, default=None, blank=True, null=True,
                                related_name='device3')

    def limittime(self):
        if self.car_no == '':
            return 0
        delta = datetime.datetime.now(timezone.utc) - self.updated_date
        if delta.seconds > (60 * 5): # 5 minutes
            return 0
        return (60 * 30) - delta.seconds

    def __str__(self):
        return self.room_name


class RoomPath(models.Model):
    room = models.ForeignKey(Room, on_delete=models.CASCADE, default=None, blank=True)
    path1 = models.ForeignKey(State, on_delete=models.CASCADE, limit_choices_to={'target': 'navi'}, default=None,
                              blank=True, null=True, related_name='path1')
    path2 = models.ForeignKey(State, on_delete=models.CASCADE, limit_choices_to={'target': 'navi'}, default=None,
                              blank=True, null=True, related_name='path2')
    path3 = models.ForeignKey(State, on_delete=models.CASCADE, limit_choices_to={'target': 'navi'}, default=None,
                              blank=True, null=True, related_name='path3')
    path4 = models.ForeignKey(State, on_delete=models.CASCADE, limit_choices_to={'target': 'navi'}, default=None,
                              blank=True, null=True, related_name='path4')
    path5 = models.ForeignKey(State, on_delete=models.CASCADE, limit_choices_to={'target': 'navi'}, default=None,
                              blank=True, null=True, related_name='path5')
    path6 = models.ForeignKey(State, on_delete=models.CASCADE, limit_choices_to={'target': 'navi'}, default=None,
                              blank=True, null=True, related_name='path6')
    path7 = models.ForeignKey(State, on_delete=models.CASCADE, limit_choices_to={'target': 'navi'}, default=None,
                              blank=True, null=True, related_name='path7')
    path8 = models.ForeignKey(State, on_delete=models.CASCADE, limit_choices_to={'target': 'navi'}, default=None,
                              blank=True, null=True, related_name='path8')
    path9 = models.ForeignKey(State, on_delete=models.CASCADE, limit_choices_to={'target': 'navi'}, default=None,
                              blank=True, null=True, related_name='path9')

    def __str__(self):
        return self.room.room_name

class SignMappingData(models.Model):
    signid = models.IntegerField(default=None, blank=False, null=False)
    svgdata = models.CharField(max_length=1000, default=None, blank=False, null=False)

class RoomReservation(models.Model):
    roomid = models.IntegerField(default=None, blank=False, null=False)
    carno = models.CharField(max_length=4, default=None, blank=False, null=False)
    reserveOrder = models.IntegerField(default=None, blank=False, null=False)
    reserveDate = models.DateTimeField(auto_now_add=True)

class Nodes(models.Model):
    parkid = models.CharField(max_length=5, blank=False, null=False)
    seqid = models.IntegerField(default=None, blank=False, null=False)
    type = models.CharField(max_length=5, blank=False, null=False)
    roomid = models.IntegerField(default=None, blank=True, null=True)
    x = models.IntegerField(default=None, blank=False, null=False)
    y = models.IntegerField(default=None, blank=False, null=False)
    label = models.CharField(max_length=100, blank=False, null=False)
    shape = models.CharField(max_length=10, blank=False, null=False)
    image = models.CharField(max_length=500, blank=True, null=True)
    size = models.IntegerField(default=None, blank=True, null=True)

    # {from: 1, to: 100, arrows:'to'},
    # {from: 100, to: 2, arrows:'to'},
    # {from: 100, to: 101, arrows:'to'},
    # {from: 101, to: 3, arrows:'to'},
    # {from: 101, to: 4, arrows:'to'},
    # {from: 101, to: 102, arrows:'to'},
    # {from: 102, to: 5, arrows:'to'},
    # {from: 102, to: 6, arrows:'to'},
    # {from: 102, to: 7, arrows:'to'}
class Edges(models.Model):
    pid = models.CharField(max_length=5, blank=False, null=False)
    fromseqid = models.IntegerField(default=None, blank=False, null=False)
    toseqid = models.IntegerField(default=None, blank=False, null=False)
    arrows = models.CharField(max_length=5, blank=False, null=False)


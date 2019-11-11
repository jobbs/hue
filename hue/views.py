import json
import time
from datetime import datetime, timedelta
import serial
from django.db.models import Q, Max
from django.http import HttpResponse
from django.shortcuts import render, get_object_or_404
from django.http import JsonResponse
from django.core import serializers
from django.views.decorators.csrf import csrf_exempt

from .models import Room, RoomPath, SignMappingData, RoomReservation, Nodes, Edges, EmergencyPos, TempHumPm


# Create your views here.
def login(request):
    return render(request, 'hue/login.html', {})


def room_list(request):
    rooms = Room.objects.all()
    paths = RoomPath.objects.all()
    return render(request, 'hue/list.html', {'rooms': rooms, 'paths': paths})


def navi_list(request):
    if not request.user.is_authenticated:
        return render(request, 'hue/login.html', {})
    else:
        time_threshold = datetime.now() - timedelta(minutes=30)
        rooms = Room.objects.all()
        paths = RoomPath.objects.all()
        nodes = Nodes.objects.filter(parkid='A')
        edges = Edges.objects.filter(pid='A')
        RoomReservation.objects.filter(reserveDate__lt=time_threshold).delete()
        reserves = RoomReservation.objects.all().order_by('reserveDate')
        svgs = SignMappingData.objects.all()
        return render(request, 'hue/navi.html',
                      {'rooms': rooms, 'paths': paths, 'reserves': reserves, 'svgs': svgs, 'nodes': nodes,
                       'edges': edges})


def emergency(request):
    if not request.user.is_authenticated:
        return render(request, 'hue/login.html', {})
    else:
        pos = EmergencyPos.objects.all().order_by('-callDate')
        return render(request, 'hue/emergency.html', {'pos': pos})

def emergency_with_params(request, alrm_uuid):
    if not request.user.is_authenticated:
        return render(request, 'hue/login.html', {})
    else:
        pos = EmergencyPos.objects.all().order_by('-callDate')
        return render(request, 'hue/emergency.html', {'pos': pos, 'alrmUuid': alrm_uuid})

def period_call_emergency_resp(request):
    pos = EmergencyPos.objects.all().order_by('-callDate')
    posts_serialized = serializers.serialize('json', pos)
    return JsonResponse(posts_serialized, safe=False)

def temp_hum_pm(request):
    if not request.user.is_authenticated:
        return render(request, 'hue/login.html', {})
    else:
        temp = TempHumPm.objects.all().order_by('-callDate')
        return render(request, 'hue/temphumpm.html', {'temp': temp})

def period_call_temphumpm_resp(request):
    pos = TempHumPm.objects.all().order_by('-callDate')
    posts_serialized = serializers.serialize('json', pos)
    return JsonResponse(posts_serialized, safe=False)

def signal(request):
    port = 'COM4'  # 시리얼 포트
    baud = 115200  # 시리얼 보드레이트(통신속도)
    data = request.POST.getlist('signalData[]')
    # print('Transfer Data::%s', data)
    # ser = serial.Serial(port, baud)
    # for item in data:
    #     #if ser.in_waiting == 1:
    #     text = item+'\n'
    #     for char in list(text):
    #     #print(text.encode('ascii'))
    #     #ser.name()
    #         ser.write(char.encode('ascii'))
    #         time.sleep(0.1)
    #     result = ser.readline()
    #     print(result)
    #     time.sleep(0.1)
    # ser.flush()
    # ser.close()

    return HttpResponse(json.dumps({'result': data}), content_type="application/json")


def reservation(request):
    reserve_data = request.POST['reserve_data']
    p1 = reserve_data.split('_')[0]  # roomid
    p2 = reserve_data.split('_')[2]  # order
    p3 = reserve_data.split('_')[1]  # carno
    now = datetime.now()
    origin_reserve_data = RoomReservation.objects.filter(
        Q(roomid=p1) & Q(reserveOrder=p2)
    )
    if origin_reserve_data.count() > 0:
        RoomReservation.objects.filter(roomid=p1, reserveOrder=p2).update(carno=p3, reserveDate=now)
    else:
        savedata = RoomReservation(roomid=p1, carno=p3, reserveOrder=p2)
        savedata.save()

    return HttpResponse(json.dumps({'reserveDate': now.isoformat()}), content_type="application/json")


def svg(request):
    svg_mapping_data = request.POST['save_data']
    svg_mapping_data = svg_mapping_data.split('~')
    SignMappingData.objects.all().delete()
    iterdatas = iter(svg_mapping_data)
    next(iterdatas)
    for data in iterdatas:
        print(data)
        p = data.split('@')
        p1 = p[0]
        p2 = p[1]
        savedata = SignMappingData(signid=p1, svgdata=p2)
        savedata.save()

    return HttpResponse(json.dumps({'result': 'ok'}), content_type="application/json")


@csrf_exempt
def emergency_data(request):
    print(request.__dict__)
    emergency_resp: object = get_object_or_404(request.POST, id=request.POST.get('data'))
    print(emergency_resp)
    recieved_json_data = json.loads(emergency_resp)
    savedata = EmergencyPos(deviceUuid=recieved_json_data['deviceUuid'], deviceLng=recieved_json_data['deviceLng'],
                            deviceLat=recieved_json_data['deviceLat'], deviceState=recieved_json_data['deviceState'])
    savedata.save()
    return HttpResponse(json.dumps({'result': 'ok'}), content_type="application/json")

@csrf_exempt
def temphumpm_data(request):
    print(request.__dict__)
    temphumpm_resp: object = get_object_or_404(request.POST, id=request.POST.get('data'))
    print(temphumpm_resp)
    recieved_json_data = json.loads(temphumpm_resp)
    savedata = TempHumPm(deviceUuid=recieved_json_data['deviceUuid'], deviceLng=recieved_json_data['deviceLng'],
                            deviceLat=recieved_json_data['deviceLat'], deviceTempature=recieved_json_data['deviceTp'], deviceHum=recieved_json_data['deviceHm'], devicePm=recieved_json_data['devicePm'])
    savedata.save()
    return HttpResponse(json.dumps({'result': 'ok'}), content_type="application/json")


#
'''
import socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('localhost', 50000))
s.sendall('Hello, world')
data = s.recv(1024)
s.close()
print 'Received', repr(data)
'''
#

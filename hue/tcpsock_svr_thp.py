import socket
import threading
import json
import sqlite3
bind_ip = '0.0.0.0'
bind_port = 3001
API_HOST = 'http://127.0.0.1:8000/temphumpm/data'
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind((bind_ip, bind_port))
server.listen(5)  # max backlog of connections
headers = {'Accept': 'application/json', 'Content-Type': 'application/json', 'X-CSRFToken': 'd7f6f683188d35958b0f453f6849a8d7'}

print('Listening on {}:{}'.format(bind_ip, bind_port))


def handle_client_connection(client_socket):
    conn = sqlite3.connect('C:\work\db.sqlite3')
    c = conn.cursor()
    request = client_socket.recv(21)
    request = request.decode('utf-8')
    print('Received {}'.format(request))
    request = split(request)
    deviceUuid = request[1]+request[2]+request[3]+request[4]
    deviceTp = request[5]+request[6]+request[7]+request[8]
    deviceHm =request[9]+request[10]+request[11]+request[12]
    devicePm =request[13]+request[14]+request[15]+request[16]
    deviceTp = int(deviceTp)/10
    deviceHm = int(deviceHm)/10
    devicePm = int(devicePm)/10
    c.execute("SELECT deviceUuid, deviceLng, deviceLat FROM hue_tpgps where deviceUuid='"+deviceUuid+"'")
    r = c.fetchone()
    c.close()
    deviceLng = r[1]
    deviceLat = r[2]
    c = conn.cursor()
    c.execute("INSERT INTO hue_temphumpm(deviceUuid,deviceLng,deviceLat,deviceTempature,deviceHum,devicePm,callDate) VALUES ('"+deviceUuid+"',"+str(deviceLng)+","+str(deviceLat)+","+str(deviceTp)+","+str(deviceHm)+","+str(devicePm)+", datetime('now','localtime'))")
    conn.commit()

    conn.close()
    client_socket.close()

def split(word):
    return list(word)

while True:
    client_sock, address = server.accept()
    print('Accepted connection from {}:{}'.format(address[0], address[1]))
    client_handler = threading.Thread(
        target=handle_client_connection,
        args=(client_sock,)
    )
    client_handler.start()
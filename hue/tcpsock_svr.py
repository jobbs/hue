import socket
import threading
import json
import sqlite3
bind_ip = '0.0.0.0'
bind_port = 3000
API_HOST = 'http://127.0.0.1:8000/emergency/data'
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind((bind_ip, bind_port))
server.listen(5)  # max backlog of connections
headers = {'Accept': 'application/json', 'Content-Type': 'application/json', 'X-CSRFToken': 'd7f6f683188d35958b0f453f6849a8d7'}

print('Listening on {}:{}'.format(bind_ip, bind_port))


def handle_client_connection(client_socket):
    conn = sqlite3.connect('C:\work\db.sqlite3')
    c = conn.cursor()
    request = client_socket.recv(1024)
    print('Received {}'.format(request))
    request = json.loads(request)
    c.execute("INSERT INTO hue_emergencypos(deviceUuid,deviceLng,deviceLat,deviceState,callDate) VALUES ('"+str(request["deviceUuid"])+"',"+str(request["deviceLng"])+","+str(request["deviceLat"])+","+str(request["deviceState"])+", datetime('now','localtime'))")
    conn.commit()
    conn.close()
    client_socket.close()

while True:
    client_sock, address = server.accept()
    print('Accepted connection from {}:{}'.format(address[0], address[1]))
    client_handler = threading.Thread(
        target=handle_client_connection,
        args=(client_sock,)
    )
    client_handler.start()
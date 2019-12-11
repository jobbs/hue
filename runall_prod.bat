@ECHO OFF
@start /b cmd /c python manage.py runserver 0.0.0.0:8000 1> c:\works\django.log 2>&1
@start /b cmd /c python c:\works\hue\tcpsock_svr.py 1> c:\works\tcp.log 2>&1
@start /b cmd /c python c:\works\hue\tcpsock_svr_thp.py 1> c:\works\tcp_thp.log 2>&1
@echo "Django And TCP Socket Server All Started..."
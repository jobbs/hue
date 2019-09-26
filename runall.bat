@ECHO OFF
@start /b cmd /c python manage.py runserver 0.0.0.0:8000 1> c:\work\hue\django.log 2>&1
@start /b cmd /c python c:\work\hue\tcpsock_svr.py 1> c:\work\hue\tcp.log 2>&1
@echo "Django And TCP Socket Server All Started..."
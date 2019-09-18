from django.urls import path
from django.contrib.auth import views as auth_views
from .views import *
from .models import Room

app_name = 'hue'

urlpatterns = [
    path('', auth_views.LoginView.as_view(), name='login'),
    path('navi/', navi_list, name='navi'),
    path('emergency/', emergency, name='emergency'),
    path('emergency/data', emergency_data, name='emergency_data'),
    path('login/', auth_views.LoginView.as_view(), name='login'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    path('navi/signal', signal, name='signal'),
    path('navi/reservation', reservation, name='reservation'),
    path('navi/svg', svg, name='svg'),

]

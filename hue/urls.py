from django.urls import path
from django.contrib.auth import views as auth_views
from .views import *
from .models import Room

app_name = 'hue'

urlpatterns = [
    path('', auth_views.LoginView.as_view(), name='login'),
    path('navi/', navi_list, name='navi'),
    path('emergency/', emergency, name='emergency'),
    path('temphumpm/', temp_hum_pm, name='temp_hum_pm'),
    path('emergency/<int:alrm_uuid>', emergency_with_params, name='emergency_with_params'),
    path('emergency/data', emergency_data, name='emergency_data'),
    path('temphumpm/data', temphumpm_data, name='temphumpm_data'),
    path('emergency/call', period_call_emergency_resp, name='period_call_emergency_resp'),
    path('temphumpm/call', period_call_temphumpm_resp, name='period_call_temphumpm_resp'),
    path('login/', auth_views.LoginView.as_view(), name='login'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    path('navi/signal', signal, name='signal'),
    path('navi/reservation', reservation, name='reservation'),
    path('navi/svg', svg, name='svg')
]

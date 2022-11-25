function R = Rot_eje(k,theta)
% función que calcula una matriz de rotación (3x3) correspondiente a
% un eje unitario K y un angulo theta

kx=k(1);
ky=k(2);
kz=k(3);

St=sin(theta);
Ct=cos(theta);

Vt=(1-Ct);

R=[kx*kx*Vt+Ct,    kx*ky*Vt-kz*St, kx*kz*Vt+ky*St;
   kx*ky*Vt+kz*St,    ky*ky*Vt+Ct, ky*kz*Vt-kx*St;
   kx*kz*Vt-ky*St, ky*kz*Vt+kx*St,    kz*kz*Vt+Ct];

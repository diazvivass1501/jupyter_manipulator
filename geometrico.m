clear

L1=250;L2=220;L3=100;L4=50;
k=(-45)*(pi/180);
k1=(0)*(pi/180);
pris=100;theta1=k;pris1=0;theta2=k1;
pris2=pris1-90;


t1=denavit(pi/2,pris,0,pi/2);
t2=denavit(theta1,pris2+90,0,0);
t21=denavit(theta1,0,0,0);
t3=denavit(pi,0,0,pi/2);
t4=denavit(theta2,150,0,0);

det=t1*t2*t3*t4

x=pris1;
y=(L3+L4)*(-sin(theta1));
z=pris+((L3+L4)*cos(theta1));

R=rotacion_z(pi/2)*rotacion_x(pi/2)*rotacion_z(theta1)*rotacion_x(-pi/2)*rotacion_z(pi)*rotacion_z(theta2);
%R=rotacion_y(-pi/2)*rotacion_x(-pi/2)*rotacion_z(theta1)*rotacion_z(pi)*rotacion_x(-pi/2)*rotacion_z(theta2);
A= [ 1     0     0     x;
     0     1     0     y;
     0     0     1     z;
     0     0     0     1];
 M=A*R

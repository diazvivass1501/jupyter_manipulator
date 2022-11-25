pris=120;theta2=pi/4;pris2=120;theta4=0;
pris12=90-pris2;
L1=250;L2=220    ;L3=100,L4=50;
x=90+pris12
y=(L3+L4)*sin(theta2)
z=pris+(L3+L4)*cos(theta2)

T=[1 0 0 x;
   0 1 0 y;
   0 0 0 z;
   0 0 0 1]
M=T*rotx(pi/2)*rotz(theta2)*rotx(pi/2)*rotz(theta4)

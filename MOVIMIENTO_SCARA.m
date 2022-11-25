clc;
clear;
close all;
view(30,30);
% esta linea mejora la precision al realizar los calculos, es importante
% ponerla antes de utilizar la variable pi
%pi= sym(pi);

%declaro las dimensiones de los eslabones a usar
L1=225;L2=162.2;L3=132.5;L4=150; 
alfa1=0;
theta1=0;theta2=0;pris=-150;


A=[1 0 0 0;
   0 1 0 0;
   0 0 1 0;
   0 0 0 1];

for theta1 = 0:0.1:pi
    clf;
   t1=denavit(theta1,L1,L2,0)
   t2=denavit(theta2,0,L3,pi)
   t3=denavit(0,pris,0,0)
   T1=t1
   T2=t1*t2
   T3=T2*t3
   P0=[A(13) A(14) A(15)];
   P1=[0 0 L1];
   P2=[T1(13) T1(14) T1(15)]
   P3=[T2(13) T2(14) T2(15)]
   P4=[T3(13) T3(14) T3(15)]
   dibujar_linea(P0,P1 ,'C',3); 
   hold on;
   dibujar_linea(P1,P2 ,'M',3);  
   dibujar_linea(P2,P3 ,'Y',3);  
   dibujar_linea(P3,P4 ,'R',3);  
   hold on;
   axis([-350 350 -350 350 0 400])
   view(30,30);
   pause(0.1);
end
for theta2 = 0:0.1:pi/2
    clf;
   theta1=pi;
   t1=denavit(theta1,L1,L2,0)
   t2=denavit(theta2,0,L3,pi)
   t3=denavit(0,pris,0,0)
   T1=t1
   T2=t1*t2
   T3=T2*t3
   P0=[A(13) A(14) A(15)];
   P1=[0 0 L1];
   P2=[T1(13) T1(14) T1(15)]
   P3=[T2(13) T2(14) T2(15)]
   P4=[T3(13) T3(14) T3(15)]
   dibujar_linea(P0,P1 ,'C',3); 
   hold on;
   dibujar_linea(P1,P2 ,'M',3);  
   dibujar_linea(P2,P3 ,'Y',3);  
   dibujar_linea(P3,P4 ,'R',3);  
   hold on;
   axis([-350 350 -350 350 0 400])
   view(30,30);
   pause(0.1);
end

for pris1 = 0:10:150
    theta3=0
   clf
   theta1=pi;
   theta2=pi/2
   t1=denavit(theta1,L1,L2,0)
   t2=denavit(theta2,0,L3,pi)
   t3=denavit(0,pris1,0,0)
   t3_1=denavit(0,pris+pris1,0,0)
   t4=denavit(theta3,L4,0,0)
   T1=t1
   T2=t1*t2
   T3=T2*t3
   T3_1=T3*t3_1
   T4=T3_1*t4
   
   P0=[A(13) A(14) A(15)];
   P1=[0 0 L1];
   P2=[T1(13) T1(14) T1(15)]
   P3=[T2(13) T2(14) T2(15)]
   P4=[T3(13) T3(14) T3(15)]
   P5=[T3_1(13) T3_1(14) T3_1(15)]

   
   
   dibujar_linea(P0,P1 ,'C',3); 
   hold on;
   dibujar_linea(P1,P2 ,'M',3);  
   dibujar_linea(P2,P3 ,'Y',3);  
   dibujar_linea(P3,P4 ,'R',3);  
   dibujar_linea(P4,P5 ,'R',3); 
   hold on;
   axis([-350 350 -350 350 0 400])
   view(30,30);
   pause(0.1);
end

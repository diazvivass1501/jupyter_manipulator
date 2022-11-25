%----------- limpamos pantalla y cerramos ventanas ------------------------

clc;clear;close all;

%---------declaro las dimensiones de los eslabones a usar------------------
L1=250;L2=220;L3=100;L4=50;

%----------Declaramos la distanica q debe moverse los prismaticos y los
%rotacionales.-------
disp('Valores de 0 a 160');
Apris=input('Prismatico N°1: ');
disp('Rotacion Negativa -90 a 0');
pp=input('Rotacional N°1: ');
Atheta1=(pp)*(pi/180);
disp('Valores de 0 a 120');
Apris2=input('Prismatico N°2: ')+90;
pp2=input('Rotacional N°2: ');
Atheta2=(pp2)*(pi/180);


%% --------------------DIRECTA DEL MANIPULADOR JUPYTER----------------------
%geometrico


x=Apris2;
y=(L3+L4)*(-sin(Atheta1));
z=Apris+((L3+L4)*cos(Atheta1));

R=rotacion_z(pi/2)*rotacion_x(pi/2)*rotacion_z(Atheta1)*rotacion_x(-pi/2)*rotacion_z(pi)*rotacion_z(Atheta2);
A= [ 1     0     0     x;
     0     1     0     y;
     0     0     1     z;
     0     0     0     1];
 M=A*R


%% denavit
% -----------------Primera Articulacion Prismatica-------------------------

for pris=0:10:Apris
    clf
theta1=0;theta2=0;pris2=90;
A=[1 0 0 0;
   0 1 0 0;
   0 0 1 0;
   0 0 0 1];   

t1=denavit(pi/2,pris,0,pi/2);
t2=denavit(theta1,pris2,0,0);
t21=denavit(theta1,0,0,0);
t3=denavit(pi,0,0,pi/2);
t4=denavit(theta2,150,0,0);

T1=t1;
T1_2=t1*t21;
T2=t1*t2;
T3=T2*t3;
T4=T3*t4;

%------------------------- STL -----------------------


base=Load_STL('BASE.STL');
base_sr1=Load_STL('BASE SR1.STL');
base_pr=Load_STL('BASAE PR.STL');
base_r2=Load_STL('BASE R2.STL');
base_final=Load_STL('FINAL.STL');

H=eye(4);
Aa=[1 0 0 -37.4;
   0 1 0 -35;
   0 0 1 -20;
   0 0 0 1];  

TR1=[1 0 0 -30;
   0 1 0 -30;
   0 0 1 -36;
   0 0 0 1]; 

TR2=[1 0 0 -30;
   0 1 0 -30;
   0 0 1 5;
   0 0 0 1]; 

TR3=[1 0 0 -30;
   0 1 0 -15;
   0 0 1 -40;
   0 0 0 1]; 

TR4=[1 0 0 -30;
   0 1 0 -30;
   0 0 1 22;
   0 0 0 1]; 

TTR=T1*TR1;
TTR2=T1_2*TR2;
TTR3=T2*TR3;
TTR4=T4*TR4;
eslabon_STL(Aa,base,'w');
eslabon_STL(TTR,base_sr1,'w');
eslabon_STL(TTR2,base_pr,'w');
eslabon_STL(TTR3,base_r2,'w');
eslabon_STL(TTR4,base_final,'w');
camlight('left')



%-----------------------------------------------------

dibujar_sistema_coordenadas(A,60,'0');
hold on;
dibujar_sistema_coordenadas(T1,60,'1');
hold on;
dibujar_sistema_coordenadas(T2,60,'2');
hold on;
dibujar_sistema_coordenadas(T3,60,'3');
hold on;
dibujar_sistema_coordenadas(T4,60,'4');
hold on;

P0=[A(13) A(14) A(15)];
P1=[0 0 250];
P21=[200 0 pris];
P2=[T1(13) T1(14) T1(15)];
P3=[T2(13) T2(14) T2(15)];
P4=[T3(13) T3(14) T3(15)];
P5=[T4(13) T4(14) T4(15)];

% dibujar_linea(P0,P1 ,'C',3); 
% hold on;
% dibujar_linea(P0,P2 ,'C',3); 
% hold on;
% dibujar_linea(P21,P3 ,'b',3); 
% hold on;
% dibujar_linea(P2,P3 ,'b',3); 
% hold on;
% dibujar_linea(P4,P5 ,'k',3); 
% hold on;

axis([-40 300 -250 250 -50 400]);
cameratoolbar('SetCoordSys','x');
cameratoolbar('SetMode','orbit');
cameratoolbar;
pause(0.1);

end
%-----------------Primera Articulacion Rotacional -------------------------

for theta1=0:-0.1:Atheta1
    clf 
theta2=0;pris2=90;
A=[1 0 0 0;
   0 1 0 0;
   0 0 1 0;
   0 0 0 1];   
pris=Apris;
t1=denavit(pi/2,pris,0,pi/2);
t2=denavit(theta1,pris2,0,0);
t21=denavit(theta1,0,0,0);
t3=denavit(pi,0,0,pi/2);
t4=denavit(theta2,150,0,0);

T1=t1;
T1_2=t1*t21;
T2=t1*t2;
T3=T2*t3;
T4=T3*t4;

%------------------------- STL -----------------------


base=Load_STL('BASE.STL');
base_sr1=Load_STL('BASE SR1.STL');
base_pr=Load_STL('BASAE PR.STL');
base_r2=Load_STL('BASE R2.STL');
base_final=Load_STL('FINAL.STL');

H=eye(4);
Aa=[1 0 0 -37.4;
   0 1 0 -35;
   0 0 1 -20;
   0 0 0 1];  

TR1=[1 0 0 -30;
   0 1 0 -30;
   0 0 1 -36;
   0 0 0 1]; 

TR2=[1 0 0 -30;
   0 1 0 -30;
   0 0 1 5;
   0 0 0 1]; 

TR3=[1 0 0 -30;
   0 1 0 -15;
   0 0 1 -40;
   0 0 0 1];  

TR4=[1 0 0 -30;
   0 1 0 -30;
   0 0 1 22;
   0 0 0 1]; 

TTR=T1*TR1;
TTR2=T1_2*TR2;
TTR3=T2*TR3;
TTR4=T4*TR4;
eslabon_STL(Aa,base,'w');
eslabon_STL(TTR,base_sr1,'w');
eslabon_STL(TTR2,base_pr,'w');
eslabon_STL(TTR3,base_r2,'w');
eslabon_STL(TTR4,base_final,'w');
camlight('left')



%-----------------------------------------------------

dibujar_sistema_coordenadas(A,60,'0');
hold on;
dibujar_sistema_coordenadas(T1,60,'1');
hold on;
dibujar_sistema_coordenadas(T2,60,'2');
hold on;
dibujar_sistema_coordenadas(T3,60,'3');
hold on;
dibujar_sistema_coordenadas(T4,60,'4');
hold on;


P0=[A(13) A(14) A(15)];
P1=[0 0 250];
P21=[200 0 pris];
P2=[T1(13) T1(14) T1(15)];
P3=[T2(13) T2(14) T2(15)];
P4=[T3(13) T3(14) T3(15)];
P5=[T4(13) T4(14) T4(15)];

% dibujar_linea(P0,P1 ,'C',3); 
% hold on;
% dibujar_linea(P0,P2 ,'C',3); 
% hold on;
% dibujar_linea(P21,P3 ,'b',3); 
% hold on;
% dibujar_linea(P2,P3 ,'b',3); 
% hold on;
% dibujar_linea(P4,P5 ,'k',3); 
% hold on;

axis([-40 300 -250 250 -50 400]);
cameratoolbar('SetCoordSys','x');
cameratoolbar('SetMode','orbit');
cameratoolbar;
pause(0.1);
   
end

%----------------- Segunda Articulacion Prismatica-------------------------
for pris2=90:10:Apris2
    clf
        clf
A=[1 0 0 0;
   0 1 0 0;
   0 0 1 0;
   0 0 0 1]; 

pris=Apris;
theta1=Atheta1;
theta2=0;

t1=denavit(pi/2,pris,0,pi/2);
t2=denavit(theta1,pris2,0,0);
t21=denavit(theta1,0,0,0);
t3=denavit(pi,0,0,pi/2);
t4=denavit(theta2,150,0,0);

T1=t1;
T1_2=t1*t21;
T2=t1*t2;
T3=T2*t3;
T4=T3*t4;

%------------------------- STL -----------------------


base=Load_STL('BASE.STL');
base_sr1=Load_STL('BASE SR1.STL');
base_pr=Load_STL('BASAE PR.STL');
base_r2=Load_STL('BASE R2.STL');
base_final=Load_STL('FINAL.STL');

H=eye(4);
Aa=[1 0 0 -37.4;
   0 1 0 -35;
   0 0 1 -20;
   0 0 0 1];  

TR1=[1 0 0 -30;
   0 1 0 -30;
   0 0 1 -36;
   0 0 0 1]; 

TR2=[1 0 0 -30;
   0 1 0 -30;
   0 0 1 5;
   0 0 0 1]; 

TR3=[1 0 0 -30;
   0 1 0 -15;
   0 0 1 -40;
   0 0 0 1]; 

TR4=[1 0 0 -30;
   0 1 0 -30;
   0 0 1 22;
   0 0 0 1]; 

TTR=T1*TR1;
TTR2=T1_2*TR2;
TTR3=T2*TR3;
TTR4=T4*TR4;
eslabon_STL(Aa,base,'w');
eslabon_STL(TTR,base_sr1,'w');
eslabon_STL(TTR2,base_pr,'w');
eslabon_STL(TTR3,base_r2,'w');
eslabon_STL(TTR4,base_final,'w');
camlight('left')



%-----------------------------------------------------


dibujar_sistema_coordenadas(A,60,'0');
hold on;
dibujar_sistema_coordenadas(T1,60,'1');
hold on;
dibujar_sistema_coordenadas(T2,60,'2');
hold on;
dibujar_sistema_coordenadas(T3,90,'3');
hold on;
dibujar_sistema_coordenadas(T4,60,'4');
hold on;


P0=[A(13) A(14) A(15)];
P1=[0 0 250];
P21=[200 0 pris];
P2=[T1(13) T1(14) T1(15)];
P3=[T2(13) T2(14) T2(15)];
P4=[T3(13) T3(14) T3(15)];
P5=[T4(13) T4(14) T4(15)];

% dibujar_linea(P0,P1 ,'C',3); 
% hold on;
% dibujar_linea(P0,P2 ,'C',3); 
% hold on;
% dibujar_linea(P21,P3 ,'b',3); 
% hold on;
% dibujar_linea(P2,P3 ,'b',3); 
% hold on;
% dibujar_linea(P4,P5 ,'k',3); 
% hold on;

axis([-40 300 -250 250 -50 400]);
cameratoolbar('SetCoordSys','x');
cameratoolbar('SetMode','orbit');
cameratoolbar;
pause(0.1);
end


%----------------- Segunda Articulacion Rotacional ------------------------
if Atheta2 >=0
    for theta2=0:0.1*pi:Atheta2
        clf


    A=[1 0 0 0;
       0 1 0 0;
       0 0 1 0;
       0 0 0 1];   
    pris=Apris;
    t1=denavit(pi/2,pris,0,pi/2);
    t2=denavit(theta1,pris2,0,0);
    t21=denavit(theta1,0,0,0);
    t3=denavit(pi,0,0,pi/2);
    t4=denavit(theta2,150,0,0);

    T1=t1;
    T1_2=t1*t21;
    T2=t1*t2;
    T3=T2*t3;
    T4=T3*t4;

    %------------------------- STL -----------------------


    base=Load_STL('BASE.STL');
    base_sr1=Load_STL('BASE SR1.STL');
    base_pr=Load_STL('BASAE PR.STL');
    base_r2=Load_STL('BASE R2.STL');
    base_final=Load_STL('FINAL.STL');

    H=eye(4);
    Aa=[1 0 0 -37.4;
       0 1 0 -35;
       0 0 1 -20;
       0 0 0 1];  

    TR1=[1 0 0 -30;
       0 1 0 -30;
       0 0 1 -36;
       0 0 0 1]; 

    TR2=[1 0 0 -30;
       0 1 0 -30;
       0 0 1 5;
       0 0 0 1]; 

    TR3=[1 0 0 -30;
       0 1 0 -15;
       0 0 1 -40;
       0 0 0 1];  

    TR4=[1 0 0 -30;
       0 1 0 -30;
       0 0 1 22;
       0 0 0 1]; 

    TTR=T1*TR1;
    TTR2=T1_2*TR2;
    TTR3=T2*TR3;
    TTR4=T4*TR4;
    eslabon_STL(Aa,base,'w');
    eslabon_STL(TTR,base_sr1,'w');
    eslabon_STL(TTR2,base_pr,'w');
    eslabon_STL(TTR3,base_r2,'w');
    eslabon_STL(TTR4,base_final,'w');
    camlight('left')



    %-----------------------------------------------------

    dibujar_sistema_coordenadas(A,60,'0');
    hold on;
    dibujar_sistema_coordenadas(T1,60,'1');
    hold on;
    dibujar_sistema_coordenadas(T2,60,'2');
    hold on;
    dibujar_sistema_coordenadas(T3,90,'3');
    hold on;
    dibujar_sistema_coordenadas(T4,60,'4');
    hold on;


    P0=[A(13) A(14) A(15)];
    P1=[0 0 250];
    P21=[200 0 pris];
    P2=[T1(13) T1(14) T1(15)];
    P3=[T2(13) T2(14) T2(15)];
    P4=[T3(13) T3(14) T3(15)];
    P5=[T4(13) T4(14) T4(15)];

    % dibujar_linea(P0,P1 ,'C',3); 
    % hold on;
    % dibujar_linea(P0,P2 ,'C',3); 
    % hold on;
    % dibujar_linea(P21,P3 ,'b',3); 
    % hold on;
    % dibujar_linea(P2,P3 ,'b',3); 
    % hold on;
    % dibujar_linea(P4,P5 ,'k',3); 
    % hold on;

    axis([-40 300 -250 250 -50 400]);
    cameratoolbar('SetCoordSys','x');
    cameratoolbar('SetMode','orbit');
    cameratoolbar;
    pause(0.1);

    end
end

if Atheta2 <0
    for theta2=0:-0.1*pi:Atheta2
        clf


    A=[1 0 0 0;
       0 1 0 0;
       0 0 1 0;
       0 0 0 1];   
    pris=Apris;
    t1=denavit(pi/2,pris,0,pi/2);
    t2=denavit(theta1,pris2,0,0);
    t21=denavit(theta1,0,0,0);
    t3=denavit(pi,0,0,pi/2);
    t4=denavit(theta2,150,0,0);

    T1=t1;
    T1_2=t1*t21;
    T2=t1*t2;
    T3=T2*t3;
    T4=T3*t4;

    %------------------------- STL -----------------------


    base=Load_STL('BASE.STL');
    base_sr1=Load_STL('BASE SR1.STL');
    base_pr=Load_STL('BASAE PR.STL');
    base_r2=Load_STL('BASE R2.STL');
    base_final=Load_STL('FINAL.STL');

    H=eye(4);
    Aa=[1 0 0 -37.4;
       0 1 0 -35;
       0 0 1 -20;
       0 0 0 1];  

    TR1=[1 0 0 -30;
       0 1 0 -30;
       0 0 1 -36;
       0 0 0 1]; 

    TR2=[1 0 0 -30;
       0 1 0 -30;
       0 0 1 5;
       0 0 0 1]; 

    TR3=[1 0 0 -30;
       0 1 0 -15;
       0 0 1 -40;
       0 0 0 1];  

    TR4=[1 0 0 -30;
       0 1 0 -30;
       0 0 1 22;
       0 0 0 1]; 

    TTR=T1*TR1;
    TTR2=T1_2*TR2;
    TTR3=T2*TR3;
    TTR4=T4*TR4;
    eslabon_STL(Aa,base,'w');
    eslabon_STL(TTR,base_sr1,'w');
    eslabon_STL(TTR2,base_pr,'w');
    eslabon_STL(TTR3,base_r2,'w');
    eslabon_STL(TTR4,base_final,'w');
    camlight('left')



    %-----------------------------------------------------

    dibujar_sistema_coordenadas(A,60,'0');
    hold on;
    dibujar_sistema_coordenadas(T1,60,'1');
    hold on;
    dibujar_sistema_coordenadas(T2,60,'2');
    hold on;
    dibujar_sistema_coordenadas(T3,60,'3');
    hold on;
    dibujar_sistema_coordenadas(T4,60,'4');
    hold on;


    P0=[A(13) A(14) A(15)];
    P1=[0 0 250];
    P21=[200 0 pris];
    P2=[T1(13) T1(14) T1(15)];
    P3=[T2(13) T2(14) T2(15)];
    P4=[T3(13) T3(14) T3(15)];
    P5=[T4(13) T4(14) T4(15)];

    % dibujar_linea(P0,P1 ,'C',3); 
    % hold on;
    % dibujar_linea(P0,P2 ,'C',3); 
    % hold on;
    % dibujar_linea(P21,P3 ,'b',3); 
    % hold on;
    % dibujar_linea(P2,P3 ,'b',3); 
    % hold on;
    % dibujar_linea(P4,P5 ,'k',3); 
    % hold on;

    axis([-40 300 -250 250 -50 400]);
    cameratoolbar('SetCoordSys','x');
    cameratoolbar('SetMode','orbit');
    cameratoolbar;
    pause(0.1);

    end
end

clf


A=[1 0 0 0;
   0 1 0 0;
   0 0 1 0;
   0 0 0 1];   
pris=Apris;
t1=denavit(pi/2,Apris,0,pi/2);
t2=denavit(Atheta1,Apris2,0,0);
t21=denavit(Atheta1,0,0,0);
t3=denavit(pi,0,0,pi/2);
t4=denavit(Atheta2,150,0,0);

T1=t1;
T1_2=t1*t21;
T2=t1*t2;
T3=T2*t3;
T4=T3*t4;
DENAVIT_F=T4

%------------------------- STL -----------------------


base=Load_STL('BASE.STL');
base_sr1=Load_STL('BASE SR1.STL');
base_pr=Load_STL('BASAE PR.STL');
base_r2=Load_STL('BASE R2.STL');
% base_final=Load_STL('FINAL.STL');

H=eye(4);
Aa=[1 0 0 -37.4;
   0 1 0 -35;
   0 0 1 -20;
   0 0 0 1];  

TR1=[1 0 0 -30;
   0 1 0 -30;
   0 0 1 -36;
   0 0 0 1]; 

TR2=[1 0 0 -30;
   0 1 0 -30;
   0 0 1 5;
   0 0 0 1]; 

TR3=[1 0 0 -30;
   0 1 0 -15;
   0 0 1 -40;
   0 0 0 1];  

TR4=[1 0 0 -30;
   0 1 0 -30;
   0 0 1 22;
   0 0 0 1]; 

TTR=T1*TR1;
TTR2=T1_2*TR2;
TTR3=T2*TR3;
TTR4=T4*TR4;
eslabon_STL(Aa,base,'w');
eslabon_STL(TTR,base_sr1,'w');
eslabon_STL(TTR2,base_pr,'w');
eslabon_STL(TTR3,base_r2,'w');
eslabon_STL(TTR4,base_final,'w');
camlight('left')



%-----------------------------------------------------

dibujar_sistema_coordenadas(A,60,'0');
hold on;
dibujar_sistema_coordenadas(T1,60,'1');
hold on;
dibujar_sistema_coordenadas(T2,60,'2');
hold on;
dibujar_sistema_coordenadas(T3,60,'3');
hold on;
dibujar_sistema_coordenadas(T4,60,'4');
hold on;


P0=[A(13) A(14) A(15)];
P1=[0 0 250];
P21=[200 0 pris];
P2=[T1(13) T1(14) T1(15)];
P3=[T2(13) T2(14) T2(15)];
P4=[T3(13) T3(14) T3(15)];
P5=[T4(13) T4(14) T4(15)];

% dibujar_linea(P0,P1 ,'C',3); 
% hold on;
% dibujar_linea(P0,P2 ,'C',3); 
% hold on;
% dibujar_linea(P21,P3 ,'b',3); 
% hold on;
% dibujar_linea(P2,P3 ,'b',3); 
% hold on;
% dibujar_linea(P4,P5 ,'k',3); 
% hold on;

axis([-40 300 -250 250 -50 400]);
cameratoolbar('SetCoordSys','x');
cameratoolbar('SetMode','orbit');
cameratoolbar;
figure(2)
A=[1 0 0 0;
   0 1 0 0;
   0 0 1 0;
   0 0 0 1];   
pris=Apris;
t1=denavit(pi/2,Apris,0,pi/2);
t2=denavit(Atheta1,Apris2,0,0);
t21=denavit(Atheta1,0,0,0);
t3=denavit(pi,0,0,pi/2);
t4=denavit(Atheta2,150,0,0);

T1=t1;
T1_2=t1*t21;
T2=t1*t2;
T3=T2*t3;
T4=T3*t4;

%------------------------- STL -----------------------


base=Load_STL('BASE.STL');
base_sr1=Load_STL('BASE SR1.STL');
base_pr=Load_STL('BASAE PR.STL');
base_r2=Load_STL('BASE R2.STL');
% base_final=Load_STL('FINAL.STL');

H=eye(4);
Aa=[1 0 0 -37.4;
   0 1 0 -35;
   0 0 1 -20;
   0 0 0 1];  

TR1=[1 0 0 -30;
   0 1 0 -30;
   0 0 1 -36;
   0 0 0 1]; 

TR2=[1 0 0 -30;
   0 1 0 -30;
   0 0 1 5;
   0 0 0 1]; 

TR3=[1 0 0 -30;
   0 1 0 -15;
   0 0 1 -40;
   0 0 0 1];  

TR4=[1 0 0 -30;
   0 1 0 -30;
   0 0 1 22;
   0 0 0 1]; 

TTR=T1*TR1;
TTR2=T1_2*TR2;
TTR3=T2*TR3;
TTR4=T4*TR4;
eslabon_STL(Aa,base,'w');
eslabon_STL(TTR,base_sr1,'w');
eslabon_STL(TTR2,base_pr,'w');
eslabon_STL(TTR3,base_r2,'w');
% eslabon_STL(TTR4,base_final,'w');
camlight('left')



%-----------------------------------------------------

dibujar_sistema_coordenadas(A,60,'0');
hold on;
dibujar_sistema_coordenadas(T1,60,'1');
hold on;
dibujar_sistema_coordenadas(T2,60,'2');
hold on;
dibujar_sistema_coordenadas(T3,60,'3');
hold on;
dibujar_sistema_coordenadas(T4,60,'4');
hold on;


P0=[A(13) A(14) A(15)];
P1=[0 0 250];
P21=[200 0 pris];
P2=[T1(13) T1(14) T1(15)];
P3=[T2(13) T2(14) T2(15)];
P4=[T3(13) T3(14) T3(15)];
P5=[T4(13) T4(14) T4(15)];

% dibujar_linea(P0,P1 ,'C',3); 
% hold on;
% dibujar_linea(P0,P2 ,'C',3); 
% hold on;
% dibujar_linea(P21,P3 ,'b',3); 
% hold on;
% dibujar_linea(P2,P3 ,'b',3); 
% hold on;
% dibujar_linea(P4,P5 ,'k',3); 
% hold on;

axis([-40 300 -250 250 -50 400]);
cameratoolbar('SetCoordSys','x');
cameratoolbar('SetMode','orbit');
cameratoolbar;



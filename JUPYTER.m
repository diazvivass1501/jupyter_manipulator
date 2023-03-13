%----------- limpamos pantalla y cerramos ventanas ------------------------

clc;clear;close all;

%% ---------declaro las dimensiones de los eslabones a usar------------------
L1=250;L2=220;L3=120;L4=50;

%% ----------Declaramos la distanica q debe moverse los prismaticos y los
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


% --------------------DIRECTA DEL MANIPULADOR JUPYTER----------------------
%% __________________________ GEOMETRICO ______________________________

[GEOMETRICO]=round(GEOMETRICO_JUPYTER(Apris2,L3,L4,Atheta1,Atheta2,Apris))

%% ______________________________DENAVITH_______________________________
%% -----------------Primera Articulacion Prismatica-------------------------

for pris=0:10:Apris
    clf
theta1=0;theta2=0;pris2=90;

[T1,T1_2,T2,T3,T4] = denavith_jupyter(pris,pris2,theta1,theta2);

%------------------------- STL -----------------------

piezas_stl(T1,T2,T1_2,T4);

%-----------------------------------------------------
A=eye(4);
coordenadas(A,T1,T2,T3,T4)

end
%% -----------------Primera Articulacion Rotacional -------------------------

for theta1=0:-0.1:Atheta1
    clf 
theta2=0;pris2=90;
pris=Apris;

[T1,T1_2,T2,T3,T4] = denavith_jupyter(pris,pris2,theta1,theta2);

%------------------------- STL -----------------------

piezas_stl(T1,T2,T1_2,T4);

%-----------------------------------------------------
A=eye(4);
coordenadas(A,T1,T2,T3,T4)
 
end

%% ----------------- Segunda Articulacion Prismatica-------------------------
for pris2=90:10:Apris2
    clf
pris=Apris;
theta1=Atheta1;
theta2=0;

[T1,T1_2,T2,T3,T4] = denavith_jupyter(pris,pris2,theta1,theta2);

%------------------------- STL -----------------------

piezas_stl(T1,T2,T1_2,T4);

%-----------------------------------------------------
A=eye(4);
coordenadas(A,T1,T2,T3,T4)

end


%% ----------------- Segunda Articulacion Rotacional ------------------------

for theta2=0:0.1*pi:Atheta2
    clf

pris=Apris;

[T1,T1_2,T2,T3,T4] = denavith_jupyter(pris,pris2,theta1,theta2);

%------------------------- STL -----------------------

piezas_stl(T1,T2,T1_2,T4);

%-----------------------------------------------------
A=eye(4);
coordenadas(A,T1,T2,T3,T4)

end


clf


A=[1 0 0 0;
   0 1 0 0;
   0 0 1 0;
   0 0 0 1];   
t1=denavit(pi/2,Apris,0,pi/2);
t2=denavit(Atheta1,Apris2,0,0);
t21=denavit(Atheta1,0,0,0);
t3=denavit(pi,0,0,pi/2);
t4=denavit(Atheta2,198,0,0);

T1=t1;
T1_2=t1*t21;
T2=t1*t2;
T3=T2*t3;
T4=T3*t4;

A01=t1
A12=t2
A23=t3
A34=t4
DENAVIT_F=T4

%------------------------- STL -----------------------

piezas_stl(T1,T2,T1_2,T4);

%-----------------------------------------------------
A=eye(4);
coordenadas(A,T1,T2,T3,T4)

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
t4=denavit(Atheta2,198,0,0);

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

[Aa,TTR,TTR2,TTR3,TTR4]=piezas_stl(T1,T2,T1_2,T4);

eslabon_STL(Aa,base,'w');
eslabon_STL(TTR,base_sr1,'w');
eslabon_STL(TTR2,base_pr,'w');
eslabon_STL(TTR3,base_r2,'w');
% eslabon_STL(TTR4,base_final,'w');

%-----------------------------------------------------

coordenadas(A,T1,T2,T3,T4)

%% ---------------CINEMÁTICA INVERSA ANALÍTICA

DENAVIT_F=T4

nx=DENAVIT_F(1,1);
ny=DENAVIT_F(2,1);
nz=DENAVIT_F(3,1);

ox=DENAVIT_F(1,2);
oy=DENAVIT_F(2,2);
oz=DENAVIT_F(3,2);

ax=DENAVIT_F(1,3);
ay=DENAVIT_F(2,3);
az=DENAVIT_F(3,3);

px=DENAVIT_F(1,4);
py=DENAVIT_F(2,4);
pz=DENAVIT_F(3,4);

%Movimientos en las Articulaciones
Mov_Artic = CALCULOS_INVERSA(nx,ny,nz,ox,oy,oz,ax,ay,az,px,py,pz)
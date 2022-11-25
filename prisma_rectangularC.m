function []=prisma_rectangularC(K,ancho_x,largo_y,alto_z,color)
% Esta función se utiliza para dibujar un prisma rectangular con el cruce
% de todos los ejes de simetría en el origen. Se requiere tener instalado
% el toolbox freezeColors para exportar a objeto U3D
% 
% Ejemplo de uso: []=prisma_rectangularC(trans(1,1,1),0.8,0.5,0.7,'red')
%
% Parámetros de la función
% K es la matriz de transformación con respecto al origen
% ancho_x,largo_y,alto_z son los parámetros del sólido
% color es uno de los colores básicos RGB y gris

% Autor: Dr. César A. Chávez-Olivares 
% Email: iescd.chavez@gmail.com, cesar.chavez@edu.uaa.mx

x1=ancho_x/2;
x2=-x1;
y1=largo_y/2;
y2=-y1;
z1=alto_z/2;
z2=-z1;
XX=[x1 x1 x2 x2 x1;
    x1 x1 x2 x2 x1];
YY=[y1 y2 y2 y1 y1;
    y1 y2 y2 y1 y1];
ZZ=[z1 z1 z1 z1 z1;
    z2 z2 z2 z2 z2];
p1=[XX(1,:);YY(1,:);ZZ(1,:);ones(1,length(XX))];
p2=[XX(2,:);YY(2,:);ZZ(2,:);ones(1,length(XX))];
p1K=K*p1;
p2K=K*p2;
Xc=[p1K(1,:); p2K(1,:)];
Yc=[p1K(2,:); p2K(2,:)];
Zc=[p1K(3,:); p2K(3,:)];
%surf(Xc,Yc,Zc,'FaceColor','red','EdgeColor','black');
surf(Xc,Yc,Zc);
%colormap([1 0 0]);
if (strcmp(color,'red'))
   colormap([1 0 0]);
elseif (strcmp(color,'green'))
   colormap([0 1 0]);
elseif (strcmp(color,'blue'))
    colormap([0 0 1]);
else
    colormap(gray)
end
shading interp;
%camlight left;
freezeColors 

x1=ancho_x/2;
x2=-x1;
y1=alto_z/2;
y2=-y1;
z1=largo_y/2;
z2=-z1;
XX=[x1 x1 x2 x2 x1;
    x1 x1 x2 x2 x1];
YY=[y1 y2 y2 y1 y1;
    y1 y2 y2 y1 y1];
ZZ=[z1 z1 z1 z1 z1;
    z2 z2 z2 z2 z2];
p1=[XX(1,:);YY(1,:);ZZ(1,:);ones(1,length(XX))];
p2=[XX(2,:);YY(2,:);ZZ(2,:);ones(1,length(XX))];
p1K=(K*rotx(-pi/2))*p1;
p2K=(K*rotx(-pi/2))*p2;
Xc=[p1K(1,:); p2K(1,:)];
Yc=[p1K(2,:); p2K(2,:)];
Zc=[p1K(3,:); p2K(3,:)];
%surf(Xc,Yc,Zc,'FaceColor','red','EdgeColor','black');
surf(Xc,Yc,Zc);
%colormap([1 0 0]);
if (strcmp(color,'red'))
   colormap([1 0 0]);
elseif (strcmp(color,'green'))
   colormap([0 1 0]);
elseif (strcmp(color,'blue'))
    colormap([0 0 1]);
else
    colormap(gray)
end
shading interp;
%camlight left;
freezeColors 
function []=cilindro(K,alto,radio,dif)
% Esta función se utiliza para dibujar un cilindro con el eje de simetría 
% en Z y con offset negativo en dif. Se requiere tener instalado el toolbox
% freezeColors para exportar a objeto U3D
% 
% Ejemplo de uso: cilindro(trans(1,1,1),1,0.5,0.5) 
%
% Parámetros de la función
% K es la matriz de transformación con respecto al origen
% alto y radio son los parámetros del cilindro 
% dif es el offset negativo con respecto al origen
% Nota: falta editarlo para que acepte colores

% Autor: Dr. César A. Chávez-Olivares 
% Email: iescd.chavez@gmail.com, cesar.chavez@edu.uaa.mx

[Xc,Yc,Zc]=cylinder(radio);
zc=(Zc*alto)-dif;
xc=Xc(1,:);
yc=Yc(1,:);
zc1=zc(1,:);
zc2=zc(2,:);
p1=[xc;yc;zc1;ones(1,length(zc1))];
p2=[xc;yc;zc2;ones(1,length(zc2))];
p1K=K*p1;
p2K=K*p2;
Xc=[p1K(1,:); p2K(1,:)];
Yc=[p1K(2,:); p2K(2,:)];
Zc=[p1K(3,:); p2K(3,:)];
%surf(Xc,Yc,Zc,'FaceColor','blue','EdgeColor','none');
surf(Xc,Yc,Zc);
color=[255 255 50]/255; % amarillo FANUC jeje
colormap(color);
shading interp;
%camlight left;
freezeColors 

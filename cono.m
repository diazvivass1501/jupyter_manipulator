function []=cono(K,alto,radio,color)
% Esta función se utiliza para dibujar un cono con el eje de simetría en Z
% y partiendo del origen. Se requiere tener instalado el toolbox
% freezeColors para exportar a objeto U3D
% 
% Ejemplo de uso: cono(trans(1,1,1),0.8,0.5,'red')
%
% Parámetros de la función
% K es la matriz de transformación con respecto al origen
% alto es la altura del cono
% radio es el radio de la base
% color es uno de los colores básicos RGB y gris

% Autor: Dr. César A. Chávez-Olivares 
% Email: iescd.chavez@gmail.com, cesar.chavez@edu.uaa.mx

[Xc,Yc,Zc]=cylinder(radio);
zc=(Zc*alto);
xc=Xc(1,:);
yc=Yc(1,:);
zc1=zc(1,:);
zc2=zc(2,:);
p1=[xc;yc;zc1;ones(1,length(zc1))];
p2=[xc*0;yc*0;zc2;ones(1,length(zc2))];
p1K=K*p1;
p2K=K*p2;
Xc=[p1K(1,:); p2K(1,:)];
Yc=[p1K(2,:); p2K(2,:)];
Zc=[p1K(3,:); p2K(3,:)];
%surf(Xc,Yc,Zc,'FaceColor',color,'EdgeColor','none');
surf(Xc,Yc,Zc);
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
%surf(Xc,Yc,Zc,'FaceColor',color,'EdgeColor',color);
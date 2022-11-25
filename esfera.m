function []=esfera(K,radio,color)
% K es la matriz de cinematica con respecto a [0,0,0]

% Esta función se utiliza para dibujar una esfera cuyo centro coincide con
% el origen del sistema relacionado con la matriz de transformación K.
% Se requiere tener instalado el toolbox freezeColors para exportar a
% objeto U3D
% 
% Ejemplo de uso: []=esfera(trans(1,1,1),1.1,'red')
%
% Parámetros de la función
% K es la matriz de transformación con respecto al origen
% radio es el radio de la esfera
% color es uno de los colores básicos RGB y gris

% Autor: Dr. César A. Chávez-Olivares 
% Email: iescd.chavez@gmail.com, cesar.chavez@edu.uaa.mx

[Xs,Ys,Zs]=sphere;
Xs=Xs*radio;
Ys=Ys*radio;
Zs=Zs*radio;
p=K*([0 0 0 1]');
p=p';
Xs=Xs+p(1);
Ys=Ys+p(2);
Zs=Zs+p(3);
%surf(Xs,Ys,Zs,'FaceColor',color,'EdgeColor','none');
surf(Xs,Ys,Zs);
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
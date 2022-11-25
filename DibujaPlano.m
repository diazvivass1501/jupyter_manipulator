unction []=DibujaPlano(LX,LY,K,nalpha)
% Esta función se utiliza para dibujar un plano cuyo origen está
% relacionado con la matriz de transformación homogenea K. El plano se
% dibuja en XY en coordenadas positivas. Se requiere tener instalado el 
% toolbox freezeColors para exportar a objeto U3D
% 
% Ejemplo de uso: DibujaPlano(0.5,0.7,trans(1,1,1))
%
% Parámetros de la función
% LX es la longitud en X
% LY es la longitud en Y
% K es la matriz de transformación con respecto al origen
% nalpha transparencia (0 a 1, 1 es opaco)
% Nota: falta editarla para que dibuje el plano con diferentes colores

% Autor: Dr. César A. Chávez-Olivares 
% Email: iescd.chavez@gmail.com, cesar.chavez@edu.uaa.mx

Datos=[0 LX  0 LX LX/2;
       0  0 LY LY LX/2;
       0  0  0  0    0;
       1  1  1  1    1];

Datos2=[0 LX LX  0  0;
        0  0 LY LY  0;
        0  0  0  0  0;
        1  1  1  1  1];


Plano=K*Datos;
Contorno=K*Datos2;

xx=Plano(1,:);
yy=Plano(2,:);
zz=Plano(3,:);

tri=delaunay(xx,yy);
s=trisurf(tri,xx,yy,zz);

%color=[1 0.6 0]; % naranja raro
%color=[1 0 0]; % rojo
%color=[0 1 0]; % verde
color=[0 0 1]; % azul
colormap(color);

%shading interp;
shading flat; % sin contorno

freezeColors
alpha(s,nalpha)

plot3(Contorno(1,:),Contorno(2,:),Contorno(3,:),'k');
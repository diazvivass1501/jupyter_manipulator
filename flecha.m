function []=flecha(K,alto,color)
% Esta función se utiliza para dibujar una flecha 3D, centrada en el eje z
% y partiendo del origen
% 
% Ejemplo de uso: []=flecha(trans(1,1,1),0.5,'red')
%
% Parámetros de la función
% K es la matriz de transformación con respecto al origen
% alto es la altura de la flecha
% color es uno de los colores básicos RGB 
% Nota: editar las funciones cono y tubo para agregar más colores.

% Autor: Dr. César A. Chávez-Olivares 
% Email: iescd.chavez@gmail.com, cesar.chavez@edu.uaa.mx

radio1=alto*0.018;
radio2=alto*0.05;
alto1=alto*0.15;
alto2=alto-alto1;
cono(K*transl(0,0,alto2),alto1,radio2,color)
tubo(K,alto2,radio1,color)
function []=prisma_rectangular(K,ancho_x,largo_y,alto_z,color)
% Esta función se utiliza para dibujar un prisma rectangular con el origen
% en la cara inferior al centro. Se requiere tener instalado el toolbox 
% freezeColors para exportar a objeto U3D
% 
% Ejemplo de uso: []=prisma_rectangular(trans(1,1,1),0.8,0.5,0.7,'red')
%
% Parámetros de la función
% K es la matriz de transformación con respecto al origen
% ancho_x,largo_y,alto_z son los parámetros del sólido
% color es uno de los colores básicos RGB y gris

% Autor: Dr. César A. Chávez-Olivares 
% Email: iescd.chavez@gmail.com, cesar.chavez@edu.uaa.mx

prisma_rectangularC(K*trans(0,0,alto_z/2),ancho_x,largo_y,alto_z,color)
function [po,px,py,pz]=ejes(MatA,t)
% Esta función se utiliza para calcular los extremos de los vectores
% necesarios para dibujar un sistema coordenado relacionado con la matriz
% de transformación homogénea MatA.
% 
% Ejemplo de uso: [po,px,py,pz]=ejes(trans(1,1,1),0.8) 
%
% Parámetros de la función
% MatA es la matriz de transformación con respecto al origen
% t es el tamaño de los vectores

% Autor: Dr. César A. Chávez-Olivares 
% Email: iescd.chavez@gmail.com, cesar.chavez@edu.uaa.mx

po=MatA*([0 0 0 1]');
px=MatA*([t 0 0 1]');
py=MatA*([0 t 0 1]');
pz=MatA*([0 0 t 1]');
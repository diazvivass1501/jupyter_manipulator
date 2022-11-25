function []=eslabon_STL(H,solido,RGBcolor)
% Esta función se utiliza para dibujar un objeto sólido cargado apartir de
% un archivo STL en la pose indicada por la matriz de transformación H,
% respetando la información de coordenadas del archivo.
% 
% Ejemplo de uso: eslabon_STL(rotz(pi/4),solido,[0.8 0.8 1.0])
%
% Parámetros de la función
% H es la matriz de transformación con respecto al origen
% solido es la estructura generada con la función Load_STL
% RGBcolor es el vector de color RGB normalizado de 0 a 1

% Autor: Dr. César A. Chávez-Olivares 
% Email: iescd.chavez@gmail.com, cesar.chavez@edu.uaa.mx

vn=H*[solido.vertices';
      ones(1, length(solido.vertices))];
  
patch(   'Faces',solido.faces, ...
         'Vertices',vn(1:3,:)', ...
         'FaceColor', RGBcolor, ...
         'EdgeColor', 'none',   ...
         'FaceLighting',  'gouraud', ...
         'AmbientStrength', 0.15);
     

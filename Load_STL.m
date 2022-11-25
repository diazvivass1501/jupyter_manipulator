function solido = Load_STL(archivo)
% Esta función se utiliza para leer un archivo STL y generar un objeto 
% solido (una estructura de datos). Se requiere tener instaladas las 
% funciones "stlread" y "patchslim" de Francis Esmonde-White (May 2010). 
% 
% Ejemplo de uso: solido = Load_STL('Eslabon_1.stl')
%
% La función recibe como parámetro el nombre completo del archivo

% Autor: Dr. César A. Chávez-Olivares 
% Email: iescd.chavez@gmail.com, cesar.chavez@edu.uaa.mx

field1='vertices';
field2='faces';
field3='normals';
field4='colors';
field5='STLtitle';

[v, f, n, c, stltitle] = stlread(archivo,1);
[v, f]=patchslim(v, f);

solido = struct(field1,v,field2,f,field3,n,field4,c,field5,stltitle);



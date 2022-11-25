function M=DH(theta,d,a,alpha)
% función que calcula una matriz de transformación Denavit-Hartenberg con
% los parámetros en el orden en el que se realiza la transformación.
M=rotz(theta)*transl(a,0,d)*rotx(alpha);
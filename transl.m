function r = transl(x, y, z)
% función que calcula una matriz de traslación
t = [x; y; z];
r = [eye(3) t;
 	 0 0 0  1];

function r = rotx3(t)
% función que calcula una matriz de rotación alrededor del eje x
ct = cos(t);
st = sin(t);
r = [1  0   0;
     0 ct -st;
	 0 st  ct];

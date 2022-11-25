function r = roty(t)
% función que calcula una matriz de rotación homogénea alrededor del eje y
ct = cos(t);
st = sin(t);
r = [ct 0 st 0;
	  0 1  0 0;
	-st 0 ct 0;
	  0 0  0 1];

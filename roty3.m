function r = roty3(t)
% función que calcula una matriz de rotación alrededor del eje y
ct = cos(t);
st = sin(t);
r = [ct 0 st;
	  0 1  0;
	-st 0 ct];

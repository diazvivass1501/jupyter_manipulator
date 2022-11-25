function r = rotz(t)
% función que calcula una matriz de rotación homogénea alrededor del eje z
ct = cos(t);
st = sin(t);
r = [ct	-st	0 0;
     st	 ct 0 0;
	  0   0 1 0;
	  0   0 0 1];

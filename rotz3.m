function r = rotz3(t)
% función que calcula una matriz de rotación alrededor del eje z
ct = cos(t);
st = sin(t);
r = [ct	-st	0;
     st	 ct 0;
	  0   0 1];

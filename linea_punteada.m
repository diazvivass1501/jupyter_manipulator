function []=linea_punteada(po,pf)
% función para dibujar una línea discontínua entre 2 puntos
plot3([po(1) pf(1)],[po(2) pf(2)],[po(3) pf(3)],'--k');
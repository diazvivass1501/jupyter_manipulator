function []=eslabon(po,pf,c,lw)
% función que dibuja una línea del punto inicial po al punto final pf, el
% color es determinado por c, el ancho es determinado por lw.
% Autor: Dr. César A. Chávez-Olivares 
% Email: iescd.chavez@gmail.com, cesar.chavez@edu.uaa.mx
plot3([po(1) pf(1)],[po(2) pf(2)],[po(3) pf(3)],c,'LineWidth',lw);
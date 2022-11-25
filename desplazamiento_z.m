function []=desplazamiento_z(K,altura,offsetXY,ld,off_label,tf)
% Esta función se utiliza para dibujar una flecha paralela al eje Z 
% correspondiente al sistema coordenado que ubica K con respecto al
% origen. 
%
% Ejemplo de uso: desplazamiento_z(eye(4),1,[0 -0.5],'q_1',[0 -0.8 0.5],16)
%
% Parámetros de la función
% K es la matriz de transformación con respecto al origen
% altura es la dimensión de la flecha
% offsetXY es la coordenada con respecto al sistema actual para dibujar la flecha
% ld es la etiqueta del desplazamiento en z (latex)
% off_label es la coordenada con respecto al sistema actual para colocar la etiqueta
% tf es el tamaño de la fuente

% Autor: Dr. César A. Chávez-Olivares 
% Email: iescd.chavez@gmail.com, cesar.chavez@edu.uaa.mx

po=K*[offsetXY(1); offsetXY(2); 0; 1];
pf=K*[offsetXY(1); offsetXY(2); altura; 1];

plot3([po(1) pf(1)],[po(2) pf(2)],[po(3) pf(3)],'k','LineWidth',2);

alto=altura*0.08; %0.15
radio=altura*0.03; %0.45
cono(K*transl(offsetXY(1),offsetXY(2),altura-alto),alto,radio,'gray')

posletra=K*[off_label(1); off_label(2); off_label(3); 1];
erasemode='none';
if (ld~=' ')
    text('Position',posletra(1:3),'String',['$',ld,'$'],'Interpreter','latex','Fontsize',tf);
end
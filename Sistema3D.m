function [origen]=Sistema3D(M,t,lx,ly,lz,tf)
% Esta función se utiliza para dibujar un sistema coordenado 3D
% 
% Ejemplo de uso: [origen]=Sistema3D(Rotz(pi/4),1,'x_1','y_1','z_1',12)
%
% Parámetros de la función
% M es la matriz de transformación asociada al sistema
% t es el tamaño de los ejes a dibujar
% lx es la etiqueta en el eje x (latex)
% ly es la etiqueta en el eje x (latex)
% lz es la etiqueta en el eje x (latex)
% tf es el tamaño de la fuente

% Autor: Dr. César A. Chávez-Olivares 
% Email: iescd.chavez@gmail.com, cesar.chavez@edu.uaa.mx

origen=M*([0 0 0 1]');

cx='red';
cy='green';
cz='blue';

flecha(M*roty(pi/2),t,cx)
flecha(M*rotx(-pi/2),t,cy)
flecha(M,t,cz)


tt=1.1*t;
posletrax = M*([tt  0  0 1]');
posletray = M*([ 0 tt  0 1]');
posletraz = M*([ 0  0 tt 1]');

erasemode='none';

if (lx~=' ')
    text('Position',posletrax(1:3),'String',['$',lx,'$'],'Interpreter','latex','Fontsize',tf);
end
if (ly~=' ')
    text('Position',posletray(1:3),'String',['$',ly,'$'],'Interpreter','latex','Fontsize',tf);
end
if (lz~=' ')
    text('Position',posletraz(1:3),'String',['$',lz,'$'],'Interpreter','latex','Fontsize',tf);
end
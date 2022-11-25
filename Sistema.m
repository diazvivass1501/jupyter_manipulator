function [origen]=Sistema(M,t,lx,ly,lz,tf)
% Esta función se utiliza para dibujar un sistema coordenado con líneas
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

po=M*([0 0 0 1]');
px=M*([t 0 0 1]');
py=M*([0 t 0 1]');
pz=M*([0 0 t 1]');

cx='r';
cy='g';
cz='b';
lw=2;

hold on
plot3([po(1) px(1)],[po(2) px(2)],[po(3) px(3)],cx,'LineWidth',lw);%eje x
plot3([po(1) py(1)],[po(2) py(2)],[po(3) py(3)],cy,'LineWidth',lw);%eje y
plot3([po(1) pz(1)],[po(2) pz(2)],[po(3) pz(3)],cz,'LineWidth',lw);%eje z

tt=1.1*t;
posletrax = M*([tt  0  0 1]');
posletray = M*([ 0 tt  0 1]');
posletraz = M*([ 0  0 tt 1]');

erasemode='none';
text('Position',posletrax(1:3),'erasemode',erasemode,'String',['$',lx,'$'],'Interpreter','latex','Fontsize',tf);
text('Position',posletray(1:3),'erasemode',erasemode,'String',['$',ly,'$'],'Interpreter','latex','Fontsize',tf);
text('Position',posletraz(1:3),'erasemode',erasemode,'String',['$',lz,'$'],'Interpreter','latex','Fontsize',tf);

origen=po;
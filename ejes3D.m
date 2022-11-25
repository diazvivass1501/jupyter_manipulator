function []=ejes3D(Po,Px,Py,Pz,cx,cy,cz,lw)
% Esta función se utiliza para dibujar un sistema coordenado con líneas
% 
% Ejemplo de uso: ejes3D(Po,Px,Py,Pz,'r','g','b',2)
%
% Parámetros de la función
% Po es la coordenada del origen 
% Px es la coordenada del eje x
% Py es la coordenada del eje y
% Pz es la coordenada del eje z
% cx es el color del eje x
% cy es el color del eje y
% cz es el color del eje z
% lw es el ancho de las lineas que representan los ejes

% Autor: Dr. César A. Chávez-Olivares 
% Email: iescd.chavez@gmail.com, cesar.chavez@edu.uaa.mx

po=Po'; px=Px'; py=Py'; pz=Pz';
hold on
plot3([po(1) px(1)],[po(2) px(2)],[po(3) px(3)],cx,'LineWidth',lw);%eje x
plot3([po(1) py(1)],[po(2) py(2)],[po(3) py(3)],cy,'LineWidth',lw);%eje y
plot3([po(1) pz(1)],[po(2) pz(2)],[po(3) pz(3)],cz,'LineWidth',lw);%eje z
%hold off
xlabel('Eje X')
ylabel('Eje Y')
zlabel('Eje Z')
%set(gca,'PlotBoxAspectRatio',[1 1 1])
%axis square; 
grid on
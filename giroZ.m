function []=giroZ(K,theta_min_max,r_a,lth,lposXYZ,tf)
% Esta función se utiliza para dibujar una flecha curva alrededor del eje
% Z correspondiente al sistema coordenado que ubica K con respecto al
% origen. 
%
% Ejemplo de uso: giroZ(eye(4),[-pi/2 pi/2],[0.5 0.7],'q_1',[0.5 0.5 0.9],16)
%
% Parámetros de la función
% K es la matriz de transformación con respecto al origen
% theta_min_max es un vector con los valores mínimo y máximo de theta
% r_a es un vector con el radio del arco y la altura para dibujarlo
% lth es la etiqueta del giro en z (latex)
% lposXYZ es la posicion de la etiqueta con respecto al sistema K
% tf es el tamaño de la fuente

% Autor: Dr. César A. Chávez-Olivares 
% Email: iescd.chavez@gmail.com, cesar.chavez@edu.uaa.mx

theta=theta_min_max(1):1*pi/180:theta_min_max(2);
x=r_a(1)*cos(theta);
y=r_a(1)*sin(theta);
z=r_a(2)*ones(1,length(theta));

XYZ=K*[x; y; z; ones(1,length(theta))];

%plot3(XYZ(1,:),XYZ(2,:),XYZ(3,:),'--k','linewidth',2)
plot3(XYZ(1,:),XYZ(2,:),XYZ(3,:),'k','linewidth',2)

ancho=r_a(1)/8;
alto=r_a(1)/4;
Kcono=K*rotz(theta_min_max(2))*trans(r_a(1),0,r_a(2))*rotx(-pi/2)*trans(0,0,-alto);
cono(Kcono,alto,ancho,'gray')

posletra=K*[lposXYZ(1); lposXYZ(2); lposXYZ(3); 1];
erasemode='none';
if (lth~=' ')
    text('Position',posletra(1:3),'String',['$',lth,'$'],'Interpreter','latex','Fontsize',tf);
end
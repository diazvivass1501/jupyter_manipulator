function dibujar_linea(P0,P1,color, grosor)
X=[P0(1), P1(1)];
Y=[P0(2), P1(2)];
Z=[P0(3), P1(3)];

plot3(X,Y,Z,'Color',color,'LineWidth',grosor),xlabel('X');ylabel('Y');zlabel('Z');
grid on
return


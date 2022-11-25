function dibujar_sistema_coordenadas(A,t,subindice)
P0=[A(13) A(14) A(15)];
view(30,30)
line([A(13) A(13)+(t*A(1))],[A(14) A(14)+(t*A(2))],[A(15) A(15)+(t*A(3))],'Color','r','LineWidth',2);
line([A(13) A(13)+(t*A(5))],[A(14) A(14)+(t*A(6))],[A(15) A(15)+(t*A(7))],'Color','g','LineWidth',2);
line([A(13) A(13)+(t*A(9))],[A(14) A(14)+(t*A(10))],[A(15) A(15)+(t*A(11))],'Color','b','LineWidth',2);
text(A(13)+(t*A(1)), A(14)+(t*A(2)), A(15)+(t*A(3)),strcat('x_',subindice))
text(A(13)+(t*A(5)),A(14)+(t*A(6)),A(15)+(t*A(7)),strcat('y_',subindice))
text(A(13)+(t*A(9)),A(14)+(t*A(10)),A(15)+(t*A(11)),strcat('z_',subindice))

return

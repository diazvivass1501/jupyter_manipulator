function [GEOMETRICO]=GEOMETRICO_JUPYTER(Apris2,L3,L4,Atheta1,Atheta2,Apris)
x=Apris2;
y=(L3+L4)*(-sin(Atheta1));
z=Apris+((L3+L4)*cos(Atheta1));

R=rotacion_z(pi/2)*rotacion_x(pi/2)*rotacion_z(Atheta1)*rotacion_x(-pi/2)*rotacion_z(pi)*rotacion_z(Atheta2);
A= [ 1     0     0     x;
     0     1     0     y;
     0     0     1     z;
     0     0     0     1];
 GEOMETRICO=A*R

end


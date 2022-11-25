function R = Rot_RPY(phi, theta, psi)
% función que calcula una matriz de rotación (3x3) correspondiente a
% los parámetros Roll, Pitch , Yaw
R=rotz3(phi)*roty3(theta)*rotx3(psi);
%R=R1(1:3,1:3);
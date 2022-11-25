function [Lambda, theta] = Eje_theta_grados (H)
% Función que extrae los parámetros Lambda y theta de una matriz de
% transformación homogénea. 
% Lambda es un vector unitario y theta se entrega en grados

R=H(1:3,1:3);

theta= acos((trace(R)-1)/2);

Kx=(R(3,2)-R(2,3))/(2*sin(theta));
Ky=(R(1,3)-R(3,1))/(2*sin(theta));
Kz=(R(2,1)-R(1,2))/(2*sin(theta));

Lambda=[Kx Ky Kz]';
theta=theta*180/pi;
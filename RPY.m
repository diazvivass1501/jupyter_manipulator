function [Roll, Pitch, Yaw] = RPY (H)
% Función que extrae los parámetros Roll, Pitch, Yaw de una matriz de
% transformación homogénea. El resultado se entrega en radianes.

R=H(1:3,1:3);

Yaw = atan2(R(3,2),R(3,3));
Roll = atan2(R(2,1),R(1,1));
Pitch = atan2(-R(3,1),sqrt(R(1,1)^2+R(2,1)^2));

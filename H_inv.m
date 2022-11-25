function [Hi] = H_inv(H)
% función que calcula inversa de una matriz de transformación homogénea
R=H(1:3,1:3);
d=H(1:3,4);

Hi = [R.' -(R.')*d; 
      0 0 0 1];
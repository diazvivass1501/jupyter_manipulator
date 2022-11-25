function [Aa,TTR,TTR2,TTR3,TTR4] = piezas_stl(T1,T2,T1_2,T4)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
base=Load_STL('BASE.STL');
base_sr1=Load_STL('BASE SR1.STL');
base_pr=Load_STL('BASAE PR.STL');
base_r2=Load_STL('BASE R2.STL');
base_final=Load_STL('FINAL.STL');

H=eye(4);
Aa=[1 0 0 -37.4;
   0 1 0 -35;
   0 0 1 -22;
   0 0 0 1];  

TR1=[1 0 0 -30;
   0 1 0 -30;
   0 0 1 -36;
   0 0 0 1]; 

TR2=[1 0 0 -34;
   0 1 0 -30;
   0 0 1 5;
   0 0 0 1]; 

TR3=[1 0 0 -30;
   0 1 0 -15;
   0 0 1 -40;
   0 0 0 1]; 

TR4=[1 0 0 -30;
   0 1 0 -30;
   0 0 1 -26;
   0 0 0 1]; 

TTR=T1*TR1;
TTR2=T1_2*TR2;
TTR3=T2*TR3;
TTR4=T4*TR4;

eslabon_STL(Aa,base,'w');
eslabon_STL(TTR,base_sr1,'w');
eslabon_STL(TTR2,base_pr,'w');
eslabon_STL(TTR3,base_r2,'w');
eslabon_STL(TTR4,base_final,'w');
light
return


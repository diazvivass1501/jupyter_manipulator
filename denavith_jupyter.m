function [T1,T1_2,T2,T3,T4] = denavith_jupyter(pris,pris2,theta1,theta2)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
A=[1 0 0 0;
   0 1 0 0;
   0 0 1 0;
   0 0 0 1];   

t1=denavit(pi/2,pris,0,pi/2);
t2=denavit(theta1,pris2,0,0);
t21=denavit(theta1,0,0,0);
t3=denavit(pi,0,0,pi/2);
t4=denavit(theta2,198,0,0);

T1=t1;
T1_2=t1*t21;
T2=t1*t2;
T3=T2*t3;
T4=T3*t4;
end


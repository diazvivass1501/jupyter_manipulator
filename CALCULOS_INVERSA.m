function DENAVIT_PARAMETERS=CALCULOS_INVERSA(nx,ny,nz,ox,oy,oz,ax,ay,az,px,py,pz)
L1=250;L2=220;L3=90;L4=50;
theta_2 = atan(-ay/az);
if theta_2 > 0
    theta_2 = theta_2 * -1;
end
q_1 = pz - cos(theta_2)*(198);
q_3 = px - L3;
theta_4 = atan(nx/ox);
DENAVIT_PARAMETERS = [q_1,theta_2,q_3,theta_4];
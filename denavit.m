function dh=denavit(theta,d,ai,alfha)

dh=[cos(theta) -cos(alfha)*sin(theta) sin(alfha)*sin(theta) ai*cos(theta);
    sin(theta) cos(alfha)*cos(theta) -sin(alfha)*cos(theta) ai*sin(theta);
        0           sin(alfha)            cos(alfha)             d;
        0               0                      0                 1];
end


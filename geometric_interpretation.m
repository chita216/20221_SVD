theta = [pi/15; -pi/9; -pi/20];
Sigma = diag([3; 1; 0.5]);

Rx = [1 0 0;
    0 cos(theta(1)) -sin(theta(1));
    0 sin(theta(1)) cos(theta(1))];

Ry = [cos(theta(2)) 0 sin(theta(2));
    0 1 0;
    -sin(theta(2)) 0 cos(theta(2))];

Rz = [cos(theta(3)) -sin(theta(3)) 0;
    sin(theta(3)) cos(theta(3)) 0;
    0 0 1];

X = Rz*Ry*Rx*Sigma;

[x,y,z] = sphere(25);
subplot(1,2,1)
h1 = surf(x,y,z);

xR = 0*x; yR = 0*y; zR = 0*z;
for i = 1:size(x,1)
    for j = 1:size(x,2)
        vecR = X*[x(i,j); y(i,j); z(i,j)];
        xR(i,j) = vecR(1);
        yR(i,j) = vecR(2);
        zR(i,j) = vecR(3);
    end
end
subplot(1,2,2)
h2 = surf(xR,yR,zR);
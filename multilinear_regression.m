load hald;
A = ingredients;
b = heat;

[U,S,V] = svd(A,'econ');
x = V*(inv(S))*(U')*b;

plot(b,'k'); hold on
plot(A*x,'r-o');

x = regress(b,A)
x = pinv(A)*b
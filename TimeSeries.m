a = [1 0.9 0.81 0.729 0.6561 0.59049];
v = 1; %variance white noise
w = sqrt(v)*randn(15000,1);
x = filter(1,a,w);
[r,lg] = xcorr(x,'biased');
r(lg<0) = [];

[ar,e] = levinson(r,4)
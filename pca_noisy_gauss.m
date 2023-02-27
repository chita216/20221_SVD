xC = [2;1];
sig = [2; .5];

theta = pi/3;
R = [cos(theta) -sin(theta);
    sin(theta) cos(theta)];

nPoints = 10000;
X = R*diag(sig)*randn(2,nPoints) + diag(xC)*ones(2,nPoints);
sz = 10;
figure; subplot(1,2,1)
scatter(X(1,:),X(2,:),sz,'filled')
hold on 
plot(2, 1, 'ro', 'MarkerSize',2,'MarkerFaceColor', 'r');

Xavg = mean(X,2);
B = X-Xavg*ones(1,nPoints);
[U,S,V] = svd(B/sqrt(nPoints),'econ');
subplot(1,2,2)
scatter(X(1,:),X(2,:),sz,'filled')

theta = (0:.01:1)*2*pi;
Xstd = U*S*[cos(theta); sin(theta)];

hold on
plot(2, 1, 'ro', 'MarkerSize',2,'MarkerFaceColor', 'r');
plot(Xavg(1)+Xstd(1,:),Xavg(2) + Xstd(2,:),'r-','LineWidth',1)
plot(Xavg(1)+2*Xstd(1,:),Xavg(2)+2*Xstd(2,:),'r-','LineWidth',1)
plot(Xavg(1)+3*Xstd(1,:),Xavg(2)+3*Xstd(2,:),'r-','LineWidth',1)
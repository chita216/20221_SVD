clear all
close all  
clc

t = (-3:.01:3)';

Utrue = [cos(17*t).*exp(-t.^2) sin(11*t)];
Strue = [2 0; 0 .5];
Vtrue = [sin(5*t).*exp(-t.^2) cos(13*t)];

X = Utrue*Strue*Vtrue';
subplot(2,2,1), imshow(X);

sigma = 1;
Xnoisy = X+sigma*randn(size(X));
subplot(2,2,2), imshow(Xnoisy);

[U,S,V] = svd(Xnoisy);
N = size(Xnoisy,1);
cutoff = (4/sqrt(3))*sqrt(N)*sigma;
r = find(diag(S)>cutoff, 1, 'last' );
Xclean = U(:,1:r)*S(1:r,1:r)*V(:,1:r)';
subplot(2,2,3), imshow(Xclean);

cdS = cumsum(diag(S))./sum(diag(S));
r90 = min(find(cdS>0.90));

X90 = U(:,1:r90)*S(1:r90,1:r90)*V(:,1:r90)';
subplot(2,2,4), imshow(X90);

figure
subplot(1,2,1)
semilogy(diag(S),'-ok','LineWidth',1.5), hold on, grid on
semilogy(diag(S(1:r,1:r)),'or','LineWidth',1.5), hold on
line([0 700],[56.6157 56.6157],'Color','red','LineStyle','--','LineWidth',1.5)

subplot(1,2,2)
plot(cumsum(diag(S))/sum(diag(S)),'-ok','LineWidth',1.5), hold on, grid on
plot(cumsum(diag(S(1:403,1:403)))/sum(diag(S)),'-ob','LineWidth',1.5), hold on
line([0 403 403 403],[0.9 0.9 0 0.9],'Color','red','LineStyle','--','LineWidth',1.5)
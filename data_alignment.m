n = 1000; % 1000x1000 square
X = zeros(n,n);
X(n/4:3*n/4,n/4:3*n/4) = 1;
subplot(1,2,1)
imshow(X);

Y = imrotate(X,10,'bicubic'); %rotate 10 degrees
Y = Y - Y(1,1);
nY = size(Y,1);
startind = floor((nY-n)/2);
Xrot = Y(startind:startind+n-1, startind:startind+n-1);
subplot(1,2,2)
imshow(Xrot);

[U1,S1,V1] = svd(X);
[U2,S2,V2] = svd(Xrot);

figure
subplot(1,2,1), semilogy(diag(S1),'ko');
subplot(1,2,2), semilogy(diag(S2),'ko');

figure
nAngles = 12; %sweep through 12 angles, from 0:4:44
Xrot = X;
cm = turbo(11);
for j=2:nAngles
    Y = imrotate(X,(j-1)*4,'bicubic'); % rotate (j-1)*4
    startind = floor((size(Y,1)-n)/2);
    Xrot1 = Y(startind:startind+n-1, startind:startind+n-1);
    Xrot2 = Xrot1 - Xrot1(1,1);
    Xrot2 = Xrot2/max(Xrot2(:));
    Xrot(Xrot2>.5) = j;
    [U,S,V] = svd(Xrot1);
    subplot(1,2,1), imagesc(Xrot), colormap(cm); hold on
    subplot(1,2,2), semilogy(diag(S),'color',cm(j,:)); hold on
end
A=imread("koala.jpg");
X=double(rgb2gray(A));
nx = size(X,1); ny=size(X,2);
imagesc(X), axis off, colormap gray
[U,S,V]=svd(X);
for r=[5 20 100]
    Xapprox=U(:,1:r)*S(1:r,1:r)*V(:,1:r)';
    figure,imagesc(Xapprox), axis off, colormap gray
    title(['r=',num2str(r,'%d')]);
end
figure
subplot(1,2,1), semilogy(diag(S),'k')
subplot(1,2,2), plot(cumsum(diag(S))/sum(diag(S)),'k')

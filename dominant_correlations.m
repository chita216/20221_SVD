A=imread("koala.jpg");
X=double(rgb2gray(A));
nx = size(X,1); ny=size(X,2);
subplot(1,3,1), imagesc(X), axis off, axis image, colormap gray
subplot(1,3,2), imagesc(X*X'), axis off, axis image, colormap gray
subplot(1,3,3), imagesc(X'*X), axis off, axis image, colormap gray

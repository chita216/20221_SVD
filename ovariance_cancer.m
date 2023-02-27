load ovariancancer;
[U,S,V] = svd(obs,'econ');
figure
for i=1:size(obs,1)
    x = V(:,1)'*obs(i,:)';
    y = V(:,2)'*obs(i,:)';
    z = V(:,3)'*obs(i,:)';
    if(grp{i}=='Cancer')
        plot3(x,y,z,'rx','LineWidth',2);
    else
        plot3(x,y,z,'bo','LineWidth',2);
    end
    hold on
end

figure
subplot(1,2,1), semilogy(diag(S),'r')
subplot(1,2,2), plot(cumsum(diag(S))/sum(diag(S)),'r')
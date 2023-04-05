clear 
clc
close all
%%
load('FA_input_all.mat')
Y = [X(:,1), X(:,3)];
figure;
plot(Y(:,1),Y(:,2),'k*','MarkerSize',5);
title 'FA input data';
xlabel 'FA'; 
ylabel 'Content [%]';

%%

[idx,C] = kmeans(X,4,'Distance','cityblock',...
    'Replicates',5);
%%
figure;
plot(X(idx==1,1),X(idx==1,3:end),'r.','MarkerSize',12)
hold on
plot(X(idx==2,1),X(idx==2,3:end),'b.','MarkerSize',12)
hold on
plot(X(idx==3,1),X(idx==3,3:end),'g.','MarkerSize',12)
hold on
plot(X(idx==4,1),X(idx==4,3:end),'y.','MarkerSize',12)
plot(C(:,1),C(:,3:end),'kx',...
     'MarkerSize',15,'LineWidth',3) 
legend('Cluster 1','Cluster 2','Cluster 3','Cluster 4','Centroids',...
       'Location','NW')
title 'Cluster Assignments and Centroids'
xlim([0 .3])
hold off
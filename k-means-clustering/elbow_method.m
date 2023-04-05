% Loop over a range of clusters, 1 to X in this case

clear
clc
close all
metric=load_nii('dti_fa_masked_NEW.nii');metric=metric.img;
metric=metric(:,:,26);
md=load_nii('dti_md_masked_NEW.nii');md=md.img;
%md=md(:,:,17);

% pretty colours for plotting
colr = [0 0.4470 0.7410; ...
        0.8500 0.3250 0.0980; ...
        0.9290 0.6940 0.1250; ...
        0.4940 0.1840 0.5560; ...
        0.4660 0.6740 0.1880; ...
        0.3010 0.7450 0.9330; ...
        0.6350 0.0780 0.1840];
%% Clustering

% to cluster based on 2 contrasts
img = cat(3,metric,md); %clustering on FA and MD

%img = fa;
k_range=2:15;
for k = k_range
    [sse(k) rmse(k)] = kmeans_error(single(img), k);
end
%%
% Display elbow plot
if true
    F1 = figure; hold on
    title('FA+MD input - SSE')
    xlabel('k (# clusters)'), ylabel('Sum-square error')
    F2 = figure; hold on
    title('FA+MD input - RMSE')
    xlabel('k (# clusters)'), ylabel('Euclidean Distance (RMSE)')
    figure(F1), hold on, plot(k_range,sse(k_range(1):end),'-o')
    xlim([0 15]); %ylim([0 0.0003])
    figure(F2), hold on, plot(k_range,rmse(k_range(1):end),'-o')
    xlim([0 15]); %ylim([0 .0003])
end

%%
[k_labels,k_centers] = imsegkmeans(single(img),k);
%%
silhouette(md, k_)


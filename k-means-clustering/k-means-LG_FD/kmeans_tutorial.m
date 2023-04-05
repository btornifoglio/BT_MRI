%% elbow method march 15th 2023
% Loop over a range of clusters, 1 to X in this case
close all
clear
clc

metric=load_nii('mask3_manual_FA.nii');metric=metric.img;
metric=metric(:,:,26);

% pretty colours for plotting
colr = [0 0.4470 0.7410; ...
        0.8500 0.3250 0.0980; ...
        0.9290 0.6940 0.1250; ...
        0.4940 0.1840 0.5560; ...
        0.4660 0.6740 0.1880; ...
        0.3010 0.7450 0.9330; ...
        0.6350 0.0780 0.1840];
%% Clustering - elbow method

% cluster one image
img = metric;

k_range=2:50;
for k = k_range
    [sse(k) rmse(k)] = kmeans_error(single(img), k);
end
%%
% Display elbow plot
if true
    F1 = figure; hold on
    title('SSE')
    xlabel('k (# clusters)'), ylabel('Sum-square error')
    F2 = figure; hold on
    title('RMSE')
    xlabel('k (# clusters)'), ylabel('Euclidean Distance (RMSE)')
    figure(F1), hold on, plot(k_range,sse(k_range(1):end),'-o')
    xlim([0 50]); %ylim([0 0.0003])
    figure(F2), hold on, plot(k_range,rmse(k_range(1):end),'-o')
    xlim([0 50]); %ylim([0 .0003])
end

%% k means clustering 

k = 5; % number of clusters determined using elbow method.
% (https://www.kdnuggets.com/2019/10/clustering-metrics-better-elbow-method.html)

% perform clustering
[k_labels,k_centers] = imsegkmeans(single(img),k);

% k_labels is the segmented labeled output 
% k_centers are centroid locations in the cluster location
%%
% set-up for color-coded ROIs
ROIimage = metric; % could make this the b0 or mean b800
colr = {'black',...
        'blue', 'cyan', 'green', 'magenta', 'red', 'yellow', ...
        'blue', 'cyan', 'green', 'magenta', 'red', 'yellow', ...
        'blue', 'cyan', 'green', 'magenta', 'red', 'yellow'};
    
    % make regional measurements
for kID = 1:k

    % make ROIs from clusters
    roi(:,:,kID) = k_labels == kID;

    % overlay ROI on image & color-code
    ROIimage = imoverlay(ROIimage, roi(:,:,kID), colr{kID});

    % extract ROI measures
    Metric(kID,1) = mean(metric(roi(:,:,kID)));

    % Segmented Images
    MetricSeg(:,:,kID) = Metric(kID,1) .* roi(:,:,kID);
end

%% Parametric maps of clustered ROIs

% display color coded clusters
figure(2), hold on
title(sprintf('Colour coded Clusters, k=%.0f',k))
imshow(ROIimage)

% % display seperate ROIs
% figure('Name','Individual Clusters / ROIs','NumberTitle','off')
% hold on
% rc = ceil(sqrt(k)); % calculate rows and cols for subplot
% for K = 1:k
%     subplot(rc,rc,K), hold on
%     imshow(roi(:,:,K),'displayrange',[])
% end

% display segmented image
MetricSeg = sum(MetricSeg,3);

figure('Name','Segmented Images','NumberTitle','off')
imshow(MetricSeg,'displayrange',[]), colorbar, title('Segmented FA')

%% for luke
i = imread("D60-crop.jpg");
iGray=rgb2gray(im2single(i));

[L,C]=imsegkmeans(i,10);
[LG,CG]=imsegkmeans(iGray,4);

J = label2rgb(L, im2double(C));
%%

figure()
subplot(1,3,1)
imshow(i);title('original image');
subplot(1,3,2)
imshow(J);title('segmented');
subplot(1,3,3)
imshow(labeloverlay(i,L)); title('whatisthis');
% 
figure()
subplot(1,2,1)
imshow(iGray);title('gray image');
subplot(1,2,2)
imshow(labeloverlay(iGray,LG)); title('whatisthis');
%%

k_range=2:50;
for k = k_range
    [sse(k) rmse(k)] = kmeans_error(i, k);
end

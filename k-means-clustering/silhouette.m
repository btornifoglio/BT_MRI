%% k means clustering attempts on dti data (based off tutorial from AS)
clc
clear
close all
% load in FA and MD niftis and specify specific slice for analysis
fa=load_nii('dti_fa_masked_NEW.nii');fa=fa.img;
md=load_nii('dti_md_masked_NEW.nii');md=md.img;
BF=load_nii('PSR_BF.nii');BF=im2double(BF.img); BF=mat2gray(BF);
SAF=load_nii('PSR_SAF.nii');SAF=im2double(SAF.img); SAF=mat2gray(SAF);
%fa=fa(:,:,17);
%md=load_nii('mask3_manual_MD.nii');md=md.img;
%md=md(:,:,17);

% pretty colours for plotting
colr = [0 0.4470 0.7410; ...
        0.8500 0.3250 0.0980; ...
        0.9290 0.6940 0.1250; ...
        0.4940 0.1840 0.5560; ...
        0.4660 0.6740 0.1880; ...
        0.3010 0.7450 0.9330; ...
        0.6350 0.0780 0.1840];
%% K-means clustering

% to cluster based on 2 contrasts (FA and MD)
%img = cat(3,fa,md);  %two inputs
img = md; %one input

k = 10; % number of clusters determined using elbow method.
% (https://www.kdnuggets.com/2019/10/clustering-metrics-better-elbow-method.html)

% perform clustering
[k_labels,k_centers] = imsegkmeans(single(img),k);

%%
clust = kmeans(md,5);
silhouette(md,clust)
%%
ROIimage = fa; % could make this the b0 or mean b800
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
    Fa(kID,1) = mean(fa(roi(:,:,kID)));
    Md(kID,1) = mean(md(roi(:,:,kID)));
    
    % Segmented Images
    FaSeg(:,:,kID) = Fa(kID,1) .* roi(:,:,kID);
    MdSeg(:,:,kID) = Md(kID,1) .* roi(:,:,kID);
end


scatter(Fa,Md)

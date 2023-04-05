%% k means clustering attempts on dti data (based off tutorial from AS)
clc
clear
close all
% load in FA and MD niftis and specify specific slice for analysis
fa=load_nii('dti_fa_masked_NEW.nii');fa=fa.img;
md=load_nii('dti_md_masked_NEW.nii');md=md.img;
BF=load_nii('AR_BF.nii');BF=im2double(BF.img); BF=mat2gray(BF);
SAF=load_nii('AR_SAF.nii');SAF=im2double(SAF.img); SAF=mat2gray(SAF);
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

k = 5; % number of clusters determined using elbow method.
% (https://www.kdnuggets.com/2019/10/clustering-metrics-better-elbow-method.html)

% perform clustering
[k_labels,k_centers] = imsegkmeans(single(img),k);

% k_labels is the segmented labeled output 
% k_centers are centroid locations in the cluster location
%%
% set-up for color-coded ROIs
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
    Bf(kID,1) = mean(BF(roi(:,:,kID)));
    Saf(kID,1)= mean(SAF(roi(:,:,kID)));
    

    % Segmented Images
    FaSeg(:,:,kID) = Fa(kID,1) .* roi(:,:,kID);
    MdSeg(:,:,kID) = Md(kID,1) .* roi(:,:,kID);
    BfSeg(:,:,kID) = Bf(kID,1) .* roi(:,:,kID);
    SafSeg(:,:,kID)=Saf(kID,1) .* roi(:,:,kID);
end
%%
%% Parametric maps of clustered ROIs

% display color coded cluster
figure(1), hold on
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
FaSeg = sum(FaSeg,3);
MdSeg = sum(MdSeg,3);
BfSeg = sum(BfSeg,3);
SafSeg1=sum(SafSeg,3);
MdSeg = sum(MdSeg,3);
figure('Name','Segmented Images','NumberTitle','off')
subplot(2,2,1)
imshow(FaSeg,'displayrange',[]), colorbar, title('Segmented FA')
subplot(2,2,2)
imshow(MdSeg,'displayrange',[]), colorbar, title('Segmented MD')
subplot(2,2,3)
imshow(BfSeg,'displayrange',[]), colorbar, title('Segmented Bf')
subplot(2,2,4)
imshow(SafSeg1,'displayrange',[]), colorbar, title('Segmented SAF')

figure()
subplot(1,2,1)
imshow(SafSeg1)
subplot(1,2,2)
imshow(SAF)
%%
%% Calculate % component
% Need to calculate tissue area and SAF area and divide to get amount

% count the number of voxels in each ROI


% attempt to suss out what is happening
roi2_total = nnz(roi(:,:,2));
roi2_saf = sum(sum(SafSeg(:,:,2)));
roi2_mean = mean(nonzeros(SafSeg(:,:,2)));

roi3_total = nnz(roi(:,:,3));
roi3_saf = sum(sum(SafSeg(:,:,3)));
roi3_mean = mean(nonzeros(SafSeg(:,:,3)));

roi4_total = nnz(roi(:,:,4));
roi4_saf = sum(sum(SafSeg(:,:,4)));
roi4_mean = mean(nonzeros(SafSeg(:,:,4)));

roi5_total = nnz(roi(:,:,5));
roi5_saf = sum(sum(SafSeg(:,:,5)));
roi5_mean = mean(nonzeros(SafSeg(:,:,5)));

% content
Content = zeros(1,10)';
Content_AS = zeros(1,10)';

Content(2) = roi2_saf/roi2_total*100;
Content_AS(2) = roi2_mean*100;

Content(3) = roi3_saf/roi3_total*100;
Content_AS(3) = roi3_mean*100;

Content(4) = roi4_saf/roi4_total*100;
Content_AS(4) = roi4_mean*100;

Content(5) = roi5_saf/roi5_total*100;
Content_AS(5) = roi5_mean*100;
%%
%% Rough correlation plots - no % component yet, just pixel values
figure()
plot(Fa(2:5,:),Content(2:5,:),'o')
xlim([0 0.3])
ylim([0 100])

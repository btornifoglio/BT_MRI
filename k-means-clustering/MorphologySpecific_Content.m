clc
clear
close all
I_SAF=load_nii('AR_SAF.nii');
I_SAF=im2double(I_SAF.img); I_SAF=mat2gray(I_SAF);

mask1=load_nii('HE_entire_mask.nii');
mask1=im2double(mask1.img); 

mask2=load_nii('HE_wall_mask.nii');
mask2=im2double(mask2.img); 

I_SAF_2= mask1.*I_SAF;

I_mean = mean(nonzeros(I_SAF_2));
I_Content_AS = I_mean*100;

W_SAF_2= mask2.*I_SAF;
W_mean = mean(nonzeros(W_SAF_2));
W_Content_AS = W_mean*100;

%%

I_SAF=niftiread('intima_PSR_SAF.nii'); I_SAF=single(mat2gray(I_SAF));
W_SAF=niftiread('wall_PSR.nii');W_SAF=single(mat2gray(W_SAF));

I_total = nnz(I_SAF);
W_total = nnz(W_SAF);

I_saf = sum(sum(I_SAF));
W_saf = sum(sum(W_SAF));

I_mean = mean(nonzeros(I_SAF));
W_mean = mean(nonzeros(W_SAF));

I_Content = I_saf/I_total*100;
I_Content_AS = I_mean*100;

W_Content = W_saf/W_total*100;
W_Content_AS = W_mean*100;
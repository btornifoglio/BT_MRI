
clc;
clear;
close all 

% *Change this input* based on what you've named the base nifti.
pe_dir = 'CDDTA_LuminalThrombus';
metric=load_nii(sprintf('%s_HA.nii',pe_dir));metric=metric.img;

data_dimen = size(metric);
metric_mean = zeros(1,data_dimen(3));
format long 

for i = 1:data_dimen(3)    
    answer = mean(nonzeros(metric(:,:,i)));
    metric_mean(i) = answer;
end 
metric_mean=metric_mean';

for j = 1:data_dimen(3)   
    answer = std(nonzeros(metric(:,:,j)));
    metric_std(j) = answer;
end 
metric_std=metric_std';

for k = 1:data_dimen(3)    
    answer = nnz(metric(:,:,k));
    metric_count(k) = answer;
end 
metric_count=metric_count';

all = [metric_mean metric_std metric_count];
%snr = metric_mean ./ metric_std;
%values = [metric_mean, metric_std, snr];

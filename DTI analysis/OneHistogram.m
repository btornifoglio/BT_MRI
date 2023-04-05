clc;
clear;
close all 

% *Change this input* based on what you've named the base nifti.
pe_dir = 'mask5';
% This loads in each nifti metric, converts from character to 3D double
% (y pixel by x pixel by number of slices) then reshapes into a single
% vector of all values.
fa_1=load_nii(sprintf('%s_FA.nii',pe_dir));fa_1=fa_1.img;fa_1=reshape(fa_1,1,[]);
md_1=load_nii(sprintf('%s_MD.nii',pe_dir));md_1=md_1.img;md_1=reshape(md_1,1,[]);

fa_1 = nonzeros(fa_1);
md_1 = nonzeros(md_1);

figure
subplot(2,1,1)
histogram(md_1,25,'Normalization','probability', 'DisplayStyle', 'stairs');
ylabel('VF');xlabel('MD')
xlim([0 0.0017])

subplot(2,1,2); 
histogram(fa_1,50,'Normalization','probability', 'DisplayStyle', 'stairs');
ylabel('VF');xlabel('FA')
xlim([0 .3]); ylim([0 .1])
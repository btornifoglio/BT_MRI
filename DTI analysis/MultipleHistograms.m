clc;
clear;
close all 

% *Change this input* based on what you've named the base nifti.
% pe_dir = 'm5_Hcommon';
% % This loads in each nifti metric, converts from character to 3D double
% % (y pixel by x pixel by number of slices) then reshapes into a single
% % vector of all values.
% fa_1=load_nii(sprintf('%s_FA.nii',pe_dir));fa_1=fa_1.img;fa_1=reshape(fa_1,1,[]);
% md_1=load_nii(sprintf('%s_MD.nii',pe_dir));md_1=md_1.img;md_1=reshape(md_1,1,[]);
% 
% pe_dir = 'm5_Dcommon';
% fa_2=load_nii(sprintf('%s_FA.nii',pe_dir));fa_2=fa_2.img;fa_2=reshape(fa_2,1,[]);
% md_2=load_nii(sprintf('%s_MD.nii',pe_dir));md_2=md_2.img;md_2=reshape(md_2,1,[]);

pe_dir = '2611m5_Hinternal';
fa_3=load_nii(sprintf('%s_FA.nii',pe_dir));fa_3=fa_3.img;fa_3=reshape(fa_3,1,[]);
md_3=load_nii(sprintf('%s_MD.nii',pe_dir));md_3=md_3.img;md_3=reshape(md_3,1,[]);

pe_dir = '2611m5_Dinternal';
fa_4=load_nii(sprintf('%s_FA.nii',pe_dir));fa_4=fa_4.img;fa_4=reshape(fa_4,1,[]);
md_4=load_nii(sprintf('%s_MD.nii',pe_dir));md_4=md_4.img;md_4=reshape(md_4,1,[]);

pe_dir = '3m5_internal';
fa_5=load_nii(sprintf('%s_FA.nii',pe_dir));fa_5=fa_5.img;fa_5=reshape(fa_5,1,[]);
md_5=load_nii(sprintf('%s_MD.nii',pe_dir));md_5=md_5.img;md_5=reshape(md_5,1,[]);

%%

% fa_1 = nonzeros(fa_1);
% md_1 = nonzeros(md_1);

% fa_2 = nonzeros(fa_2);
% md_2 = nonzeros(md_2);

fa_3 = nonzeros(fa_3);
md_3 = nonzeros(md_3);

fa_4 = nonzeros(fa_4);
md_4 = nonzeros(md_4);

fa_5 = nonzeros(fa_5);
md_5 = nonzeros(md_5);
%Creating histrograms 
figure
subplot(2,1,1)
%histogram(md_1,50,'Normalization','probability', 'DisplayStyle', 'stairs');
%hold on
%histogram(md_2,50,'Normalization','probability','DisplayStyle', 'stairs');
%hold on
histogram(md_3,50,'Normalization','probability','DisplayStyle', 'stairs');
hold on
histogram(md_4,50,'Normalization','probability','DisplayStyle', 'stairs');
hold on
histogram(md_5,50,'Normalization','probability','DisplayStyle', 'stairs');
ylabel('VF');xlabel('MD')
xlim([0 0.0017])

subplot(2,1,2); 
%histogram(fa_1,50,'Normalization','probability', 'DisplayStyle', 'stairs');
%hold on
%histogram(fa_2,100,'Normalization','probability', 'DisplayStyle', 'stairs');
%hold on
histogram(fa_3,100,'Normalization','probability', 'DisplayStyle', 'stairs');
hold on
histogram(fa_4,100,'Normalization','probability', 'DisplayStyle', 'stairs');
hold on
histogram(fa_5,100,'Normalization','probability', 'DisplayStyle', 'stairs');
ylabel('VF');xlabel('FA')
xlim([0 .3]); ylim([0 .1])

%% Determine mean, median, std of each distribution

values = [mean(fa_1) median(fa_1) std(fa_1);...
    mean(fa_2) median(fa_2) std(fa_2);...
   mean(fa_3) median(fa_3) std(fa_3)];




% figure
% hold on
% bar(means)
% errorbar(means,stds,'.')
% 
% figure()
% hold on
% bar(medians)
% errorbar(medians,stds,'.')


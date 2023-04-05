
clc;
clear;
close all 

% *Change this input* based on what you've named the base nifti.
% metric=read_avw(XPCaA1_FE);
% mask=read_avw(XPCaA1_mask);

helical=load_nii('XPCaA1_helical.nii');helical=helical.img;
% pick one slice
helical_slice=helical(:,:,45);

neg_helical = helical_slice < 0;
helical_slice(neg_helical) = 
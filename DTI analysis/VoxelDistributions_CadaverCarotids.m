%% load in all masked niftis
clear 
clc
close all

% first data set
pe_dir = 'internal';
fa = load_nii(sprintf('%s_FA.nii',pe_dir));fa=fa.img;
%%

%%
fa1 = fa(:,:,4);
fa1 = nonzeros(fa1);


edges = linspace(0, 0.25, 100);
histogram(fa1, 'BinEdges', edges)
grid on
xlabel('FA', 'FontSize', 14);
%%

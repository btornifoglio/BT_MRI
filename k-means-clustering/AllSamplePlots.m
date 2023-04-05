%% load in all 
close all
clear
clc

% load in 2611
AB_2611=load('2611_AB_Content.mat');
AR_2611=load('2611_AR_Content.mat');
PSR_2611=load('2611_PSR_Content.mat');
VF_2611=load('2611_VF_Content.mat');
FA_2611=load('2611_ROI_Fa.mat');
MD_2611=load('2611_ROI_Md.mat');
AB_2611=struct2array(AB_2611);
AR_2611=struct2array(AR_2611);
PSR_2611=struct2array(PSR_2611);
VF_2611=struct2array(VF_2611);
FA_2611=struct2array(FA_2611);
MD_2611=struct2array(MD_2611);

% load in 3
AB_3=load('3_AB_Content.mat');
AR_3=load('3_AR_Content.mat');
PSR_3=load('3_PSR_Content.mat');
VF_3=load('3_VF_Content.mat');
FA_3=load('3_ROI_Fa.mat');
MD_3=load('3_ROI_Md.mat');
AB_3=struct2array(AB_3);
AR_3=struct2array(AR_3);
PSR_3=struct2array(PSR_3);
VF_3=struct2array(VF_3);
FA_3=struct2array(FA_3);
MD_3=struct2array(MD_3);

% load in 2602
AB_2602=load('2602_AB_Content.mat');
AR_2602=load('2602_AR_Content.mat');
PSR_2602=load('2602_PSR_Content.mat');
VF_2602=load('2602_VF_Content.mat');
FA_2602=load('2602_ROI_Fa.mat');
MD_2602=load('2602_ROI_Md.mat');
AB_2602=struct2array(AB_2602);
AR_2602=struct2array(AR_2602);
PSR_2602=struct2array(PSR_2602);
VF_2602=struct2array(VF_2602);
FA_2602=struct2array(FA_2602);
MD_2602=struct2array(MD_2602);

% load in 7R
AB_7R=load('7R_AB_Content.mat');
AR_7R=load('7R_AR_Content.mat');
PSR_7R=load('7R_PSR_Content.mat');
VF_7R=load('7R_VF_Content.mat');
FA_7R=load('7R_ROI_Fa.mat');
MD_7R=load('7R_ROI_Md.mat');
AB_7R=struct2array(AB_7R);
AR_7R=struct2array(AR_7R);
PSR_7R=struct2array(PSR_7R);
VF_7R=struct2array(VF_7R);
FA_7R=struct2array(FA_7R);
MD_7R=struct2array(MD_7R);

%% FA vs MD plots 

figure()
plot(FA_2611(2:10), MD_2611(2:10),'o')
hold on
plot(FA_3(2:10), MD_3(2:10),'o')
hold on
plot(FA_2602(2:10), MD_2602(2:10),'o')
hold on
plot(FA_7R(2:10), MD_7R(2:10),'o')
title('k=10, FA+MD inputs');
xlim([0 0.3]); ylim([0 0.0018]);
xlabel('FA'); ylabel('MD');
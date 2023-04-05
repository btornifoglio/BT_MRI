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

%% Cell densities

% % FA+MD input
% HE_2611 = [0; 961.4236418; 1946.022448; 2217.513524; 1049.587067];
% HE_3 = [0; 1045.285548; 1522.700429; 795.8444503; 1220.753466];
% HE_2602 = [0; 1815.398834; 2023.58152; 1252.396959; 1226.371591];
% HE_7R = [0; 1144.498473; 1768.904725; 1037.408047; 1115.170518];

% % % FA input
HE_2611 = [0; 1093.581013; 931.3001032; 1412.780109; 992.5690347];
HE_3 = [0; 1349.116057; 1163.130047; 821.5285957; 1579.213793];
HE_2602 = [0; 1506.261849; 2147.279332; 1592.850077; 2063.31589];
HE_7R = [0; 1059.259063; 1015.142838; 1760.52116; 1140.749691];

% % 
% % % MD input
% HE_2611 = [0; 1169.354861; 948.2242555; 2022.640659; 1626.559463];
% HE_3 = [0; 1248.136333; 1448.256406; 1143.934868; 873.0194627];
% HE_2602 = [0; 2024.769289; 1922.681041; 1922.36319; 1746.236474];
% HE_7R = [0; 1022.155507; 1242.214092; 2329.446016; 1022.463067];
% 


%% FA vs MD plots 

figure()
plot(FA_2611(2:5), MD_2611(2:5),'o')
hold on
plot(FA_3(2:5), MD_3(2:5),'o')
hold on
plot(FA_2602(2:5), MD_2602(2:5),'o')
hold on
plot(FA_7R(2:5), MD_7R(2:5),'o')
title('k=5, FA+MD inputs');
xlim([0 0.3]); ylim([0 0.0018]);
xlabel('FA'); ylabel('MD');

%% correlation plots - FA / MD vs components

figure()
subplot(2,5,1)
plot(FA_2611(2:5), PSR_2611(2:5),'o')
hold on
plot(FA_3(2:5), PSR_3(2:5),'o')
hold on
plot(FA_2602(2:5), PSR_2602(2:5),'o')
hold on
plot(FA_7R(2:5), PSR_7R(2:5),'o')
%title('(FA), r=0.2737, p=0.1062');
xlim([0 0.3]); ylim([0 100]);
%pbaspect([1 1 1])
xlabel('FA'); ylabel('Collagen Content [%]');

subplot(2,5,2)
plot(FA_2611(2:5), VF_2611(2:5),'o')
hold on
plot(FA_3(2:5), VF_3(2:5),'o')
hold on
plot(FA_2602(2:5), VF_2602(2:5),'o')
hold on
plot(FA_7R(2:5), VF_7R(2:5),'o')
%title('(MD), r=0.7033, ****p<0.0001');
xlim([0 0.3]); ylim([0 100]);
%pbaspect([1 1 1])
xlabel('FA'); ylabel('Elastin Content [%]');

subplot(2,5,3)
plot(FA_2611(2:5), AB_2611(2:5),'o')
hold on
plot(FA_3(2:5), AB_3(2:5),'o')
hold on
plot(FA_2602(2:5), AB_2602(2:5),'o')
hold on
plot(FA_7R(2:5), AB_7R(2:5),'o')
%title('(MD), r=-0.4907, **p=0.0024');
xlim([0 0.3]); ylim([0 100]);
%pbaspect([1 1 1])
xlabel('FA'); ylabel('GAG Content [%]');

subplot(2,5,4)
plot(FA_2611(2:5), AR_2611(2:5),'o')
hold on
plot(FA_3(2:5), AR_3(2:5),'o')
hold on
plot(FA_2602(2:5), AR_2602(2:5),'o')
hold on
plot(FA_7R(2:5), AR_7R(2:5),'o')
%title('(MD), r=0.06466, p=0.7079');
xlim([0 0.3]); ylim([0 100]);
%pbaspect([1 1 1])
xlabel('FA'); ylabel('Calcium Content [%]');

subplot(2,5,5)
plot(FA_2611(2:5), HE_2611(2:5),'o')
hold on
plot(FA_3(2:5), HE_3(2:5),'o')
hold on
plot(FA_2602(2:5), HE_2602(2:5),'o')
hold on
plot(FA_7R(2:5), HE_7R(2:5),'o')
%title('(MD), r=0.06466, p=0.7079');
xlim([0 0.3]); ylim([0 3000]);
%pbaspect([1 1 1])
xlabel('FA'); ylabel('Cell density [cells/mm2]');

subplot(2,5,6)
plot(MD_2611(2:5), PSR_2611(2:5),'o')
hold on
plot(MD_3(2:5), PSR_3(2:5),'o')
hold on
plot(MD_2602(2:5), PSR_2602(2:5),'o')
hold on
plot(MD_7R(2:5), PSR_7R(2:5),'o')
%title('(MD), r=-0.2989, p=0.0766');
xlim([0 0.0016]); ylim([0 100]);
%pbaspect([1 1 1])
xlabel('MD'); ylabel('Collagen Content [%]');

subplot(2,5,7)
plot(MD_2611(2:5), VF_2611(2:5),'o')
hold on
plot(MD_3(2:5), VF_3(2:5),'o')
hold on
plot(MD_2602(2:5), VF_2602(2:5),'o')
hold on
plot(MD_7R(2:5), VF_7R(2:5),'o')
%title('(MD), r=-0.8094, ****p<0.0001');
xlim([0 0.0016]); ylim([0 100]);
%pbaspect([1 1 1])
xlabel('MD'); ylabel('Elastin Content [%]');

subplot(2,5,8)
plot(MD_2611(2:5), AB_2611(2:5),'o')
hold on
plot(MD_3(2:5), AB_3(2:5),'o')
hold on
plot(MD_2602(2:5), AB_2602(2:5),'o')
hold on
plot(MD_7R(2:5), AB_7R(2:5),'o')
%title('(MD), r=0.1603, p=0.3504');
xlim([0 0.0016]); ylim([0 100]);
%pbaspect([1 1 1])
xlabel('MD'); ylabel('GAG Content [%]');

subplot(2,5,9)
plot(MD_2611(2:5), AR_2611(2:5),'o')
hold on
plot(MD_3(2:5), AR_3(2:5),'o')
hold on
plot(MD_2602(2:5), AR_2602(2:5),'o')
hold on
plot(MD_7R(2:5), AR_7R(2:5),'o')
%title('(MD), r=-0.06238, p=0.7178');
xlim([0 0.0016]); ylim([0 100]);
%pbaspect([1 1 1])
xlabel('MD'); ylabel('Calcium Content [%]');

subplot(2,5,10)
plot(MD_2611(2:5), HE_2611(2:5),'o')
hold on
plot(MD_3(2:5), HE_3(2:5),'o')
hold on
plot(MD_2602(2:5), HE_2602(2:5),'o')
hold on
plot(MD_7R(2:5), HE_7R(2:5),'o')
%title('(MD), r=-0.06238, p=0.7178');
xlim([0 0.0016]); ylim([0 3000]);
%pbaspect([1 1 1])
xlabel('MD'); ylabel('Cell density [cells/mm2]');

%% correlation plots - component vs components

figure()
subplot(2,5,1)
plot(VF_2611(2:5), PSR_2611(2:5),'o')
hold on
plot(VF_3(2:5), PSR_3(2:5),'o')
hold on
plot(VF_2602(2:5), PSR_2602(2:5),'o')
hold on
plot(VF_7R(2:5), PSR_7R(2:5),'o')
%title('(FA), r=0.2737, p=0.1062');
xlim([0 50]); ylim([0 65]);
pbaspect([1 1 1])
xlabel('Elastin content [%]'); ylabel('Collagen content [%]');

subplot(2,5,2)
plot(VF_2611(2:5), HE_2611(2:5),'o')
hold on
plot(VF_3(2:5), HE_3(2:5),'o')
hold on
plot(VF_2602(2:5), HE_2602(2:5),'o')
hold on
plot(VF_7R(2:5), HE_7R(2:5),'o')
%title('(MD), r=0.7033, ****p<0.0001');
xlim([0 50]); ylim([0 3000]);
pbaspect([1 1 1])
xlabel('Elastin content [%]'); ylabel('Cell density [cells/mm^2]');

subplot(2,5,3)
plot(VF_2611(2:5), AB_2611(2:5),'o')
hold on
plot(VF_3(2:5), AB_3(2:5),'o')
hold on
plot(VF_2602(2:5), AB_2602(2:5),'o')
hold on
plot(VF_7R(2:5), AB_7R(2:5),'o')
%title('(MD), r=-0.4907, **p=0.0024');
xlim([0 50]); ylim([0 60]);
pbaspect([1 1 1])
xlabel('Elastin content [%]'); ylabel('GAG content [%]');

subplot(2,5,4)
plot(VF_2611(2:5), AR_2611(2:5),'o')
hold on
plot(VF_3(2:5), AR_3(2:5),'o')
hold on
plot(VF_2602(2:5), AR_2602(2:5),'o')
hold on
plot(VF_7R(2:5), AR_7R(2:5),'o')
%title('(MD), r=0.06466, p=0.7079');
xlim([0 50]); ylim([0 20]);
pbaspect([1 1 1])
xlabel('Elastin content [%]'); ylabel('Calcium content [%]');

subplot(2,5,5)
plot(PSR_2611(2:5), HE_2611(2:5),'o')
hold on
plot(PSR_3(2:5), HE_3(2:5),'o')
hold on
plot(PSR_2602(2:5), HE_2602(2:5),'o')
hold on
plot(PSR_7R(2:5), HE_7R(2:5),'o')
%title('(MD), r=0.06466, p=0.7079');
xlim([0 65]); ylim([0 3000]);
pbaspect([1 1 1])
xlabel('Collagen content [%]'); ylabel('Cell density [cells/mm2]');

subplot(2,5,6)
plot(PSR_2611(2:5), AB_2611(2:5),'o')
hold on
plot(PSR_3(2:5), AB_3(2:5),'o')
hold on
plot(PSR_2602(2:5), AB_2602(2:5),'o')
hold on
plot(PSR_7R(2:5), AB_7R(2:5),'o')
%title('(MD), r=-0.2989, p=0.0766');
xlim([0 65]); ylim([0 60]);
pbaspect([1 1 1])
xlabel('Collagen content [%]'); ylabel('GAG content [%]');

subplot(2,5,7)
plot(PSR_2611(2:5), AR_2611(2:5),'o')
hold on
plot(PSR_3(2:5), AR_3(2:5),'o')
hold on
plot(PSR_2602(2:5), AR_2602(2:5),'o')
hold on
plot(PSR_7R(2:5), AR_7R(2:5),'o')
%title('(MD), r=-0.8094, ****p<0.0001');
xlim([0 65]); ylim([0 20]);
pbaspect([1 1 1])
xlabel('Collagen content [%]'); ylabel('Calcium content [%]');

subplot(2,5,8)
plot(HE_2611(2:5), AB_2611(2:5),'o')
hold on
plot(HE_3(2:5), AB_3(2:5),'o')
hold on
plot(HE_2602(2:5), AB_2602(2:5),'o')
hold on
plot(HE_7R(2:5), AB_7R(2:5),'o')
%title('(MD), r=0.1603, p=0.3504');
xlim([0 3000]); ylim([0 60]);
pbaspect([1 1 1])
xlabel('Cell density [cells/mm2]'); ylabel('GAG Content [%]');

subplot(2,5,9)
plot(HE_2611(2:5), AR_2611(2:5),'o')
hold on
plot(HE_3(2:5), AR_3(2:5),'o')
hold on
plot(HE_2602(2:5), AR_2602(2:5),'o')
hold on
plot(HE_7R(2:5), AR_7R(2:5),'o')
%title('(MD), r=-0.06238, p=0.7178');
xlim([0 3000]); ylim([0 20]);
pbaspect([1 1 1])
xlabel('Cell density [cells/mm2]'); ylabel('Calcium Content [%]');

subplot(2,5,10)
plot(AB_2611(2:5), AR_2611(2:5),'o')
hold on
plot(AB_3(2:5), AR_3(2:5),'o')
hold on
plot(AB_2602(2:5), AR_2602(2:5),'o')
hold on
plot(AB_7R(2:5), AR_7R(2:5),'o')
%title('(MD), r=-0.06238, p=0.7178');
xlim([0 60]); ylim([0 20]);
%pbaspect([1 1 1])
xlabel('GAG content [%]'); ylabel('Calcim content [%]');


%%
AB = [AB_2611; AB_3; AB_2602; AB_7R]; AB=AB(AB~=0);
VF = [VF_2611; VF_3; VF_2602; VF_7R]; VF=VF(VF~=0);
AR = [AR_2611; AR_3; AR_2602; AR_7R]; AR=AR(AR~=0);
PSR = [PSR_2611; PSR_3; PSR_2602; PSR_7R]; PSR=PSR(PSR~=0);
HE = [HE_2611; HE_3; HE_2602; HE_7R]; HE=HE(HE~=0);

FA = [FA_2611; FA_3; FA_2602; FA_7R]; FA=FA(FA~=0);
MD = [MD_2611; MD_3; MD_2602; MD_7R]; MD=MD(MD~=0);

X = [FA, MD, VF, PSR, VF, AB, AR];

figure()
plot(FA, VF,'o')
hold on
plot(FA,PSR,'o')
hold on
plot(FA,AB, 'o')
hold on
plot(FA,AR,'o')
grid on
xlim([0 0.3]); ylim([0 100]);

figure()
plot(MD, VF,'o')
hold on
plot(MD,PSR,'o')
hold on
plot(MD,AB, 'o')
hold on
plot(MD,AR,'o')
grid on
xlim([0 0.002]); ylim([0 100]);

%%
%plot(X(:,1),X(:,3:end),'o')
save('FA_input_all.mat','X');
[idx,C] = kmeans(X,4);


x1 = min(X(:,1)):0.01:max(X(:,1));
x2 = min(X(:,2)):0.01:max(X(:,2));
[x1G,x2G] = meshgrid(x1,x2);
XGrid = [x1G(:),x2G(:)]; % Defines a fine grid on the plot

idx2Region = kmeans(XGrid,,'MaxIter',1,'Start',C);
% load in 2602
clear
clc
close all

k2_vf_2602=load('7R_VF_Content_k=2.mat'); k2_vf_2602=struct2array(k2_vf_2602);
k3_vf_2602=load('7R_VF_Content_k=3.mat'); k3_vf_2602=struct2array(k3_vf_2602);
k4_vf_2602=load('7R_VF_Content_k=4.mat'); k4_vf_2602=struct2array(k4_vf_2602);
k5_vf_2602=load('7R_VF_Content_k=5.mat'); k5_vf_2602=struct2array(k5_vf_2602);
k6_vf_2602=load('7R_VF_Content_k=6.mat'); k6_vf_2602=struct2array(k6_vf_2602);
k7_vf_2602=load('7R_VF_Content_k=7.mat'); k7_vf_2602=struct2array(k7_vf_2602);
k8_vf_2602=load('7R_VF_Content_k=8.mat'); k8_vf_2602=struct2array(k8_vf_2602);
k9_vf_2602=load('7R_VF_Content_k=9.mat'); k9_vf_2602=struct2array(k9_vf_2602);
k10_vf_2602=load('7R_VF_Content_k=10.mat'); k10_vf_2602=struct2array(k10_vf_2602);

k2_fa_2602=load('7R_FA_Content_k=2.mat'); k2_fa_2602=struct2array(k2_fa_2602);
k3_fa_2602=load('7R_FA_Content_k=3.mat'); k3_fa_2602=struct2array(k3_fa_2602);
k4_fa_2602=load('7R_FA_Content_k=4.mat'); k4_fa_2602=struct2array(k4_fa_2602);
k5_fa_2602=load('7R_FA_Content_k=5.mat'); k5_fa_2602=struct2array(k5_fa_2602);
k6_fa_2602=load('7R_FA_Content_k=6.mat'); k6_fa_2602=struct2array(k6_fa_2602);
k7_fa_2602=load('7R_FA_Content_k=7.mat'); k7_fa_2602=struct2array(k7_fa_2602);
k8_fa_2602=load('7R_FA_Content_k=8.mat'); k8_fa_2602=struct2array(k8_fa_2602);
k9_fa_2602=load('7R_FA_Content_k=9.mat'); k9_fa_2602=struct2array(k9_fa_2602);
k10_fa_2602=load('7R_FA_Content_k=10.mat'); k10_fa_2602=struct2array(k10_fa_2602);
%%

figure()
subplot(3,3,1)
plot(k2_fa_2602(2:2), k2_vf_2602(2:2),'o','MarkerSize',10);
pbaspect([1 1 1])
title('k=2')
xlabel('FA'); ylabel('Elastin content [%]');
xlim([0 0.3]); ylim([0 40]);
subplot(3,3,2)
plot(k3_fa_2602(2:3),k3_vf_2602(2:3),'o','MarkerSize',10)
pbaspect([1 1 1])
title('k=3')
xlabel('FA'); ylabel('Elastin content [%]');
xlim([0 0.3]); ylim([0 40]);
subplot(3,3,3)
plot(k4_fa_2602(2:4),k4_vf_2602(2:4),'o','MarkerSize',10)
title('k=4')
pbaspect([1 1 1])
xlabel('FA'); ylabel('Elastin content [%]');
xlim([0 0.3]); ylim([0 40]);
subplot(3,3,4)
plot(k5_fa_2602(2:5), k5_vf_2602(2:5),'o','MarkerSize',10)
title('k=5')
pbaspect([1 1 1])
xlabel('FA'); ylabel('Elastin content [%]');
xlim([0 0.3]); ylim([0 40]);
subplot(3,3,5)
plot(k6_fa_2602(2:6),k6_vf_2602(2:6),'o','MarkerSize',10)
title('k=6')
pbaspect([1 1 1])
xlabel('FA'); ylabel('Elastin content [%]');
xlim([0 0.3]); ylim([0 40]);
subplot(3,3,6)
plot(k7_fa_2602(2:7),k7_vf_2602(2:7),'o','MarkerSize',10)
title('k=7')
pbaspect([1 1 1])
xlabel('FA'); ylabel('Elastin content [%]');
xlim([0 0.3]); ylim([0 40]);
subplot(3,3,7)
plot(k8_fa_2602(2:8), k8_vf_2602(2:8),'o','MarkerSize',10)
title('k=8')
pbaspect([1 1 1])
xlabel('FA'); ylabel('Elastin content [%]');
xlim([0 0.3]); ylim([0 40]);
subplot(3,3,8)
plot(k9_fa_2602(2:9),k9_vf_2602(2:9),'o','MarkerSize',10)
title('k=9')
pbaspect([1 1 1])
xlabel('FA'); ylabel('Elastin content [%]');
xlim([0 0.3]); ylim([0 40]);
subplot(3,3,9)
plot(k10_fa_2602(2:10),k10_vf_2602(2:10),'o','MarkerSize',10)
title('k=10')
xlim([0 0.3]); ylim([0 40]);
pbaspect([1 1 1])
xlabel('FA'); ylabel('Elastin content [%]');
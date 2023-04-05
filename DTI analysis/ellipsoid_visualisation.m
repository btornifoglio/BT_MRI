clc
clear
% close all
% 
% figure(1)
% % plaque 54 b2-1
% [X,Y,Z] = ellipsoid(0,0,0,0.001133,0.001056,0.000971);
% surf(X,Y,Z);
% ellipsoid(0,0,0,0.001133,0.001056,0.000971);;
% axis equal
% hold on
% s = surf(X+.0025,Y+0.005,Z);
% % changes rotation to eigenvectors from DT
% direction = [0.190611 -0.01495 -0.03425];
% rotate(s,direction,360)
% 
% figure(2)
% % plaque 28 cc2-I
% [X,Y,Z] = ellipsoid(0,0,0,0.001349,0.001255,0.001139);
% surf(X,Y,Z);
% ellipsoid(0,0,0,0.001133,0.001056,0.000971);;
% axis equal
% hold on
% s = surf(X+.0025,Y+0.005,Z);
% % changes rotation to eigenvectors from DT
% direction = [-0.067487 0.016808	-0.024211];
% rotate(s,direction,360)

figure(3)
% example
[X,Y,Z] = ellipsoid(0,0,0,0.5,0.5,0.65);
surf(X,Y,Z);
ellipsoid(0,0,0,0.001133,0.001056,0.000971);;
axis equal
hold on
s = surf(X+.0025,Y+0.005,Z);
% changes rotation to eigenvectors from DT
direction = [-0.5 0.75	-0];
rotate(s,direction,360)
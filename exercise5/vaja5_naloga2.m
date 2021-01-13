tic;
clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

figure(1) ; clf ;
f_nm = 'house' ;
fname1 = [f_nm,'1.jpg'] ;
fname2 = [f_nm,'2.jpg'] ;
fname_points = 'test_tocke.txt' ;

% load images
a_l = imread(fname1) ;
a_r = imread(fname2) ;

% display images
subplot(1,2,1) ; imagesc(a_l) ; axis equal ; axis tight ; hold on ;
title('Left camera') ;
subplot(1,2,2) ; imagesc(a_r) ; axis equal ; axis tight ; hold on ;
title('Right camera') ;

% load data 
pts = load('house_matches.txt') ; 

pts_l = pts(:,1:2)' ;
pts_r = pts(:,3:4)' ;

figure(2); clf ;
displaymatches(a_l, pts_l(1,:), pts_l(2,:), a_r, pts_r(1,:), pts_r(2,:), []) ;
 
toc;
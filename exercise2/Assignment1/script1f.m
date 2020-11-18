clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

[histograms, files] = load_histogram_database('images', 8);

h_sorted=[];

%HELLINGER 
h1 = histograms(20,:);
for i = 1:120
    h2 = histograms(i,:);
    h_sorted = [h_sorted, compare_histograms(h1,h2,'hellinger')];
end

% I je indeks presortiranega elementa (tisti, ki imajo vrednost distance 0 v
% histogramu, so 'prakticno' ista slika

[h_sorted, I] = sort(h_sorted); 
Ih = I;

figure('Name','Graph plot')
C=[];
h1 = histograms(20,:);
for i = 1:120
    h2 = histograms(i,:);
    C = [C compare_histograms(h1, h2,'hellinger')];
end

subplot(1,2,1);plot(1:120,C);
hold on; 
plot(Ih(1:5),h_sorted(1:5),'ro');

subplot(1,2,2);plot(1:120,h_sorted);
hold on;
plot(1:5,h_sorted(1:5),'ro');

clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

[histograms, files] = load_histogram_database('images', 8);

sum(sum(histograms));
H = sum(histograms) ./ 120;

figure;
subplot(1,2,1);
hist(H, 64);


lambda = 5000
weights = exp(-lambda * H(:));
subplot(1,2,2);
hist(weights, 512);

% reshape from column verctor to row vector:
weights = reshape(weights, 1, []);


% compare -----------------------------------------------


h_sorted=[];

%HELLINGER 
h1 = histograms(20,:);
h11 = h1 .* weights; %normalization
for i = 1:120
    h2 = histograms(i,:);
    h22 = h2 .* weights;
    h_sorted = [h_sorted, compare_histograms(h11,h22,'hellinger')];
end

% I je indeks presortiranega elementa (tisti, ki imajo vrednost distance 0 v
% histogramu, so 'prakticno' ista slika

[h_sorted, I] = sort(h_sorted); 
Ih = I;
    
figure('Name','Graph plot');
C=[];
for i = 1:120
    h2 = histograms(i,:);
    h22 = h2 .* weights;
    C = [C compare_histograms(h11, h22,'hellinger')];
end

subplot(1,2,1);
plot(1:120,C);
hold on; 
plot(Ih(1:5),h_sorted(1:5),'ro');

subplot(1,2,2);
plot(1:120,h_sorted);
hold on;
plot(1:5,h_sorted(1:5),'ro');



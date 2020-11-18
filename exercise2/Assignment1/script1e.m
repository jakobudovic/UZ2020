clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

[histograms, files] = load_histogram_database('images', 8);

% IndexC = strfind(files,'_05_4.png');
% Index = find(not(cellfun('isempty',IndexC)))

h1 = histograms(20, :);
h1 = reshape(h1, 1, []);

 % store distances for all histograms
distance_types = ["l2"; "chi2"; "hellinger"; "intersect"];

for j=1:4    
distance_type = distance_types(j); % l2, chi2, hellinger, intersect
dists = zeros(1,120);

for i=1:size(files, 1)
    h2 = histograms(i, :);
    
    distance = compare_histograms(h1, h2, distance_type);
    dists(i) = distance;
end


[distances_sorted, I] = sort(dists);
top5 = distances_sorted(1:6);

[tf,idx] = ismember(dists, top5); % tf logical, find where we have 1, idx so 1-5

pics_idx = find(tf); % returns indeces of non-zero logical array TF

% display
rows = 2; 
cols = 6;
figure;

for i=1:length(pics_idx) % loop over all 5 original indeces
    index = I(i);
    
    subplot(rows, cols,i);
    name = files{index};
    imshow(imread(name)); 
    title(['Image ', num2str(index)]);
    
    subplot(rows, cols,i+6);
    % h2 = reshape(histograms(i), [], 1);
    bar(histograms(index, :), 'BarWidth', 5.0);
    title(distance_type, distances_sorted(i));
end
end

%{







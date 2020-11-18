clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 16;

I = imread('candy.jpg'); 
I_GRAY = rgb2gray(I);

tresh = otsu(I_GRAY)
[H, bins]= myhist(I_GRAY, 255);
A = I_GRAY > tresh; % mask, we flip the values
A = ~A;

SE = ones(10);
A1 = imdilate(A, SE);
A2 = imerode(A1, SE);

K = bwlabel(A2); % Use connected components algorithm to label all components

label_max = max(K(:)); % A trick to get all values present in matrix L
figure;
rows1 = 6;
cols1 = 6;

subplot(1,1,1);
imshow(I); title('Select a point here');
hold on;
axis on;
[xx,yy] = ginput(1);
fprintf("Selected point is %d, %d\n", int16(xx), int16(yy));

candy_num = K(int16(yy),int16(xx))
if candy_num > 0
    fprintf("Clicked candy number %d\n", int8(candy_num));
    CAND = K;
    CAND(CAND ~= candy_num) = 0; % where candy isn't clicked number, set to 0
    CAND1 = CAND;     % our mask of one candy, stored
    [R, G, B, C] = immask(I, CAND);
    CAND = CAND(:) ~= 0;
    num_pixels = sum(CAND);
    candy_matrix_HSV = rgb2hsv(C);
    HSV_avg = sum(sum(candy_matrix_HSV))/num_pixels;
    
    % plot(xx,yy,'r.','MarkerSize',20);
    % return;
else 
    fprintf("We didn't click a candy. Please, click a candy!\n");
    return;
end
    
% selected = I(int16(y),int16(x))   % we have to turn around the indexes - first select the row (y), then the column (x)
% selected_RGB = I(int16(y),int16(x), :)
% fprintf("Selected point has a value of %d, %d, %d\n", selected_RGB(1), selected_RGB(2), selected_RGB(3));
% fprintf("Selected point has a value of %d, %d, %d\n", int16(I(y,x,1)), int16(I(y,x,2)), int16(I(y,x,3)));

selected_LAB = rgb2lab(hsv2rgb(HSV_avg));

OURMASK = logical(A1);

vals = [];
final_mask = zeros(464,700);
% figure;
for i = 1:label_max;
    
    COIN = K; % matrix with 0s, and values where there are objects
    COIN(COIN ~= i) = 0; % set all values to 0 unless we are dealing with an i-th object, COIN is our mask now
    curr_candy_mask = int8(COIN); % save the mask for later, to subtract it from bigger mask.
    [R, G, B, C] = immask(I, COIN); % get RGB values of the aria masked-out
    COIN = COIN(:) ~= 0; % take pixels where there is not a 0 value, 1D matrix
    num_pixels = sum(COIN); % sum those values and get the number of pixels, used for average after
    % sum1 = sum(sum(sum(C))); % sum values of 3d matrixm OBSOLETE
    % avg = sum1 / num_pixels;
    
    % transform RGB to CIELAB - the distances better replicate the human
    % perception of color similarity
    
    % CIELAB CS (similar to humans' perception of colors): https://en.wikipedia.org/wiki/CIELAB_color_space
    % RGB to HSV, get average HSV value of candy
    candy_matrix_HSV = rgb2hsv(C);
    HSV_avg = sum(sum(candy_matrix_HSV))/num_pixels; % sums first 2 dimensions and we get 1x3 matrix
    
    % HSV to CIELAB (actually HSV -> RGB -> LAB)
    LAB_avg = rgb2lab(hsv2rgb(HSV_avg));
    
    D  = sqrt(sum((selected_LAB - LAB_avg) .^ 2));
    vals(i) = D;
    if D < 14 % hardcoded the value
        % add up masks, one by one
        final_mask = final_mask + logical(curr_candy_mask);
        % calculate the center of the curr_candy_mask
        
        % plot(y1,x1,'r.','MarkerSize',20)
        s = regionprops(curr_candy_mask,'centroid');
        centroids = cat(1,s.Centroid);
        plot(centroids(:,1),centroids(:,2),'r.','MarkerSize',20)
    end
    
    
    
    % display mask of each element
    % subplot(rows1,cols1,i);
    % imagesc(final_mask); axis equal; axis tight; title('Candy');
    % colormap gray;
    
end;

% FLIP = ~OURMASK;
hold off;
colormap gray;


%{

% figure;
% imagesc(final_mask); axis equal; axis tight; title('final\_mask');
% colormap gray;

% vals % values of euclidian distances. We will set teshold to 60-65 after
% inspecting and plotting these results
figure;
plot(vals(1:end))
sort(vals)
label_max

figure;
rows = 3;
cols = 3;

subplot(rows,cols,2); 
bar(H); title('Histogram of grey values');

% figure;

subplot(rows,cols,3);
imagesc(I); axis equal; axis tight; title('Original');

subplot(rows,cols,4);
imagesc(I_GRAY); axis equal; axis tight; title('Gray original');

subplot(rows,cols,5);
imagesc(A); axis equal; axis tight; title('Mask');

subplot(rows,cols,6);
imagesc(A1); axis equal; axis tight; title('Mask when processed with morph. operations');

subplot(rows,cols,7);
imagesc(K); axis equal; axis tight; title('Bwlabel');

subplot(rows,cols,8);
imagesc(K); axis equal; axis tight; title('Bwlabel processed');

colormap gray;
%}
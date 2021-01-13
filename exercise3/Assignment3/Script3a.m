tic;
clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;
    
bins_theta = 300; bins_rho = 300; % Resolution of the accumulator array
max_rho = 100; % Usually the diagonal of the image
val_theta = (linspace(-90, 90, bins_theta) / 180) * pi; % Values of theta are known
val_rho = linspace(-max_rho, max_rho, bins_rho);


% for point at (10, 10) ----------------------------------------------------
A = zeros(bins_rho, bins_theta);
x = 10;
y = 10;
rho = x * cos(val_theta) + y * sin(val_theta); % compute rho for all thetas
bin_rho = round(((rho + max_rho) / (2 * max_rho)) * length(val_rho)); % Compute bins for rho
for i = 1:bins_theta % Go over all the points
    if bin_rho(i) > 0 && bin_rho(i) <= bins_rho % Mandatory out-of-bounds check
        A(bin_rho(i), i) = A(bin_rho(i), i) + 1; % Increment the accumulator cells
    end;
end;

% for point at (30, 60) ----------------------------------------------------
B = zeros(bins_rho, bins_theta);
x = 30;
y = 60;
rho = x * cos(val_theta) + y * sin(val_theta); % compute rho for all thetas
bin_rho = round(((rho + max_rho) / (2 * max_rho)) * length(val_rho)); % Compute bins for rho
for i = 1:bins_theta % Go over all the points
    if bin_rho(i) > 0 && bin_rho(i) <= bins_rho % Mandatory out-of-bounds check
        B(bin_rho(i), i) = B(bin_rho(i), i) + 1; % Increment the accumulator cells
    end;
end;

% for point at (50, 20) ----------------------------------------------------
C = zeros(bins_rho, bins_theta); 
x = 50;
y = 20;
rho = x * cos(val_theta) + y * sin(val_theta); % compute rho for all thetas
bin_rho = round(((rho + max_rho) / (2 * max_rho)) * length(val_rho)); % Compute bins for rho
for i = 1:bins_theta % Go over all the points
    if bin_rho(i) > 0 && bin_rho(i) <= bins_rho % Mandatory out-of-bounds check
        C(bin_rho(i), i) = C(bin_rho(i), i) + 1; % Increment the accumulator cells
    end;
end;

% for point at (80, 90) ----------------------------------------------------
D = zeros(bins_rho, bins_theta);
x = 80;
y = 90;
rho = x * cos(val_theta) + y * sin(val_theta); % compute rho for all thetas
bin_rho = round(((rho + max_rho) / (2 * max_rho)) * length(val_rho)); % Compute bins for rho
for i = 1:bins_theta % Go over all the points
    if bin_rho(i) > 0 && bin_rho(i) <= bins_rho % Mandatory out-of-bounds check
        D(bin_rho(i), i) = D(bin_rho(i), i) + 1; % Increment the accumulator cells
    end;
end;

figure;
rows = 2;
cols = 2;

subplot(rows, cols, 1); imagesc(A); % Display status of the accumulator
axis equal; axis tight; title('x = 10, y = 10');

subplot(rows, cols, 2); imagesc(B); % Display status of the accumulator
axis equal; axis tight; title('x = 30, y = 60');

subplot(rows, cols, 3); imagesc(C); % Display status of the accumulator
axis equal; axis tight; title('x = 50, y = 20');

subplot(rows, cols, 4); imagesc(D); % Display status of the accumulator
axis equal; axis tight; title('x = 80, y = 90');

toc;
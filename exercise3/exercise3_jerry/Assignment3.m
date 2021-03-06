close all
bins_theta = 300; bins_rho = 300; % Resolution of the accumulator array
max_rho = 100; % Usually the diagonal of the image
val_theta = (linspace(-90, 90, bins_theta) / 180) * pi; % Values of theta are known
val_rho = linspace(-max_rho, max_rho, bins_rho);

% for point at (50, 90)
x = 50;
y = 90;
x = [10, 30, 50 ,80,50];
y = [10, 60, 20, 90,90];


rho = x(:) .* cos(val_theta) + y(:) .* sin(val_theta); % compute rho for all thetas
bin_rho = round(((rho + max_rho) / (2 * max_rho)) * length(val_rho)); % Compute bins for rho

B = [];
for j = 1:size(bin_rho,1)
    A = zeros(bins_rho, bins_theta);
    for i = 1:bins_theta % Go over all the points
        if bin_rho(j,i) > 0 && bin_rho(j,i) <= bins_rho % Mandatory out-of-bounds check
            A(bin_rho(j,i), i) = A(bin_rho(j,i), i) + 1; % Increment the accumulator cells
        end;
    end;
    B(:,:,j) = A;
end;
figure()
subplot(2,2,1);imagesc(B(:,:,1));title(['x = ' ,  num2str(x(1)), ', y= ',num2str(y(1))]) % Display status of the accumulator
subplot(2,2,2);imagesc(B(:,:,2));title(['x = ' ,  num2str(x(2)), ', y= ',num2str(y(2))])  % Display status of the accumulator
subplot(2,2,3);imagesc(B(:,:,3));title(['x = ' ,  num2str(x(3)), ', y= ',num2str(y(3))])  % Display status of the accumulator
subplot(2,2,4);imagesc(B(:,:,4));title(['x = ' ,  num2str(x(4)), ', y= ',num2str(y(4))])  % Display status of the accumulator

E = zeros(100); % 100 x 100 pixel image
E(10, 10) = 1;
E(20, 20) = 1; % Set threshold to 2 to obtain line that travels through both points.

bins_theta=180;
figure()
colormap jet
subplot(1,3,1);
[G,g] = hough_find_lines(E,400,bins_theta,2);
%figure()
%imagesc(G)
subplot(1,3,2);
Im1 = imread("oneline.png");
Im1 = rgb2gray(Im1);
Im1e = findedges(Im1,1,30);
[G1, g1] = hough_find_lines(Im1e,bins_rho,bins_theta,200);

subplot(1,3,3);
Im = imread("rectangle.png");
Im = rgb2gray(Im);
Ime = findedges(Im,1,30);
[G2, g2] = hough_find_lines(Ime,bins_rho,bins_theta,201);

figure()
subplot(1,3,1);hough_draw_lines(E,G,g);
subplot(1,3,2);hough_draw_lines(Im1,G1,g1);
subplot(1,3,3);hough_draw_lines(Im,G2,g2);

%f)
bricks = imread("bricks.jpg");
pier = imread("pier.jpg");
bricksE = findedges(rgb2gray(bricks),1,30);
pierE = findedges(rgb2gray(pier),5,15);

figure()
subplot(2,2,1);
[B1,b1,BA] = hough_find_lines(bricksE,bins_rho,bins_theta,550);
[rA,cA] = ndgrid(1:size(BA,1),1:size(BA,2));
[BSort,idx] = sort(BA(:),'descend');
rA = rA(idx(1:10));
cA = cA(idx(1:10));
%prvih 10 top vrednosti v A matriki

subplot(2,2,2);
[P1,p1,PA] = hough_find_lines(pierE,bins_rho,bins_theta,200);

subplot(2,2,3);
[B1s , B1I] = sort(P1,'descend');
hough_draw_lines(bricks,B1(1:10),b1(1:10));

subplot(2,2,4);
hough_draw_lines(pier,P1(1:10),p1(1:10));


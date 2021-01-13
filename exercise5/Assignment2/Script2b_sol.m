close all;

points = load('../epipolar/house_points.txt');
hleft = double(im2gray(imread('../epipolar/house1.jpg')));
hright = double(im2gray(imread('../epipolar/house2.jpg')));
p = [85,233,1]';

[F,e1,e2] = fundamental_matrix(points(:,1:2)',points(:,3:4)');

l1 = F * p;

subplot(1,2,1);
imshow(hleft);
hold on
plot(85,233,'g*');
plot(points(:,1),points(:,2),'r+');

subplot(1,2,2);
[h,w] = size(hright);
imshow(hright);
hold on
draw_line(l1,w,h,'green');
plot(points(:,3),points(:,4),'r+');
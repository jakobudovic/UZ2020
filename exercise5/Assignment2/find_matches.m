function [locations1, locations2, indexPairs] = find_matches(I1, I2)

% divide image by 256
I1 = I1 ./ 256;
I2 = I2 ./ 256;

points1 = detectHarrisFeatures(I1);
points2 = detectHarrisFeatures(I2);

[features1,valid_points1] = extractFeatures(I1,points1);
[features2,valid_points2] = extractFeatures(I2,points2);

indexPairs = matchFeatures(features1,features2);

locations1 = valid_points1(indexPairs(:,1)).Location;
locations2 = valid_points1(indexPairs(:,1)).Location;

M = logical(imread('mask.png')); % Load a synthetic mask
SE = ones(3); % 3x3 structuring element (also try out different sizes and shapes)

figure;
imagesc(M);

figure;
subplot(2, 2, 1);
imagesc(imerode(M, SE)); axis equal; axis tight; title('Erode');
subplot(2, 2, 2);
imagesc(imdilate(M, SE)); axis equal; axis tight; title('Dilate');
subplot(2, 2, 3);
imagesc(imerode(imdilate(M, SE), SE)); axis equal; axis tight; title('Dilate & Erode');
subplot(2, 2, 4);
imagesc(imdilate(imerode(M, SE), SE)); axis equal; axis tight; title('Erode & Dilate');


%{
    Dilation increases tje size of the structures. 
    Dilate the regions of "white" pixels. Objects become bigger, thicker.

    Erosion: erode the regions of "white" pixels.
    It actually reduces the size of the st  ructures, removes edges and
    borders. We loose bridges, branches AND NOISE! :)

    Dilation -> erosion:
    Fills holes, preserves ORIGINAL shape. 
    We didn't loose bridges and lines.
    We still have some noise.

    Erosion -> dilation: 
    Removes small objects. It preserves a rough shape.
    I would say this produced a better result, in our case.
%}
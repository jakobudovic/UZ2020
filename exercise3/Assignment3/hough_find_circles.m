function [x,y] = hough_find_circles(Ie, bins_theta,radius, threshold)
    [h,w] = size(Ie);
    
  
    val_theta = (linspace(-90, 90, bins_theta) / 180) * pi ;
    A = zeros(h,w);
    figure();
    imagesc(A);
    
    % Get x an y's of the values that are edges 
    [row_indices,col_indices] = find(Ie > 0);
    
    % Create the accumulator array
    for i = 1:length(row_indices)
        x = row_indices(i);
        y = col_indices(i);


        a = abs(round(y - radius * cos(val_theta)));
        b = abs(round(x + radius * sin(val_theta)));
        for j = 1:bins_theta 
            if a(j) > 1 && b(j) > 1 && b(j) < w && a(j) < h
                  A(a(j), b(j)) = A(a(j), b(j)) + 1;
            end
        end
    end
    % figure;
    % imagesc(A); 
    
    % Only keep the local maxima

    A = nonmaxima_suppression_box(A);
    
    
    % Retrieve bins and their indices that are higher than the threshold
    [y,x] = find(A >= threshold);
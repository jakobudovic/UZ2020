function [out_ro, out_theta, A] = hough_find_lines(Ie, bins_rho, bins_theta, threshold)

max_rho = ceil(hypot(size(Ie,1),size(Ie,2))); % Usually the diagonal of the image

val_theta = (linspace(-90, 90, bins_theta) / 180) * pi; % Values of theta are known
val_rho = linspace(-max_rho, max_rho, bins_rho);


%B=[];
A = zeros(bins_rho, bins_theta);
[xx,yy] = find(Ie);

rho = xx(:) .* cos(val_theta) + yy(:) .* sin(val_theta); % compute rho for all thetas
bin_rho = round(((rho + max_rho) / (2 * max_rho)) * length(val_rho)); % Compute bins for rho

for j = 1:size(bin_rho,1)
    for i = 1:bins_theta % Go over all the points
        if bin_rho(j,i) > 0 && bin_rho(j,i) <= bins_rho % Mandatory out-of-bounds check
            A(bin_rho(j,i), i) = A(bin_rho(j,i), i) + 1; % Increment the accumulator cells
        end;
    end;
    %B(:,:,j) = A;
end;
 
%B(:,:) = (A>0);
%C(:,:) = (A<=threshold);
%C(:,:) = C&B;
%A(:,:) = A.*C;

%MODIFIED
%
imagesc(A);
A=nonmaxima_suppression_box(A);
%thresholdamo vse, ki niso "linije"
A = (A>=threshold) .*A;

[r,c] = find(A);
N=[];
for i = 1:size(r,1)
    N = [N A(r(i),c(i))];
end

[Nsorted,idx] = sort(N(:),'descend');
r = r(idx);
c = c(idx);
%[rA,cA] = ndgrid(1:size(A,1),1:size(A,2));
%[ASort,idx] = find(sort(A(:),'descend'));

out_ro = val_rho(r);
out_theta = val_theta(c);
% Display status of the accumulator
%x cos(val_theta) + y sin(val_theta) = rho.
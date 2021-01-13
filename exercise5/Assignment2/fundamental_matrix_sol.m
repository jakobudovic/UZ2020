function [F, e1, e2] = fundamental_matrix_sol(x1,x2)
   
    [NP1,T1] = normalize_points(x1);
    [NP2,T2] = normalize_points(x2);
    A = [];
    % Build matrix A
    for i = 1:size(NP1,2)
        A(i,:) = [NP2(1,i) * NP1(1,i), NP2(1,i) * NP1(2,i), NP2(1,i), NP2(2,i) * NP1(1,i), NP2(2,i) * NP1(2,i),NP2(2,i),NP1(1,i), NP1(2,i),1];        
        %A(i,:) = [NP2(i,1) * NP1(i,1), NP2(i,2) * NP1(i,1), NP1(i,1), NP2(i,1) * NP1(i,2), NP2(i,2) * NP1(i,2),NP1(i,2),NP2(i,1), NP2(i,2),1];      
    end
     % Perform SVD to get the best approximate solution
    [~,~,V] = svd(A);
    % Pazi ali je V transponirana?
    
    
    % Get the vector that corresponds to the smallest eigenvalue (last one,
    % eigenvalues are ordered from largest to smallest)
    v = V(:,9);
    
    % Get the solution
    
    Ft = reshape(v,[3,3]);
    
    % Reduce the rank
    [U,D,V] = svd(Ft);
    D(3,3) = 0;
    
    % Reconstruct
    Ft = U * D * V';
    F = T2' * Ft * T1;
    [U,~,V] = svd(F);
    
    % Compute epipoles
    e1 = V(:,3) / V(3,3);
    e2 = U(:,3) / U(3,3);
    
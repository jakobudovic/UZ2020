function [W,Ms]=lda(X,c,n)
% X: input samples in columns, arranged by classes
% c, n: number of classes, number of samples per class
% W: LDA subspace basis vectors
% Ms: class means in the LDA subspace
SB=0; SW=0;
MM=mean(X')'; %overall mean
for i=1:c
    Ms(:,i)=mean(X(:,(i-1)*n+1:i*n)')'; %class means
    SB=SB+n*(Ms(:,i)-MM)*(Ms(:,i)-MM)'; % between class scatter m.
    for j=1:n % within class scatter matrix
        SW=SW+(X(:,(i-1)*n+j)-Ms(:,i))*(X(:,(i-1)*n+j)-Ms(:,i))';
    end;
end;
% the solution of a generalized eigenproblem:
% opts.issym = 1
opts.tol = 1e-10 
[W, EIGD] = eigs(inv(SW)*SB, c-1,'LM', opts);
Ms=W'*Ms; % map means into the LDA space
function h = draw_gauss2d(mu, Sigma, color, sigmaScale)
% PLOTGAUSS2D Plot a 2D Gaussian as an ellipse with optional cross hairs
% h=plotgauss2(mu, Sigma)
%
% plots at 3.576 sigma
if isempty(color)
    color = 'b' ;
end

h = plotcov2(mu, Sigma, color, sigmaScale); hold on;
plot(mu(1),mu(2), '+', 'color', color, 'LineWidth', 2)


function h = plotcov2(mu, Sigma, colr, varargin)
vrg = varargin ;
varargin = {} ;

if size(Sigma) ~= [2 2], error('Sigma must be a 2 by 2 matrix'); end
if length(mu) ~= 2, error('mu must be a 2 by 1 vector'); end
   
[p, ...
 n, ...
 plot_opts] = process_options(varargin, 'conf', 0.99, 'num-pts', 100);
 
h = [];
% holding = ishold;
if (Sigma == zeros(2, 2))
  z = mu;
else
  % Compute the Mahalanobis radius of the ellipsoid that encloses
  % the desired probability mass.
  k = conf2mahal(p, 2);
  if ~isempty(vrg{1}) 
    k = vrg{1} ;
  end
  [U,D,V] = svd(Sigma) ;
  % Compute the points on the surface of the ellipse.
  t = linspace(0, 2*pi, n);
  u = [cos(t); sin(t)];
  w = (k * V * sqrt(D)) * u;
  z = repmat(mu, [1 n]) + w;
end
h = [h; plot( z(1, :), z(2, :), 'color', colr, 'LineWidth', 2)];

function m = conf2mahal(c, d)
pr = c ; c = (1 - pr)/2 ; 
m = (-sqrt(2)*erfcinv(2*[c 1-c]));
m = m(2) ;

function [varargout] = process_options(args, varargin)
n = length(varargin);
if (mod(n, 2))
  error('Each option must be a string/value pair.');
end

% Check the number of supplied output arguments
if (nargout < (n / 2))
  error('Insufficient number of output arguments given');
elseif (nargout == (n / 2))
  warn = 1;
  nout = n / 2;
else
  warn = 0;
  nout = n / 2 + 1;
end

% Set outputs to be defaults
varargout = cell(1, nout);
for i=2:2:n
  varargout{i/2} = varargin{i};
end

% Now process all arguments
nunused = 0;
for i=1:2:length(args)
  found = 0;
  for j=1:2:n
    if strcmpi(args{i}, varargin{j})
      varargout{(j + 1)/2} = args{i + 1};
      found = 1;
      break;
    end
  end
  if (~found)
    if (warn)
      warning(sprintf('Option ''%s'' not used.', args{i}));
      args{i}
    else
      nunused = nunused + 1;
      unused{2 * nunused - 1} = args{i};
      unused{2 * nunused} = args{i + 1};
    end
  end
end

if (~warn)
  if (nunused)
    varargout{nout} = unused;
  else
    varargout{nout} = cell(0);
  end
end


function h = plot3x(A,varargin)
%plot3x - Plot3 function which takes [N X 3] rather than 3 vectors
%
% Syntax:  [lineHandle] = plot3X(A,'k--o','LineWidth',2)
%
% Inputs:
%    A - [N X 3] - Matrix of pts with A(:,1) = X, A(:,2) = Y, A(:,3) = Z
%
% Outputs:
%    lineHandle - handle - handle to produced line
%
% See also: plot3,  plot

% Author: Adam Gaier
% Bonn-Rhein-Sieg University of Applied Sciences (BRSU)
% email: adam.gaier@h-brs.de
% Oct 2017; Last revision: 02-Oct-2017

%------------- BEGIN CODE --------------

h = plot3(A(:,1),A(:,2),A(:,3),varargin{:})

%------------- END OF CODE --------------
function [spacing] = spacedLog(lower, upper, nPoints, direction)
%spacedLog - Creates log spacing between bounds
%
% Syntax:  [spacing] = spacedLog(lower, upper, nPoints)
%          [spacing] = spacedLog(lower, upper, nPoints,'descend')
%
% Inputs:
%    lower     - [1 X 1 ] - Lower bound
%    upper     - [1 X 1 ] - Upper bound
%    nPoints   - [1 X 1 ] - Number of spaces to produce
%    direction - [string] - Direction of increasing resolution (ascend)
%
% Outputs:
%    spacing - [1 X N] - Spaced points
%
%
% See also: linspace

% Author: Adam Gaier
% Bonn-Rhein-Sieg University of Applied Sciences (BRSU)
% Inria Nancy - Grand Est
% email: adam.gaier@{h-brs.de, inria.fr}
% Nov 2018; Last revision: 15-Nov-2018

%------------- Input Parsing ------------
if nargin < 4; direction = 'descend'; end
%------------- BEGIN CODE --------------
if ~(strcmp(direction, 'ascend') || strcmp(direction, 'descend'))
    error('Invalid direction: Choose ''ascend'' or ''descend''')
end

steepness = 2; 
out = logspace(0, steepness, nPoints);
spacing = ( (out-min(out(:)))*(upper-lower) ) ...
    /( max(out(:))-min(out(:)) ) + lower;

if strcmp(direction,'ascend')
   spacing = -spacing;
   spacing = spacing + (lower - min(spacing));
end 
          
%------------- END OF CODE --------------

%%

%%
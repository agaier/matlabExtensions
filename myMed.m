function [val,indx] = myMed(A,dim)
%myMed - Median function that returns index of median as well as value

% Author: Adam Gaier
% Bonn-Rhein-Sieg University of Applied Sciences (BRSU)
% email: adam.gaier@h-brs.de
% Mar 2017; Last revision: 23-Mar-2017
  if nargin==1
    dim = 1; 
  end
% Make replicate to get 'nearest' median of odd sets
if ~mod(size(A,dim),2)
    A(end+1) = A(end);
end   
    
val = median(A,dim); 
indx = find(A==val,1,'first'); 
end
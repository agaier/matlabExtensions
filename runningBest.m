function [valVec, val, itr] = runningBest(x)
%runningBest - Outputs running best value of a vector
%
% Syntax:  [output1,output2] = function_name(input1,input2,input3)
%
% Inputs:
%    input1 - Description
%    input2 - Description
%    input3 - Description
%
% Outputs:
%    output1 - Description
%    output2 - Description
%
% Example: 
%    Line 1 of example
%    Line 2 of example
%    Line 3 of example
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2

% Author: Adam Gaier
% Bonn-Rhein-Sieg University of Applied Sciences (BRSU)
% email: adam.gaier@h-brs.de
% Aug 2018; Last revision: 23-Aug-2018

%------------- Input Parsing ------------
% parse = inputParser;
% parse.addRequired('input1');
% parse.addOptional('optionalParam', 'default');
% 
% parse.parse(input1,varargin{:});
% input1          = parse.Results.input1;
% optionalParam   = parse.Results.optionalParam;
%------------- BEGIN CODE --------------
valVec = x;
for i=2:length(x)
    valVec(i) = max(valVec(i-1),valVec(i));
end
[val,itr] = unique(valVec);

%------------- END OF CODE --------------
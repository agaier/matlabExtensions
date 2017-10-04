function [output1, output2] = newFunction(input1, varargin)
%FUNCTION_NAME - One line description of what the function or script performs (H1 line)
%Optional file header info (to give more details about the function than in the H1 line)
%Optional file header info (to give more details about the function than in the H1 line)
%Optional file header info (to give more details about the function than in the H1 line)
%
% Syntax:  [output1,output2] = function_name(input1,input2,input3)
%
% Inputs:
%    input1 - [N X N] - Description
%    input2 - [N X N] - Description
%    input3 - [N X N] - Description
%
% Outputs:
%    output1 - [N X N] - Description
%    output2 - [N X N] - Description
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
% Oct 2017; Last revision: 04-Oct-2017

%------------- Input Parsing ------------
parse = inputParser;
parse.addRequired('input1');
parse.addOptional('optionalParam', 'default');

parse.parse(input1,varargin{:});
input1          = parse.Results.input1;
optionalParam   = parse.Results.optionalParam;
%------------- BEGIN CODE --------------

Enter your executable matlab commands here

%------------- END OF CODE --------------
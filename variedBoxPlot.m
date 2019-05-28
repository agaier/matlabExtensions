function h = variedBoxPlot(varargin)
%variedBoxPlot - Box plot with different numbers of samples
% Inspired by: https://www.mathworks.com/matlabcentral/answers/233265-how-to-do-boxplot-for-vectors-with-different-sizes
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
%    A1 = randn(1,10); A2 = randn(1,12); A3 = rand(1,24); A4 = rand(1,1);
%    h = variedBoxPlot(A1,A2,A3,A4);
%    set(gca,'XTickLabel',{'A1','A2','A3','A4'},'FontSize',16)
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2

% Author: Adam Gaier
% Bonn-Rhein-Sieg University of Applied Sciences (BRSU)
% Inria Nancy - Grand Est
% email: adam.gaier@{h-brs.de, inria.fr}
% Sep 2018; Last revision: 26-Sep-2018

% TODO:
% * Write todo list
% * Complete todo list

%------------- BEGIN CODE --------------
G = []; X = [];
for iDataSet = 1:numel(varargin)
    data = iDataSet*ones(size(varargin{iDataSet}));
    G = [G(:); data(:)]; %#ok<AGROW>
    X = [X; varargin{iDataSet}(:)];
end

h= boxplot(X,G(:),'Orientation','horizontal');


%------------- END OF CODE --------------
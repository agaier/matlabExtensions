function [sh,lh] = scatterLine(xData,yData,varargin)
%% Scatter Line
% Plots points as a scatter plot with a smoothed trend line
%
% Author: Adam Gaier
% Bonn-Rhein-Sieg University of Applied Sciences (BRSU)
% email: adam.gaier@h-brs.de
% Jun 2017; Last revision: 01-Sep-2017

if ~isempty(varargin)
    lh = plot(xData,smooth(yData,0.25,'rloess'),varargin{:});
else
    lh = plot(xData,smooth(yData,0.25,'rloess'));
end
hold on;
sh = scatter(xData, yData,'filled');
sh.MarkerFaceColor = lh.Color;
sh.MarkerFaceAlpha = 0.5;
function [sh,lh] = scatterLine(xData,yData,varargin)
%% Scatter Line
% Plots points as a scatter plot with a smoothed line

if ~isempty(varargin)
    lh = plot(xData,smooth(yData,0.25,'rloess'),varargin{:});
else
    lh = plot(xData,smooth(yData,0.25,'rloess'));
end
hold on;
sh = scatter(xData, yData,'filled');
sh.MarkerFaceColor = lh.Color;
sh.MarkerFaceAlpha = 0.5;
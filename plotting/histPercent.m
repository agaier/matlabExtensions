function [handle, freqCount, binValue] = histPercent(data, varargin)
%% histPercent
% Plots histogram with y-axis scaled to percent of total
%
% Author: Adam Gaier
% Bonn-Rhein-Sieg University of Applied Sciences (BRSU)
% email: adam.gaier@h-brs.de
% Nov 2017; Last revision: 05-Nov-2017

[freqCount, binValue] = hist(data, varargin{:});
handle = bar(binValue, freqCount./length(data));
function [SearchLimits] = searchLimDet(center,uniScope,scale,N)
% determine a search limits from those parameters
% By Y. Sun, Mar. 28, 2018, at University of Missouri, Columbia

% input:
%   center: center point of searching
%   uniScope: unit magnanimity of searching scope
%   scale: times of unit magnanimity
%   N: total number of searching points, except center point
% output:
%   SearchLimits: a vector of all searching points, 1x(N+1)


step = 2*uniScope*scale/N;
SearchLimits = center + (-uniScope*scale:step:uniScope*scale);
end
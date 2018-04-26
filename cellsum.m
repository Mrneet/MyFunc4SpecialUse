function [ sumOfCell ] = cellsum( cellInput, varargin )
% sum of cell array, each element in the cell array should be the same dimention
% and same type
% input:
%   cellInput: input cell array
%   varargin: dimention, 1(default) is adding as row, 2 is adding as column
% output:
%   sumOfCell: the sum of cell array

% default dimention
d = 1;

[M,N] = size(cellInput);
if nargin == 2
    d = varargin{1};
elseif nargin > 2 || nargin < 1
    error('Too more argument in the second argument')
end

if M==1 || N==1
    I = max([M,N]);
    sumOfCell = 0;
    for i = 1:I
        sumOfCell = sumOfCell + cellInput{i};
    end
elseif d == 1
    sumOfCell = cell(1,N);
    for i = 1:M
        for j = 1:N
            sumOfCell{1,j} = sumOfCell{1,j} + cellInput{i,j};
        end
    end
elseif d == 2
    sumOfCell = cell(M,1);
    for i = 1:M
        for j = 1:N
            sumOfCell{i,1} = sumOfCell{i,1} + cellInput{i,j};
        end
    end
else
    error('Please check your input Dimention');
end


end


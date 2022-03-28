function [status] = copyDenpendFiles(mainFile,distFolder)
% Copy all dependent files of mainFile to the folder "distFolder". If the
% target folder does not exist, a new folder will be created.
%   By David. Y. Sun, SCU
%   Mar.28, 2022

if ~exist(distFolder,'dir')
    mkdir(distFolder);
end

fList = matlab.codetools.requiredFilesAndProducts(mainFile);

for i = 1:length(fList)
    status(i,1) = copyfile(fList{i},distFolder);
end

if prod(status)
    disp('Copy sucess.')
else
    error('Some file(s) copy failed.');
end

end
function sysInfo = loadSysInfo( )
% Loading current system information that influences the results
% By David Y. Sun, SCU
% Mar. 26, 2022

% get host name
sysInfo.hostName = char(getHostName(java.net.InetAddress.getLocalHost));

% get cpu name
if ispc      % Windows
    command = 'for /f "tokens=2 delims==" %A in (''wmic cpu get name /value'') do @(echo %A)';
elseif ismac % Mac
    command = 'sysctl machdep.cpu | grep brand_string | cut -d: -f2';
else         % Linux
    command = 'grep -m 1 "model name" /proc/cpuinfo | cut -d: -f2';
end

[status, cpuName] = system(command);

if status
    error('getCpuName:WrongSys', ...
        '%s\nTry getCpuName with -mex or -registry', ...
        cpuName);
end
% sysInfo.cpuName = getCpuName('-system');
sysInfo.cpuName = strtrim(cpuName);

% get Matlab version
sysInfo.appVersion = [ver('matlab').Name,' ',ver('matlab').Version,' ',ver('matlab').Release];

end

function sysInfo = loadSysInfo( )
% Loading current system information that influences the results

sysInfo.hostName = char(getHostName(java.net.InetAddress.getLocalHost));
sysInfo.cpuName = getCpuName('-system');
sysInfo.appVersion = [ver('matlab').Name,' ',ver('matlab').Version,' ',ver('matlab').Release];

end
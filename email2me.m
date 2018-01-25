function [] = email2me( myMailAddress, myPassword, targetMailAddress, codeFileName, attachFileName )

% This function is used to send email to an address when the code you run
% is finished. It will send a message and the attachment file.
% 163.com is used as default.
% 

%   myMailAddress: email address used to send from
%   myPassword: its password
%   targetMailAddress: where you want to send to
%   codeFileName: the code you run
%   attachFileName: full name of the attachment

setpref('Internet','E_mail',myMailAddress);
setpref('Internet','SMTP_Server','smtp.163.com');  
setpref('Internet','SMTP_Username',myMailAddress);
setpref('Internet','SMTP_Password',myPassword);
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
subject = [codeFileName,'程序执行状态报告'];  % 发送的邮件主题

% 判断附件大小
fid = fopen(attachFileName);
fseek(fid,0,'eof');
fsize = ftell(fid)/2^20;
[~,hostname] = system('hostname');

if fsize < 50
    content = ['Hello, 您的程序已经运行结束，运行结果可见附件。本机：',hostname];  % 发送的邮件内容
    sendmail(targetMailAddress,subject,content,{attachFileName}); % 设置需要接收的邮箱及主题、内容、附件等
    disp('邮件（包含附件）发送成功。');
else
    disp('附件超过邮箱限制。')
    content = ['Hello, 您的程序已经运行结束。附件',attachFileName,'大小为',num2str(fsize),'M，超过邮箱限制，未发送。本机：',hostname];  % 发送的邮件内容
    sendmail('423548983@qq.com',subject,content); % 设置需要接收的邮箱及主题、内容、附件等
    disp('邮件（不含含附件）发送成功。');
end

end
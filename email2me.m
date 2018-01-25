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
subject = [codeFileName,'����ִ��״̬����'];  % ���͵��ʼ�����

% �жϸ�����С
fid = fopen(attachFileName);
fseek(fid,0,'eof');
fsize = ftell(fid)/2^20;
[~,hostname] = system('hostname');

if fsize < 50
    content = ['Hello, ���ĳ����Ѿ����н��������н���ɼ�������������',hostname];  % ���͵��ʼ�����
    sendmail(targetMailAddress,subject,content,{attachFileName}); % ������Ҫ���յ����估���⡢���ݡ�������
    disp('�ʼ����������������ͳɹ���');
else
    disp('���������������ơ�')
    content = ['Hello, ���ĳ����Ѿ����н���������',attachFileName,'��СΪ',num2str(fsize),'M�������������ƣ�δ���͡�������',hostname];  % ���͵��ʼ�����
    sendmail('423548983@qq.com',subject,content); % ������Ҫ���յ����估���⡢���ݡ�������
    disp('�ʼ������������������ͳɹ���');
end

end
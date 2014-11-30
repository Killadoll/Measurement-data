q=500;
k=30;
fc=50;
wc=2*pi*fc;

% H=tf( k*[1 0], [q/wc 1 q*wc]);

num=k*[1 0];
den=[q/wc 1 q*wc];

H=tf(num,den);

bodeplot(H); grid on;
handler=gcr;
handler.AxesGrid.Xunits = 'Hz'; 
handler.AxesGrid.Yunits = {'abs','deg'}; 
handler.AxesGrid.Grid = 'on';
% 
% 

y=evalin('base','Total');
t=evalin('base','time');


out=filter(num,den,y);

subplot(2,1,2);
% plot(t,out);
% grid on;
% legend('Original Data','Smoothed Data',2);
lsim(H,y,t);
% % 
% fs=44100;
% N = size(t,1);
% Y = fftshift(fft(filt));
% dF = fs/N;
% f = -fs/2:dF:fs/2-dF;
% 
% subplot(2,1,2);
% plot(f,abs(Y)/N);


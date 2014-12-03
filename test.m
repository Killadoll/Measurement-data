close all;

y=evalin('base','Total');
t=evalin('base','time');

figure
subplot(2,1,1);
plot(t,y);grid on;

fs=44100;
N = size(t,1);
Y = fftshift(fft(y));
dF = fs/N;
f = -fs/2:dF:fs/2-dF; 

subplot(2,1,2);
plot(f,abs(Y)/N)
xlim([0 2000]); 
grid on;

fc=50;
indhigh=max(find(f(f<=fc)))
fchigh=f(indhigh) 
indlow=N+2-indhigh
fclow=f(indlow)
Y2=zeros(length(Y),1);
Y2(indlow:indhigh)=Y(indlow:indhigh);
Yi=ifft(ifftshift(Y2));

figure
subplot(2,1,1);
plot(t,Yi); grid on;

subplot(2,1,2);
plot(f,abs(Y2)/N)
xlim([0 2000]); 
grid on;


% figure
% subplot(2,1,1);
% plot(t,xrec); grid on;
% 
% subplot(2,1,2);
% plot(f,abs(ydft)/N)
% xlim([0 2000]); 
% grid on;


% Y2=zeros(length(Y),1);
% Y2(1322:1345)=Y(1322:1345);
% Yi=ifft(ifftshift(Y2));
% 
% figure
% subplot(2,1,1);
% plot(t,abs(Yi)); grid on;
% 
% [pks,locs]=findpeaks((abs(Y)/N),'minpeakdistance',45,...
%             'minpeakheight',0.3);        
%         
% ls=length(locs);
% for m=1:ls 
%     if (f(locs(m))>0)
%         z(:,m)=[f(locs(m));pks(m)];
%     end
%     
%     
% end
% 
% z(1:2,1)

% if pks==z(2,1)
%     disp(locs)
% end
% 
% z(:,all(~any(z),1))=[];
% [~,I]=sort(z(1,:));

% z2=zeros(length(Y),1);
% z2(a)=Y(a);
% zi=ifft(ifftshift(z2));
% 
% figure
% subplot(2,1,1);
% plot(t,zi); grid on;

% 
% x=fix(z(:n)/20)
% zy=ifft(ifftshift(z));


% % 
% fs=44100;
% 
% % wp=[49 51]/(fs/2);
% % ws=[40 60]/(fs/2);
% % rp=3;
% % rs=80;
% % 
% % [n,wn]=buttord(wp,ws,rp,rs);
% 
% % [b,a]=butter(2,[40 50], [30 60],'s');
% 
% 
% q=500;
% k=30;
% fc=50;
% wc=2*pi*fc;
% 
% H=tf( k*[1 0], [q/wc 1 q*wc]);
% % 
% % b=k;
% % a=[q/wc 1 q*wc];
% 
% % n=4;
% % fl=40;
% % fh=60;
% % wn=[fl fh]/(fs/2);
% % 
% % b=fir1(48,[40 60]/(fs*2));
% % freqz(b,1,512)
% 
% % H=tf(b,a)
% 
% bodeplot(H); grid on;
% handler=gcr;
% handler.AxesGrid.Xunits = 'Hz'; 
% handler.AxesGrid.Yunits = {'abs','deg'}; 
% handler.AxesGrid.Grid = 'on';
% % % 
% % % 
% % 
% y=evalin('base','Total');
% t=evalin('base','time');
% 
% % sig=[y,t];
% % % 
% % x=filter(b,a,sig);
% % % 
% % figure
% % plot(t,x);
% % 
% figure
% lsim(H,y,t);
% %  
% % fs=44100;
% % N = size(t,1);
% % Y = fftshift(fft(y));
% % dF = fs/N;
% % f = -fs/2:dF:fs/2-dF;
% % 
% % figure
% % lsim(f,H,abs(Y)/N);
% 

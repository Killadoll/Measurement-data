
function test2

[FileName,PathName]=uigetfile('*.csv','Select the Appliance information (CSV)',...
                'Generated csv files/Signals/');

[fid,err]=fopen(sprintf('%s%s',PathName,FileName));

if fid==-1
    disp(err);
end

cfile=textscan(fid,'%s','CollectOutput',true,'Delimiter',',');
csig=cfile{1};

sig=str2double(csig);

% time=(1:1:22050)/44100;

y=resample(sig,500,22050);

ysig=reshape(y,1,length(y));
% 
% 
% figure;
% subplot 211
% plot(time,sig);
% subplot 212
% plot(t,y);

t=0.001:0.001:0.5;

for i=1:length(t)
    V=230*sin(100*pi*t(1:i));
    I=ysig(1:i);
    
    p=V.*I;
    
    subplot 311
    plot(t(1:i),V);
    xlim([0,0.5]);
    
    subplot 312
    plot(t(1:i),I);
    xlim([0,0.5]);
    
    subplot 313
    plot(t(1:i),p);
    xlim([0,0.5]);
    pause(1/1000)
    
end
            
            

end

% I=0;I1=0;I2=0;I3=0;I4=0;I5=0;I6=0;I7=0;I8=0;I9=0;I10=0;I11=0;I12=0;I13=0;I14=0;I15=0;I16=0;
% 
% [FileName,PathName]=uigetfile('*.csv','Select the Appliance information (CSV)',...
%                 'Generated csv files/Tables/');
% 
%             [fid,err]=fopen(sprintf('%s%s',PathName,FileName));
%             
%             if fid==-1
%                 disp(err);
%             end
%            
%             cfile=textscan(fid,'%s%s%s%s%s%s','CollectOutput',true,'Delimiter',',');
%             ctbl=cfile{1};
%             
%             [row,~]=size(ctbl);
%             
%             for ic=2:3
%                 for ir=2:row
%                     if isequal(ic,2)
%                         amp(ir-1)=str2double(strtok(ctbl(ir,ic)));
%                     elseif isequal(ic,3)
%                         freq(ir-1)=str2double(strtok(ctbl(ir,ic)));
% %                     elseif isequal(ic,4)
% %                         iphase(ir-1)=str2double(strtok(ctbl(ir,ic)));
%                     end
%                 end
%             end       
% 
% t=0.001:0.001:0.5;
%                 
%                 I=(amp(1,1)*sin((2*pi*(freq(1,1))*t)+(iphase(1,1)/(180*pi))))+...
%                     (amp(1,2)*sin((2*pi*(freq(1,2))*t)+(iphase(1,2)/(180*pi))))+...
%                     (amp(1,3)*sin((2*pi*(freq(1,3))*t)+(iphase(1,3)/(180*pi))))+...
%                     (amp(1,4)*sin((2*pi*(freq(1,4))*t)+(iphase(1,4)/(180*pi))))+...
%                     (amp(1,5)*sin((2*pi*(freq(1,5))*t)+(iphase(1,5)/(180*pi))))+...
%                     (amp(1,6)*sin((2*pi*(freq(1,6))*t)+(iphase(1,6)/(180*pi))))+...
%                     (amp(1,7)*sin((2*pi*(freq(1,7))*t)+(iphase(1,7)/(180*pi))))+...
%                     (amp(1,8)*sin((2*pi*(freq(1,8))*t)+(iphase(1,8)/(180*pi))))+...
%                     (amp(1,9)*sin((2*pi*(freq(1,9))*t)+(iphase(1,9)/(180*pi))))+...
%                     (amp(1,10)*sin((2*pi*(freq(1,10))*t)+(iphase(1,10)/(180*pi))))+...
%                     (amp(1,11)*sin((2*pi*(freq(1,11))*t)+(iphase(1,11)/(180*pi))))+...
%                     (amp(1,12)*sin((2*pi*(freq(1,12))*t)+(iphase(1,12)/(180*pi))))+...
%                     (amp(1,13)*sin((2*pi*(freq(1,13))*t)+(iphase(1,13)/(180*pi))))+...
%                     (amp(1,14)*sin((2*pi*(freq(1,14))*t)+(iphase(1,14)/(180*pi))))+...
%                     (amp(1,15)*sin((2*pi*(freq(1,15))*t)+(iphase(1,15)/(180*pi))))+...
%                     (amp(1,16)*sin((2*pi*(freq(1,16))*t)+(iphase(1,16)/(180*pi))));
                
%                 while(1)

%                     for i=1:length(t)
%                         
%                         for isig=1:length(amp)                             
% %                             I=(amp(1,isig))*sin((2*pi*(freq(1,isig))*t(1:i))+(iphase(1,isig)));
%                                 if isequal(isig,1)
%                                     I1=(amp(1,isig))*sin((2*pi*(freq(1,isig))*t(1:i))+(iphase(1,isig)));
%                                 elseif isequal(isig,2)
%                                     I2=((1/3)*(amp(1,isig)))*sin((2*pi*(freq(1,isig))*t(1:i))+(iphase(1,isig)));
%                                 elseif isequal(isig,3)
%                                     I3=((1/5)*(amp(1,isig)))*sin((2*pi*(freq(1,isig))*t(1:i))+(iphase(1,isig)));                                   
%                                 elseif isequal(isig,4)
%                                     I4=((1/7)*(amp(1,isig)))*sin((2*pi*(freq(1,isig))*t(1:i))+(iphase(1,isig)));
%                                 elseif isequal(isig,5)
%                                     I5=((1/9)*(amp(1,isig)))*sin((2*pi*(freq(1,isig))*t(1:i))+(iphase(1,isig)));
%                                 elseif isequal(isig,6)
%                                     I6=((1/11)*(amp(1,isig)))*sin((2*pi*(freq(1,isig))*t(1:i))+(iphase(1,isig)));
%                                 elseif isequal(isig,7)
%                                     I7=((1/13)*(amp(1,isig)))*sin((2*pi*(freq(1,isig))*t(1:i))+(iphase(1,isig)));
%                                 elseif isequal(isig,8)
%                                     I8=((1/15)*(amp(1,isig)))*sin((2*pi*(freq(1,isig))*t(1:i))+(iphase(1,isig)));
%                                 elseif isequal(isig,9)
%                                     I9=((1/17)*(amp(1,isig)))*sin((2*pi*(freq(1,isig))*t(1:i))+(iphase(1,isig)));
%                                 elseif isequal(isig,10)
%                                     I10=((1/19)*(amp(1,isig)))*sin((2*pi*(freq(1,isig))*t(1:i))+(iphase(1,isig)));
%                                 elseif isequal(isig,11)
%                                     I11=((1/21)*(amp(1,isig)))*sin((2*pi*(freq(1,isig))*t(1:i))+(iphase(1,isig)));
%                                 elseif isequal(isig,12)
%                                     I12=((1/23)*(amp(1,isig)))*sin((2*pi*(freq(1,isig))*t(1:i))+(iphase(1,isig)));
%                                 elseif isequal(isig,13)
%                                     I13=((1/25)*(amp(1,isig)))*sin((2*pi*(freq(1,isig))*t(1:i))+(iphase(1,isig)));
%                                 elseif isequal(isig,14)
%                                     I14=((1/27)*(amp(1,isig)))*sin((2*pi*(freq(1,isig))*t(1:i))+(iphase(1,isig)));
%                                 elseif isequal(isig,15)
%                                     I15=((1/29)*(amp(1,isig)))*sin((2*pi*(freq(1,isig))*t(1:i))+(iphase(1,isig)));
%                                 elseif isequal(isig,16)
%                                     I16=((1/31)*(amp(1,isig)))*sin((2*pi*(freq(1,isig))*t(1:i))+(iphase(1,isig)));
%                                 end
%                                 
%                                 
%                         end
%                         
%                     I=I1+I2+I3+I4+I5+I6+I7+I8+I9+I10+I11+I12+I13+I14+I15+I16;
                    
 
%                     plot(t(1:i),I);
%                     figure;
%                     plot(t,I);
%                     xlim([0.001,0.5]);
%                     pause(1/1000)
%                     

%                     end

                    

%                 end
% end


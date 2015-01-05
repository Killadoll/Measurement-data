function inspectGUI

h=figure('units','centimeters','position',[1,1,38.5,20],...
    'toolbar','none','menu','none','name','Signal inspection');

ax4=axes('Units','centimeters','Position',[2 16 17 2],...
    'Parent',h);         
ax5=axes('Units','centimeters','Position',[20.5 16 17 2],...
    'Parent',h); 

ax6=axes('Units','centimeters','Position',[2 7.5 17 3],...
    'Parent',h);
ax7=axes('Units','centimeters','Position',[2 3 17 3],...
    'Parent',h);

  
uicontrol('style','Text','units','centimeters',...
    'position',[0.5,19,6,0.5],'string','Current sources in signal:',...
    'backgroundcolor','white','horizontalalignment','left',...
    'fontweight','bold');

signal();

    function signal(~,~)
        y=evalin('base','Total');
        t=evalin('base','time');
        
        plot(ax4,t,y);
        grid(ax4,'on');
        zoom;
        
        lab=evalin('base','Tot_lab');
        ll=length(lab);
        
        if strcmp(lab(ll),'Total')
            lab(ll)=[];
        end
        
        for j=1:(ll-1)
            A=-3.5+(4*j);
            B=18.5;
            if j==9
                A=(6*(j-8));
                B=18;
            end
            h(j)=uicontrol('style','text','units','centimeters',...
                'position',[A,B,4,0.5],'backgroundcolor','white',...
                'horizontalalignment','left');
            set(h(j),'string',lab(j));
        end 
        
        fs=44100;
        N = size(t,1);
        Y = fftshift(fft(y));
        dF = fs/N;
        f = -fs/2:dF:fs/2-dF; 
    
        plot(ax5,f,abs(Y)/N); 
        set(ax5,'xlim',[0 2100]);
        grid(ax5, 'on'); 
        
        uicontrol('style','Text','units','centimeters',...
            'position',[0.25,11.5,3,0.5],'string',...
            'Harmonics:','backgroundcolor','white',...
            'horizontalalignment','left','fontweight','bold');
        
        rnames={'Frequency','|Current|'};
        tbl1=uitable('units','centimeters','position',[0.25,12.5,38,2],...
            'RowName',rnames);
        
        [pks,locs]=findpeaks((abs(Y)/N),'minpeakdistance',45,...
            'minpeakheight',0.3);        
        
        ls=length(locs);
        for m=1:ls 
            if (f(locs(m))>0)
                z(:,m)=[f(locs(m));pks(m)];                 
            end
        end
            
        z(:,all(~any(z),1))=[];
        [~,I]=sort(z(1,:));

        d=z(:,I);
        set(tbl1,'Data',d);  
       
        xlabel(ax4, 'Time (seconds)');
        ylabel(ax4, 'Amplitude (pixels per sample unit)');
        title(ax4, 'Current waveform');

        xlabel(ax5, 'Frequency (Hz)');
        ylabel(ax5, '|Current|');
        title(ax5, 'Frequency Spectrum');         
                
        h(1)=uicontrol('style','checkbox','units','centimeters',...
            'position',[3.5,11.5,1.5,0.5],'string','Fund',...
            'Callback',@plotH1);   
       h(2)=uicontrol('style','checkbox','units','centimeters',...
            'position',[5.6,11.5,1.5,0.5],'string','3th',...
            'Callback',@plotH2);
        h(3)=uicontrol('style','checkbox','units','centimeters',...
            'position',[7.7,11.5,1.5,0.5],'string','5th',...
            'Callback',@plotH3);
        h(4)=uicontrol('style','checkbox','units','centimeters',...
            'position',[9.8,11.5,1.5,0.5],'string','7th',...
            'Callback',@plotH4);
        h(5)=uicontrol('style','checkbox','units','centimeters',...
            'position',[11.9,11.5,1.5,0.5],'string','9th',...
            'Callback',@plotH5);
        h(6)=uicontrol('style','checkbox','units','centimeters',...
            'position',[14,11.5,1.5,0.5],'string','11th',...
            'Callback',@plotH6);        
        h(7)=uicontrol('style','checkbox','units','centimeters',...
            'position',[16.1,11.5,1.5,0.5],'string','13th',...
            'Callback',@plotH7);
        h(8)=uicontrol('style','checkbox','units','centimeters',...
            'position',[18.2,11.5,1.5,0.5],'string','15th',...
            'Callback',@plotH8);
        h(9)=uicontrol('style','checkbox','units','centimeters',...
            'position',[20.1,11.5,1.5,0.5],'string','17th',...
            'Callback',@plotH9);
        h(10)=uicontrol('style','checkbox','units','centimeters',...
            'position',[22.2,11.5,1.5,0.5],'string','19th',...
            'Callback',@plotH10);
        h(11)=uicontrol('style','checkbox','units','centimeters',...
            'position',[24.3,11.5,1.5,0.5],'string','21st',...
            'Callback',@plotH11);
        h(12)=uicontrol('style','checkbox','units','centimeters',...
            'position',[26.4,11.5,1.5,0.5],'string','23th',...
            'Callback',@plotH12);
        h(13)=uicontrol('style','checkbox','units','centimeters',...
            'position',[28.5,11.5,1.5,0.5],'string','25th',...
            'Callback',@plotH13);
        h(14)=uicontrol('style','checkbox','units','centimeters',...
            'position',[30.6,11.5,1.5,0.5],'string','27th',...
            'Callback',@plotH14);
        h(15)=uicontrol('style','checkbox','units','centimeters',...
            'position',[32.7,11.5,1.5,0.5],'string','29th',...
            'Callback',@plotH15);
        h(16)=uicontrol('style','checkbox','units','centimeters',...
            'position',[34.8,11.5,1.5,0.5],'string','30th',...
            'Callback',@plotH16);
        
        out=cell(20,5);
        Yf=zeros(length(Y),1);        
        
        plotH1();
        
        function plotH1(~,~)
            set(h(1),'value',1);
            set(h(2),'value',0);
            set(h(3),'value',0);
            set(h(4),'value',0);
            set(h(5),'value',0);
            set(h(6),'value',0);
            set(h(7),'value',0);
            set(h(8),'value',0);
            set(h(9),'value',0);
            set(h(10),'value',0);
            set(h(11),'value',0);
            set(h(12),'value',0);
            set(h(13),'value',0);
            set(h(14),'value',0);
            set(h(15),'value',0);
            set(h(16),'value',0);
            plotHarm();
        end
        
        function plotH2(~,~)
            set(h(1),'value',0);
            set(h(3),'value',0);
            set(h(4),'value',0);
            set(h(5),'value',0);
            set(h(6),'value',0);
            set(h(7),'value',0);
            set(h(8),'value',0);
            set(h(9),'value',0);
            set(h(10),'value',0);
            set(h(11),'value',0);
            set(h(12),'value',0);
            set(h(13),'value',0);
            set(h(14),'value',0);
            set(h(15),'value',0);
            set(h(16),'value',0)
            plotHarm();
        end
        
        function plotH3(~,~)
            set(h(1),'value',0);
            set(h(2),'value',0);
            set(h(4),'value',0);
            set(h(5),'value',0);
            set(h(6),'value',0);
            set(h(7),'value',0);
            set(h(8),'value',0);
            set(h(9),'value',0);
            set(h(10),'value',0);
            set(h(11),'value',0);
            set(h(12),'value',0);
            set(h(13),'value',0);
            set(h(14),'value',0);
            set(h(15),'value',0);
            set(h(16),'value',0)
            plotHarm();
        end
        
        function plotH4(~,~)
            set(h(1),'value',0);
            set(h(2),'value',0);
            set(h(3),'value',0);
            set(h(5),'value',0);
            set(h(6),'value',0);
            set(h(7),'value',0);
            set(h(8),'value',0);
            set(h(9),'value',0);
            set(h(10),'value',0);
            set(h(11),'value',0);
            set(h(12),'value',0);
            set(h(13),'value',0);
            set(h(14),'value',0);
            set(h(15),'value',0);
            set(h(16),'value',0)
            plotHarm();
        end
        
        function plotH5(~,~)
            set(h(1),'value',0);
            set(h(2),'value',0);
            set(h(3),'value',0);
            set(h(4),'value',0);
            set(h(6),'value',0);
            set(h(7),'value',0);
            set(h(8),'value',0);
            set(h(9),'value',0);
            set(h(10),'value',0);
            set(h(11),'value',0);
            set(h(12),'value',0);
            set(h(13),'value',0);
            set(h(14),'value',0);
            set(h(15),'value',0);
            set(h(16),'value',0)
            plotHarm();
        end
        
        function plotH6(~,~)
            set(h(1),'value',0);
            set(h(2),'value',0);
            set(h(3),'value',0);
            set(h(4),'value',0);
            set(h(5),'value',0);
            set(h(7),'value',0);
            set(h(8),'value',0);
            set(h(9),'value',0);
            set(h(10),'value',0);
            set(h(11),'value',0);
            set(h(12),'value',0);
            set(h(13),'value',0);
            set(h(14),'value',0);
            set(h(15),'value',0);
            set(h(16),'value',0)
            plotHarm();
        end
        
        function plotH7(~,~)
            set(h(1),'value',0);
            set(h(2),'value',0);
            set(h(3),'value',0);
            set(h(4),'value',0);
            set(h(5),'value',0);
            set(h(6),'value',0);
            set(h(8),'value',0);
            set(h(9),'value',0);
            set(h(10),'value',0);
            set(h(11),'value',0);
            set(h(12),'value',0);
            set(h(13),'value',0);
            set(h(14),'value',0);
            set(h(15),'value',0);
            set(h(16),'value',0)
            plotHarm();
        end
        
        function plotH8(~,~)
            set(h(1),'value',0);
            set(h(2),'value',0);
            set(h(3),'value',0);
            set(h(4),'value',0);
            set(h(5),'value',0);
            set(h(6),'value',0);
            set(h(7),'value',0);
            set(h(9),'value',0);
            set(h(10),'value',0);
            set(h(11),'value',0);
            set(h(12),'value',0);
            set(h(13),'value',0);
            set(h(14),'value',0);
            set(h(15),'value',0);
            set(h(16),'value',0)
            plotHarm();
        end
        
        function plotH9(~,~)
            set(h(1),'value',0);
            set(h(2),'value',0);
            set(h(3),'value',0);
            set(h(4),'value',0);
            set(h(5),'value',0);
            set(h(6),'value',0);
            set(h(7),'value',0);
            set(h(8),'value',0);
            set(h(10),'value',0);
            set(h(11),'value',0);
            set(h(12),'value',0);
            set(h(13),'value',0);
            set(h(14),'value',0);
            set(h(15),'value',0);
            set(h(16),'value',0)
            plotHarm();
        end
        
        function plotH10(~,~)
            set(h(1),'value',0);
            set(h(2),'value',0);
            set(h(3),'value',0);
            set(h(4),'value',0);
            set(h(5),'value',0);
            set(h(6),'value',0);
            set(h(7),'value',0);
            set(h(8),'value',0);
            set(h(9),'value',0);
            set(h(11),'value',0);
            set(h(12),'value',0);
            set(h(13),'value',0);
            set(h(14),'value',0);
            set(h(15),'value',0);
            set(h(16),'value',0)
            plotHarm();
        end
        
        function plotH11(~,~)
            set(h(1),'value',0);
            set(h(2),'value',0);
            set(h(3),'value',0);
            set(h(4),'value',0);
            set(h(5),'value',0);
            set(h(6),'value',0);
            set(h(7),'value',0);
            set(h(8),'value',0);
            set(h(9),'value',0);
            set(h(10),'value',0);
            set(h(12),'value',0);
            set(h(13),'value',0);
            set(h(14),'value',0);
            set(h(15),'value',0);
            set(h(16),'value',0)
            plotHarm();
        end
        
        function plotH12(~,~)
            set(h(1),'value',0);
            set(h(2),'value',0);
            set(h(3),'value',0);
            set(h(4),'value',0);
            set(h(5),'value',0);
            set(h(6),'value',0);
            set(h(7),'value',0);
            set(h(8),'value',0);
            set(h(9),'value',0);
            set(h(10),'value',0);
            set(h(11),'value',0);
            set(h(13),'value',0);
            set(h(14),'value',0);
            set(h(15),'value',0);
            set(h(16),'value',0)
            plotHarm();
        end
        
        function plotH13(~,~)
            set(h(1),'value',0);
            set(h(2),'value',0);
            set(h(3),'value',0);
            set(h(4),'value',0);
            set(h(5),'value',0);
            set(h(6),'value',0);
            set(h(7),'value',0);
            set(h(8),'value',0);
            set(h(9),'value',0);
            set(h(10),'value',0);
            set(h(11),'value',0);
            set(h(12),'value',0);
            set(h(14),'value',0);
            set(h(15),'value',0);
            set(h(16),'value',0)
            plotHarm();
        end
        
        function plotH14(~,~)
            set(h(1),'value',0);
            set(h(2),'value',0);
            set(h(3),'value',0);
            set(h(4),'value',0);
            set(h(5),'value',0);
            set(h(6),'value',0);
            set(h(7),'value',0);
            set(h(8),'value',0);
            set(h(9),'value',0);
            set(h(10),'value',0);
            set(h(11),'value',0);
            set(h(12),'value',0);
            set(h(13),'value',0);
            set(h(15),'value',0);
            set(h(16),'value',0)
            plotHarm();
        end
        
        function plotH15(~,~)
            set(h(1),'value',0);
            set(h(2),'value',0);
            set(h(3),'value',0);
            set(h(4),'value',0);
            set(h(5),'value',0);
            set(h(6),'value',0);
            set(h(7),'value',0);
            set(h(8),'value',0);
            set(h(9),'value',0);
            set(h(10),'value',0);
            set(h(11),'value',0);
            set(h(12),'value',0);
            set(h(13),'value',0);
            set(h(14),'value',0);
            set(h(16),'value',0)
            plotHarm();
        end
        
        function plotH16(~,~)
            set(h(1),'value',0);
            set(h(2),'value',0);
            set(h(3),'value',0);
            set(h(4),'value',0);
            set(h(5),'value',0);
            set(h(6),'value',0);
            set(h(7),'value',0);
            set(h(8),'value',0);
            set(h(9),'value',0);
            set(h(10),'value',0);
            set(h(11),'value',0);
            set(h(12),'value',0);
            set(h(13),'value',0);
            set(h(14),'value',0);
            set(h(15),'value',0);
            plotHarm();
        end        
                      
        function plotHarm(~,~)            
            if get(h(1),'value')
                fc=z(1,1); 
            elseif get(h(2),'value')
                fc=z(1,2);
            elseif get(h(3),'value')
                fc=z(1,3);
            elseif get(h(4),'value')
                fc=z(1,4);
            elseif get(h(5),'value')
                fc=z(1,5);
            elseif get(h(6),'value')
                fc=z(1,6);
            elseif get(h(7),'value')
                fc=z(1,7);
            elseif get(h(8),'value')
                fc=z(1,8);
            elseif get(h(9),'value')
                fc=z(1,9);
            elseif get(h(10),'value')
                fc=z(1,10);
            elseif get(h(11),'value')
                fc=z(1,11);
            elseif get(h(12),'value')
                fc=z(1,12);
            elseif get(h(13),'value')
                fc=z(1,13);
            elseif get(h(14),'value')
                fc=z(1,14);
            elseif get(h(15),'value')
                fc=z(1,15);
            elseif get(h(16),'value')
                fc=z(1,16);
            else
                fc=0;        
            end            
           
            indfc=find(f(f<=fc), 1, 'last' );
            %ffc=f(indfc);
            indlow=indfc-1;
            %flow=f(indlow);
            indhigh=indfc+1;
            %fhigh=f(indhigh); 
            
            Yh=zeros(length(Y),1);
            
            if fc>0  
                if isequal(fc,z(1,1))
                   Yf(indlow:indhigh)=Y(indlow:indhigh); 
                else                    
                    Yh(indlow:indhigh)=Y(indlow:indhigh);
                end
            else
                Yf=zeros(length(Y),1);
                Yh=zeros(length(Y),1);
            end
            
            Yi_f=ifft(ifftshift(Yf));
            Yi_ff=fftshift(fft(Yi_f));
            Yi_h=ifft(ifftshift(Yh));
            Yi_hf=fftshift(fft(Yi_h));            
            
            if isequal(fc,z(1,1))               
                plot(ax6,t,real(Yi_f));
                grid(ax6,'on');
                
                plot(ax7,f,abs(Yf)/N);
                set(ax7,'xlim',[0 2100]);
                grid(ax7,'on');
            else               
                plot(ax6,t,real(Yi_h));
                grid(ax6,'on');
                
                plot(ax7,f,abs(Yh)/N);
                set(ax7,'xlim',[0 2100]);
                grid(ax7,'on');
            end                        
            
            xlabel(ax6, 'Time (seconds)');
            ylabel(ax6, 'Amplitude (pixels per sample unit)');
            title(ax6, 'Current waveform');

            xlabel(ax7, 'Frequency (Hz)');
            ylabel(ax7, '|Current|');
            title(ax7, 'Frequency Spectrum');  
            
            rnames={'Fundamental','3th','5th','7th','9th','11th','13th',...
                '15th','17th','19th','21st','23th','25th','27th',...
                '29th','30th'};
            cnames={'Amplitude','Frequency','Phase','Phaseshift','THD_percentage_of_fundamental'};
            tbl2=uitable('units','centimeters','position',[19.5,1.5,18,9.5],...
                'RowName',rnames,'ColumnName',cnames);
            set(tbl2,'columnwidt',{'auto','auto',100,'auto','auto'});
                       
            [~,idx_yif]=max(abs(Yi_ff));
            [~,idx_yih]=max(abs(Yi_hf));
            phase_yif=angle(Yi_ff(idx_yif));
            phase_yih=angle(Yi_hf(idx_yih));
            phase_shift=phase_yih-phase_yif; 
            
            if isequal(fc,z(1,1))
                out{1,1}=sprintf('%c%c%c',num2str(z(2,1)),' ','A');
                out{1,2}=sprintf('%c%c%c%c',num2str(z(1,1)),' ','Hz');
                out{1,3}=sprintf('%f%c%c',(phase_yif/pi)*180,' ',char(176));
                out{1,4}=sprintf('%f%c%c',0,' ',char(176)); 
                out{1,5}=sprintf('%c%c%c','100',' ','%');
            elseif isequal(fc,z(1,2))
                out{2,1}=sprintf('%c%c%c',num2str(z(2,2)),' ','A');
                out{2,2}=sprintf('%c%c%c%c',num2str(z(1,2)),' ','Hz');
                out{2,3}=sprintf('%f%c%c',(phase_yih/pi)*180,' ',char(176));
                out{2,4}=sprintf('%f%c%c',(phase_shift/pi)*180,' ',char(176));
                out{2,5}=sprintf('%c%c%c',num2str(z(2,2)/(z(2,1)/100)),' ','%');
            elseif isequal(fc,z(1,3))
                out{3,1}=sprintf('%c%c%c',num2str(z(2,3)),' ','A');
                out{3,2}=sprintf('%c%c%c%c',num2str(z(1,3)),' ','Hz');
                out{3,3}=sprintf('%f%c%c',(phase_yih/pi)*180,' ',char(176));
                out{3,4}=sprintf('%f%c%c',(phase_shift/pi)*180,' ',char(176));
                out{3,5}=sprintf('%c%c%c',num2str(z(2,3)/(z(2,1)/100)),' ','%');
            elseif isequal(fc,z(1,4))
                out{4,1}=sprintf('%c%c%c',num2str(z(2,4)),' ','A');
                out{4,2}=sprintf('%c%c%c%c',num2str(z(1,4)),' ','Hz');
                out{4,3}=sprintf('%f%c%c',(phase_yih/pi)*180,' ',char(176));
                out{4,4}=sprintf('%f%c%c',(phase_shift/pi)*180,' ',char(176));
                out{4,5}=sprintf('%c%c%c',num2str(z(2,4)/(z(2,1)/100)),' ','%');
            elseif isequal(fc,z(1,5))
                out{5,1}=sprintf('%c%c%c',num2str(z(2,5)),' ','A');
                out{5,2}=sprintf('%c%c%c%c',num2str(z(1,5)),' ','Hz');
                out{5,3}=sprintf('%f%c%c',(phase_yih/pi)*180,' ',char(176));
                out{5,4}=sprintf('%f%c%c',(phase_shift/pi)*180,' ',char(176));
                out{5,5}=sprintf('%c%c%c',num2str(z(2,5)/(z(2,1)/100)),' ','%');
            elseif isequal(fc,z(1,6))
                out{6,1}=sprintf('%c%c%c',num2str(z(2,6)),' ','A');
                out{6,2}=sprintf('%c%c%c%c',num2str(z(1,6)),' ','Hz');
                out{6,3}=sprintf('%f%c%c',(phase_yih/pi)*180,' ',char(176));
                out{6,4}=sprintf('%f%c%c',(phase_shift/pi)*180,' ',char(176));
                out{6,5}=sprintf('%c%c%c',num2str(z(2,6)/(z(2,1)/100)),' ','%');
            elseif isequal(fc,z(1,7))
                out{7,1}=sprintf('%c%c%c',num2str(z(2,7)),' ','A');
                out{7,2}=sprintf('%c%c%c%c',num2str(z(1,7)),' ','Hz');
                out{7,3}=sprintf('%f%c%c',(phase_yih/pi)*180,' ',char(176));
                out{7,4}=sprintf('%f%c%c',(phase_shift/pi)*180,' ',char(176));
                out{7,5}=sprintf('%c%c%c',num2str(z(2,7)/(z(2,1)/100)),' ','%');
            elseif isequal(fc,z(1,8))
                out{8,1}=sprintf('%c%c%c',num2str(z(2,8)),' ','A');
                out{8,2}=sprintf('%c%c%c%c',num2str(z(1,8)),' ','Hz');
                out{8,3}=sprintf('%f%c%c',(phase_yih/pi)*180,' ',char(176));
                out{8,4}=sprintf('%f%c%c',(phase_shift/pi)*180,' ',char(176));
                out{8,5}=sprintf('%c%c%c',num2str(z(2,8)/(z(2,1)/100)),' ','%');
            elseif isequal(fc,z(1,9))
                out{9,1}=sprintf('%c%c%c',num2str(z(2,9)),' ','A');
                out{9,2}=sprintf('%c%c%c%c',num2str(z(1,9)),' ','Hz');
                out{9,3}=sprintf('%f%c%c',(phase_yih/pi)*180,' ',char(176));
                out{9,4}=sprintf('%f%c%c',(phase_shift/pi)*180,' ',char(176));
                out{9,5}=sprintf('%c%c%c',num2str(z(2,9)/(z(2,1)/100)),' ','%');
            elseif isequal(fc,z(1,10))
                out{10,1}=sprintf('%c%c%c',num2str(z(2,10)),' ','A');
                out{10,2}=sprintf('%c%c%c%c',num2str(z(1,10)),' ','Hz');
                out{10,3}=sprintf('%f%c%c',(phase_yih/pi)*180,' ',char(176));
                out{10,4}=sprintf('%f%c%c',(phase_shift/pi)*180,' ',char(176));
                out{10,5}=sprintf('%c%c%c',num2str(z(2,10)/(z(2,1)/100)),' ','%');
            elseif isequal(fc,z(1,11))
                out{11,1}=sprintf('%c%c%c',num2str(z(2,11)),' ','A');
                out{11,2}=sprintf('%c%c%c%c',num2str(z(1,11)),' ','Hz');
                out{11,3}=sprintf('%f%c%c',(phase_yih/pi)*180,' ',char(176));
                out{11,4}=sprintf('%f%c%c',(phase_shift/pi)*180,' ',char(176));
                out{11,5}=sprintf('%c%c%c',num2str(z(2,11)/(z(2,1)/100)),' ','%');
            elseif isequal(fc,z(1,12))
                out{12,1}=sprintf('%c%c%c',num2str(z(2,12)),' ','A');
                out{12,2}=sprintf('%c%c%c%c',num2str(z(1,12)),' ','Hz');
                out{12,3}=sprintf('%f%c%c',(phase_yih/pi)*180,' ',char(176));
                out{12,4}=sprintf('%f%c%c',(phase_shift/pi)*180,' ',char(176));
                out{12,5}=sprintf('%c%c%c',num2str(z(2,12)/(z(2,1)/100)),' ','%');
            elseif isequal(fc,z(1,13))
                out{13,1}=sprintf('%c%c%c',num2str(z(2,13)),' ','A');
                out{13,2}=sprintf('%c%c%c%c',num2str(z(1,13)),' ','Hz');
                out{13,3}=sprintf('%f%c%c',(phase_yih/pi)*180,' ',char(176));
                out{13,4}=sprintf('%f%c%c',(phase_shift/pi)*180,' ',char(176));
                out{13,5}=sprintf('%c%c%c',num2str(z(2,13)/(z(2,1)/100)),' ','%');
            elseif isequal(fc,z(1,14))
                out{14,1}=sprintf('%c%c%c',num2str(z(2,14)),' ','A');
                out{14,2}=sprintf('%c%c%c%c',num2str(z(1,14)),' ','Hz');
                out{14,3}=sprintf('%f%c%c',(phase_yih/pi)*180,' ',char(176));
                out{14,4}=sprintf('%f%c%c',(phase_shift/pi)*180,' ',char(176));
                out{14,5}=sprintf('%c%c%c',num2str(z(2,14)/(z(2,1)/100)),' ','%');
            elseif isequal(fc,z(1,15))
                out{15,1}=sprintf('%c%c%c',num2str(z(2,15)),' ','A');
                out{15,2}=sprintf('%c%c%c%c',num2str(z(1,15)),' ','Hz');
                out{15,3}=sprintf('%f%c%c',(phase_yih/pi)*180,' ',char(176));
                out{15,4}=sprintf('%f%c%c',(phase_shift/pi)*180,' ',char(176));
                out{15,5}=sprintf('%c%c%c',num2str(z(2,15)/(z(2,1)/100)),' ','%');
            elseif isequal(fc,z(1,16))
                out{16,1}=sprintf('%c%c%c',num2str(z(2,16)),' ','A');
                out{16,2}=sprintf('%c%c%c%c',num2str(z(1,16)),' ','Hz');
                out{16,3}=sprintf('%f%c%c',(phase_yih/pi)*180,' ',char(176));
                out{16,4}=sprintf('%f%c%c',(phase_shift/pi)*180,' ',char(176));
                out{16,5}=sprintf('%c%c%c',num2str(z(2,16)/(z(2,1)/100)),' ','%');
            elseif isequal(fc,z(1,17))
                out{17,1}=sprintf('%c%c%c',num2str(z(2,17)),' ','A');
                out{17,2}=sprintf('%c%c%c%c',num2str(z(1,17)),' ','Hz');
                out{17,3}=sprintf('%f%c%c',(phase_yih/pi)*180,' ',char(176));
                out{17,4}=sprintf('%f%c%c',(phase_shift/pi)*180,' ',char(176));
                out{17,5}=sprintf('%c%c%c',num2str(z(2,17)/(z(2,1)/100)),' ','%');
            elseif isequal(fc,z(1,18))
                out{18,1}=sprintf('%c%c%c',num2str(z(2,18)),' ','A');
                out{18,2}=sprintf('%c%c%c%c',num2str(z(1,18)),' ','Hz');
                out{18,3}=sprintf('%f%c%c',(phase_yih/pi)*180,' ',char(176));
                out{18,4}=sprintf('%f%c%c',(phase_shift/pi)*180,' ',char(176));
                out{18,5}=sprintf('%c%c%c',num2str(z(2,18)/(z(2,1)/100)),' ','%');
            elseif isequal(fc,z(1,19))
                out{19,1}=sprintf('%c%c%c',num2str(z(2,19)),' ','A');
                out{19,2}=sprintf('%c%c%c%c',num2str(z(1,19)),' ','Hz');
                out{19,3}=sprintf('%f%c%c',(phase_yih/pi)*180,' ',char(176));
                out{19,4}=sprintf('%f%c%c',(phase_shift/pi)*180,' ',char(176));
                out{19,5}=sprintf('%c%c%c',num2str(z(2,19)/(z(2,1)/100)),' ','%');
            elseif isequal(fc,z(1,20))
                out{20,1}=sprintf('%c%c%c',num2str(z(2,20)),' ','A');
                out{20,2}=sprintf('%c%c%c%c',num2str(z(1,20)),' ','Hz');
                out{20,3}=sprintf('%f%c%c',(phase_yih/pi)*180,' ',char(176));
                out{20,4}=sprintf('%f%c%c',(phase_shift/pi)*180,' ',char(176));
                out{20,5}=sprintf('%c%c%c',num2str(z(2,20)/(z(2,1)/100)),' ','%');
            end           
                       
            set(tbl2,'Data',out); 
            
            ex.h = uicontrol('style','pushbutton','units','centimeters',...
                'position',[7,0.25,5,1],'string','Write to CVS',...
                'callback',@ex_call);

            function ex_call(varargin)
                labtot=evalin('base','Tot_lab');
                l=length(labtot);
                label=cell(1,(l-1));
                
                for i=1:(l-1)
                    if ~isequal(i,(l-1))
                        label{i}=sprintf('%s%c',labtot{i},'+');
                    else
                        label{i}=sprintf('%s%c',labtot{i});
                    end
                end

                filename=sprintf('%s%c%c',label{:},'.csv');
                
                fid=fopen(filename,'w');
                fprintf(fid,'%s, %s, %s, %s, %s, %s\n',' ',cnames{1,:});
                
                for ii=1:16
                    fprintf(fid,'%s, %s, %s, %s, %s, %s\n',rnames{1,(ii)},out{(ii),:});
                end
                
                msgbox(sprintf('%s%s','Data is placed in:',filename));            
                fclose(fid);          
               
            end

        end

G.h=uicontrol('style','pushbutton','units','centimeters',...
    'position',[0.5,0.25,5,1],'string','Generate new signal',...
    'callback',@g_call);

    function g_call(varargin)
        plotGUI();
        hh=findobj('Name','Signal inspection');
        close(hh);
    end

E.h = uicontrol('style','pushbutton','units','centimeters',...
    'position',[14,0.25,5,1],'string','End Program',...
    'callback',@eh_call);

    function eh_call(varargin)
        eh=findobj('Name','Signal inspection');
        close(eh);
    end


        
    end

h(100) = uicontrol('style','checkbox','units','centimeters',...
    'position',[34.5,18.5,3.5,1],'string','Place/use cursor',...
    'Callback',@placeCursor); 

    function placeCursor(~,~) 
        
                
        
       if get(h(100),'Value')
            datacursormode on;
        else
            datacursormode off;
            zoom on;
       end 
        

    
    
    end
end
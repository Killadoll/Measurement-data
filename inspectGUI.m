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
        
        lz=size(z,2);
        if lz>16
            lz=16;
        end
                
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
        h(17)=uicontrol('style','checkbox','units','centimeters',...
            'position',[34.8,11,3,0.5],'string','Get all',...
            'Callback',@plotH17);
        
        for hi=1:16
            if h(hi)>h(lz)
                set(h(hi),'enable','off');                
            end
        end        
        
        out=cell(lz,5);
        Yf=zeros(length(Y),1); 
        
        set(h(1),'value',1);        
                
        plotH1();
        
        function plotH1(~,~)    
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
            set(h(2),'value',1);
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
            set(h(3),'value',1);
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
            set(h(4),'value',1);
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
            set(h(5),'value',1);
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
            set(h(6),'value',1);
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
            set(h(7),'value',1);
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
            set(h(8),'value',1);
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
            set(h(9),'value',1);
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
            set(h(10),'value',1);
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
            set(h(11),'value',1);
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
            set(h(12),'value',1);
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
            set(h(13),'value',1);
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
            set(h(14),'value',1);
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
            set(h(15),'value',1);
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
            set(h(16),'value',1);
            plotHarm();
        end 
        
        function plotH17(~,~)
            val=get(h(17),'value');
            if isequal(val,1)
                plotHarm();
            end
        end
                     
        function plotHarm(~,~)
            for zi=1:lz  
                if get(h(zi),'value')
                    fc=z(1,zi); 
                    
                    indfc=find(f(f<=fc), 1, 'last' );
                    %ffc=f(indfc);
                    indlow=indfc-1;
                    %flow=f(indlow);
                    indhigh=indfc+1;
                    %fhigh=f(indhigh); 
                    
                    Yh=zeros(length(Y),1);

                    if fc>0 
                        if isequal(zi,1)
                           Yf(indlow:indhigh)=Y(indlow:indhigh); 
                        else                    
                            Yh(indlow:indhigh)=Y(indlow:indhigh);
                        end
                    else
                        Yh=zeros(length(Y),1);
                    end

                    Yi_f=ifft(ifftshift(Yf));
                    Yi_ff=fftshift(fft(Yi_f));
                    Yi_h=ifft(ifftshift(Yh));
                    Yi_hf=fftshift(fft(Yi_h));  

                    if ~get(h(17),'value')
                        if isequal(zi,1)          
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

                    if isequal(fc,z(1,zi))
                        out{zi,1}=sprintf('%c%c%c',num2str(z(2,zi)),' ','A');
                        out{zi,2}=sprintf('%c%c%c%c',num2str(z(1,zi)),' ','Hz');

                        if isequal(fc,z(1,1))
                            out{zi,3}=sprintf('%f%c%c',(phase_yif/pi)*180,' ',char(176));
                            out{zi,4}=sprintf('%f%c%c',0,' ',char(176)); 
                            out{zi,5}=sprintf('%c%c%c','100',' ','%');
                        else
                            out{zi,3}=sprintf('%f%c%c',(phase_yih/pi)*180,' ',char(176));
                            out{zi,4}=sprintf('%f%c%c',(phase_shift/pi)*180,' ',char(176));
                            out{zi,5}=sprintf('%c%c%c',num2str(z(2,zi)/(z(2,1)/100)),' ','%');
                        end
                    end                                         

                    if get(h(17),'value')
                        if isequal(get(h(17),'value'),1)&& zi<lz
                            if get(h(1),'value')
                                plotH2();
                            elseif get(h(2),'value')
                                plotH3(); 
                            elseif get(h(3),'value')
                                plotH4();
                            elseif get(h(4),'value')
                                plotH5();
                            elseif get(h(5),'value')
                                plotH6();
                            elseif get(h(6),'value')
                                plotH7(); 
                            elseif get(h(7),'value')
                                plotH8();
                            elseif get(h(8),'value')
                                plotH9();
                            elseif get(h(9),'value')
                                plotH10();
                            elseif get(h(10),'value')
                                plotH11();
                            elseif get(h(11),'value')
                                plotH12();
                            elseif get(h(12),'value')
                                plotH13();
                            elseif get(h(13),'value')
                                plotH14();
                            elseif get(h(14),'value')
                                plotH15();
                            elseif get(h(15),'value')
                                plotH16();
                            end
                            
                        elseif isequal(get(h(17),'value'),1)&& isequal(zi,lz)
                            set(h(17),'value',0);
                            set(h(zi),'value',0);
                        end
                    
                    end
                
                end

            end
                       
            set(tbl2,'Data',out); 
            
            G.h=uicontrol('style','pushbutton','units','centimeters',...
            'position',[0.5,0.25,5,1],'string','Generate new signal',...
            'callback',@g_call);

            function g_call(varargin)
                plotGUI();
                hh=findobj('Name','Signal inspection');
                close(hh);
            end
            
            filt.h=uicontrol('style','pushbutton','units','centimeters',...
            'position',[6,0.25,5,1],'string','Filter options',...
            'callback',@f_call);
            set(filt.h,'enable','off');
        
            s.h=uicontrol('style','pushbutton','units','centimeters',...
                'position',[11.5,0.25,5,1],'string','Signal recognition',...
                'callback',@s_call);
            set(s.h,'enable','off');
            
            exs.h = uicontrol('style','pushbutton','units','centimeters',...
                'position',[22,0.25,5,1],'string','Write signal to CVS',...
                'callback',@exs_call);
            
            ext.h = uicontrol('style','pushbutton','units','centimeters',...
                'position',[27.5,0.25,5,1],'string','Write table to CVS',...
                'callback',@ext_call);
            
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
                
            function exs_call(varargin)
                filename=sprintf('%s%s%c%c%s','Generated csv files/Signals/',label{:},'_signal','.csv');
                [fid,msg]=fopen(filename,'w');
                if fid==-1
                    error(msg)
                end
                
                signal=num2cell(y);
                
                for ii=1:22050
                    fprintf(fid,'%d\n',signal{(ii),:});
                end
                
                msgbox(sprintf('%s%s','Signal data is placed in:',filename));            
                fclose(fid);
                
            end

            function ext_call(varargin)
                filename=sprintf('%s%s%c%c','Generated csv files/Tables/',label{:},'.csv');
                
                fid=fopen(filename,'w');
                fprintf(fid,'%s, %s, %s, %s, %s, %s\n',' ',cnames{1,:});
                
                qs1=['WARNING: The table does not contain '...
                        'information for all harmonics.'];                
                qs2=['(Only the current table will be presented in the '...
                        'CVS file)'];
                qs3=['Do you want to generate these values before '...
                    'writing to CVS? '];
                qstring=sprintf('%s\n\n%s\n\n\n%s',qs1,qs2,qs3);
                    
                if any(cellfun(@isempty,out),1)

                    choice=questdlg(qstring, 'CVS warning','Yes',...
                        'No, write to CVS now','No, write to CVS now');
                    
                    switch choice
                        case 'Yes'
                            set(h(17),'value',1);
                            plotHarm();
                        case 'No, write to CVS now'                        
                    end
                    
                end
                
                for ii=1:lz
                    fprintf(fid,'%s, %s, %s, %s, %s, %s\n',rnames{1,(ii)},out{(ii),:});
                end
                
                msgbox(sprintf('%s%s','Table data is placed in:',filename));            
                fclose(fid);          
               
            end

        end

        E.h = uicontrol('style','pushbutton','units','centimeters',...
            'position',[33,0.25,5,1],'string','End Program',...
            'callback',@eh_call);

            function eh_call(varargin)
                eh=findobj('Name','Signal inspection');
                close(eh);
                disp('Program ended by user');
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
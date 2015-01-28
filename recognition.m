function recognition

r=figure('units','centimeters','position',[1,1,38.5,20],...
    'toolbar','none','menu','none','name','Recognize appliances');

ax8=axes('Units','centimeters','Position',[2 17 10 2],...
    'Parent',r); 
ax9=axes('Units','centimeters','Position',[14 17 10 2],...
    'Parent',r); 
ax10=axes('Units','centimeters','Position',[26 17 10 2],...
    'Parent',r);
ax11=axes('Units','centimeters','Position',[26 11 10 4],...
    'Parent',r);


start();

    function start(~,~)              
        
        w=(100*pi);
        Av=230;
        Ai=230/50;
        ph=-pi/4; 
        I=0; sigs=0; Isigs=0;
        t1=0.001; t2=0.5;
        start=0; quit=0; ex=0;
        
        zoom on;      
        
        s.r= uicontrol('style','pushbutton','units','centimeters',...
            'position',[2,14.5,5,1],'string','Start/Stop Signal',...
            'callback',@sr_call);

            function sr_call(varargin)
                if isequal(start,0)
                    start=1;
                else
                    start=0;
                end
                plotSin();                
            end 
            
        p.r= uicontrol('style','pushbutton','units','centimeters',...
            'position',[7.5,14.5,2.5,1],'string','Pause',...
            'callback','uiwait(gcbf)');
        res.r= uicontrol('style','pushbutton','units','centimeters',...
            'position',[10.5,14.5,2.5,1],'string','Resume',...
            'callback','uiresume(gcbf)');
        
        g.r=uicontrol('style','pushbutton','units','centimeters',...
            'position',[2,13,4,1],'string','Add appliance',...
            'Callback',@getApp); 
        
        function getApp(~,~)
            [FileName,PathName]=uigetfile('*.csv','Select the Appliance information (CSV)',...
                'Generated csv files/Signals/');

            fid=fopen(sprintf('%s%s',PathName,FileName));

            cfile=textscan(fid,'%s','CollectOutput',true,'Delimiter',',');
            csig=cfile{1};

            sig=str2double(csig);

            sigs=resample(sig,500,22050); % Downsample
            Isigs=reshape(sigs,1,length(sigs));

            ex=1;
            plotSin();

        end
        
        function plotSin(~,~)
            t=t1:0.001:t2;
            
            while isequal(start,1)
                for i=1:length(t)
                    
                    if isequal(start,1) && isequal(quit,0)
                      
                        V=Av*sin(w*t(1:i));

                        if isequal(ex,0)
                            I=Ai*sin((w*t(1:i))+ph);
                        else
                            I=Isigs(1:i);                          
                        end
                        P=V.*I;

                        plot(ax8,t(1:i),V);
                        set(ax8,'xlim',[t1 t2]);
                        grid(ax8,'on');
                        xlabel(ax8, 'Time (seconds)');
                        ylabel(ax8, 'Amplitude (V)');
                        title(ax8, 'Supply Voltage (simulated)');

                        plot(ax9,t(1:i),I,'r');
                        set(ax9,'xlim',[t1 t2]);
                        grid(ax9,'on');
                        xlabel(ax9, 'Time (seconds)');
                        ylabel(ax9, 'Amplitude (A)');
                        title(ax9, 'Current');

                        plot(ax10,t(1:i),P,'g');
                        set(ax10,'xlim',[t1 t2]);
                        grid(ax10,'on');
                        xlabel(ax10, 'Time (seconds)');
                        ylabel(ax10, 'Amplitude');
                        title(ax10, 'Power (W)');
                        
                        plot(ax11,t(1:i),V,'b',t(1:i),I,'r',t(1:i),P,'g');
                        set(ax11,'xlim',[t1 t2]);
                        grid(ax11,'on');
                        xlabel(ax11, 'Time (seconds)');
                        ylabel(ax11, 'Amplitude');
                        title(ax11, 'Signals');
                        pause(1/1000)

                        if isequal(i,length(t))
                            t1=t2;
                            t2=t2+0.5;
                            plotSin();
                        end
                        
                    elseif isequal(start,0) && isequal(quit,0)
                        cla(ax8);cla(ax9);cla(ax10);cla(ax11);
                    end
                end
                
            end          
            
        end      
        
        E.r = uicontrol('style','pushbutton','units','centimeters',...
            'position',[33,0.25,5,1],'string','End Program',...
            'callback',@eh_call);
        
        function eh_call(varargin)
            start=0; quit=1;
            close(r);
            disp('Program ended by user');           
        end        
    end
end
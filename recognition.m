% failed experiment...!!
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
ax12=axes('Units','centimeters','Position',[2 2 4 4],...
    'Parent',r);
ax13=axes('Units','centimeters','Position',[6.5 2 4 4],...
    'Parent',r);
ax14=axes('Units','centimeters','Position',[11 2 4 4],...
    'Parent',r);

start();

    function start(~,~)              
        
        w=(100*pi);
        Av=230;
        Ai=230/50;
        ph=-pi/4; 
        I=0; sigs=0; Isigs=0; istart=1; iit=0; 
        start=0; quit=0; ex=0;        
        zoom on;      
        ydataV=0; ydataI=0; ydataP=0;
        xscale=0.001 ;xpos=0;        
        N=499; t1=0.001; t2=0.5;
        
        slider=uicontrol('style','slider','units','centimeters',...
            'position',[14,15,10,0.5],'min',0.001,'max',1000,...
            'sliderstep',[0.001 0.001],'value',xscale,...
            'backgroundcolor','white',...
            'callback',@slider_call);
        
        sllab=uicontrol('style','edit','units','centimeters',...
            'position',[17.5,14.5,3,0.5],'backgroundcolor','white');
                
        function slider_call(~,~)
            xpos=get(slider,'value');
            set(ax8,'xlim',[xpos xpos+1-xscale]);
            set(ax9,'xlim',[xpos xpos+1-xscale]);
            set(ax10,'xlim',[xpos xpos+1-xscale]);
            set(slider,'backgroundcolor','white');
            drawnow
            x=get(slider,'value');
            set(sllab,'string',[num2str(x),' ','Sec.']);
        end
        
        
        s.r= uicontrol('style','pushbutton','units','centimeters',...
            'position',[2,14.5,5,1],'string','Start/Stop Signal',...
            'callback',@sr_call);

            function sr_call(varargin)
                if isequal(start,0)
                    start=1; 
                else
                    start=0;
                    ydataV=0; ydataI=0; ydataP=0;
                    istart=1;                    
                    cla(ax8);cla(ax9);cla(ax10);cla(ax11);
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
            Vold=get(ax8,'Children');
            ydataV=[ydataV,(get(Vold(2), 'YData'))]; 
            
            Iold=get(ax9,'Children');
            ydataI=[ydataI,get(Iold(2), 'YData')];
            
%             Pold=get(ax10,'Children');
% %             ydataP=[ydataP,get(Pold(2), 'YData')];
            
            [FileName,PathName]=uigetfile('*.csv','Select the Appliance information (CSV)',...
                'Generated csv files/Signals/');

            fid=fopen(sprintf('%s%s',PathName,FileName));

            cfile=textscan(fid,'%s','CollectOutput',true,'Delimiter',',');
            csig=cfile{1};

            sig=str2double(csig);

            sigs=resample(sig,500,22050);           
            Isigs=reshape(sigs,1,length(sigs));

            ex=1;
            istart=iit;
        end  
        
        d.r=uicontrol('style','pushbutton','units','centimeters',...
            'position',[6.5,13,4,1],'string','Disconnect load',...
            'Callback',@getDis);
        
        function getDis(~,~)            
            Vold=get(ax8,'Children');
            ydataV=[ydataV,(get(Vold(2), 'YData'))]; 
            
            Iold=get(ax9,'Children');
            ydataI=[ydataI,get(Iold(2), 'YData')];
            
%             Pold=get(ax10,'Children');
%             ydataP=[ydataP,get(Pold(2), 'YData')];
            
            ex=0;
            istart=iit;
        end
        
        function plotSin(~,~)            
            t=0.001:0.001:1000;          
                        
            while isequal(start,1)                                
                for i=1:length(t)                                        
                    if isequal(start,1) && isequal(quit,0)                      
                        V=Av*sin(w*t(istart:i));

                        if isequal(ex,0)
                            I=Ai*sin((w*t(istart:i))+ph);
                        else
                            if isequal(length(Isigs),i)
                                Isigs=[Isigs,Isigs];                          
                            end
                            I=Isigs(istart:i);
                        end
%                         P=V.*I; 
                        
                        plot(ax8,t(istart:i),V,t(1:length(ydataV)),ydataV);
                        set(ax8,'xlim',[t1 t2]);   
                        grid(ax8,'on');
                        xlabel(ax8, 'Time (seconds)');
                        ylabel(ax8, 'Amplitude (V)');
                        title(ax8, 'Supply Voltage (simulated)');

                        plot(ax9,t(istart:i),I,'r',t(1:length(ydataI)),ydataI);
                        set(ax9,'xlim',[t1 t2]); 
                        grid(ax9,'on');
                        xlabel(ax9, 'Time (seconds)');
                        ylabel(ax9, 'Amplitude (A)');
                        title(ax9, 'Current');
                        
                        fft_V=fftshift(fft(V));                        
                        fft_I=fftshift(fft(I));
                        angle_V=angle(fft_V);
                        angle_I=angle(fft_I);
                        phi=angle_V-angle_I;                        
                        Veff=rms(V);
                        Ieff=rms(I);
                        
                        P=Veff*Ieff*cos(phi);   %Active
                        Q=Veff*Ieff*sin(phi);   %Reactive
                        S=Veff*Ieff;            %Apparent

                        plot(ax10,t(istart:i),P,'g');
                        set(ax10,'xlim',[t1 t2]); 
                        grid(ax10,'on');
                        xlabel(ax10, 'Time (seconds)');
                        ylabel(ax10, 'Amplitude');
                        title(ax10, 'Power (W)');
                        
                        plot(ax11,t(istart:i),V,'b',t(istart:i),I,'r',t(istart:i),P,'g');
                        set(ax11,'xlim',[t1 t2]); 
                        grid(ax11,'on');
                        xlabel(ax11, 'Time (seconds)');
                        ylabel(ax11, 'Amplitude');
                        title(ax11, 'Signals');  
                        
                        compass(ax12,P,'b'); 
                        compass(ax13,Q,'r'); 
                        compass(ax14,S,'g');                      
                        
                        set(slider,'value',t(i));
                        x=get(slider,'value');
                        set(sllab,'string',[num2str(x),' ','Sec.']);
                        pause(1/(1*10^3)) 

                        if isequal(i,N)
                            t1=t1+0.5; t2=t2+0.5;
                            N=N+499;
                        end   
                    end
                    iit=i;
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
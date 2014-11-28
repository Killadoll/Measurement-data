function inspectGUI

h=figure('units','centimeters','position',[1,1,38.5,20],...
    'toolbar','none','menu','none','name','Signal inspection');

ax4=axes('Units','centimeters','Position',[2 15 17 3],...
    'Parent',h);         
ax5=axes('Units','centimeters','Position',[20.5 15 17 3],...
    'Parent',h); 

ax6=axes('Units','centimeters','Position',[2 7.5 17 3],...
    'Parent',h);
ax7=axes('Units','centimeters','Position',[2 2.5 17 3],...
    'Parent',h);

ax8=axes('Units','centimeters','Position',[20.5 7.5 17 3],...
    'Parent',h);
ax9=axes('Units','centimeters','Position',[20.5 2.5 17 3],...
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
        
        assignin('base','f',f);
        
        plot(ax5,f,abs(Y)/N); 
        set(ax5,'xlim',[0 2500]);
        grid(ax5, 'on'); 
        
        uicontrol('style','Text','units','centimeters',...
            'position',[0.25,11.5,3,0.5],'string',...
            'Harmonics:','backgroundcolor','white',...
            'horizontalalignment','left','fontweight','bold');
        
        rnames={'Frequency','|Current|'};
        t = uitable('units','centimeters','position',[0.25,11.5,38,2],...
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
        z(1,1)
        z(1,2)
        d=z(:,I);
        set(t,'Data',d); 
        
        assignin('base','d',d);
        
        xlabel(ax4, 'Time (seconds)');
        ylabel(ax4, 'Amplitude (pixels per sample unit)');
        title(ax4, 'Current waveform');

        xlabel(ax5, 'Frequency (Hz)');
        ylabel(ax5, '|Current|');
        title(ax5, 'Frequency Spectrum');
        

        

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
    'position',[5.5,0.25,5,1],'string','End Program',...
    'callback',@eh_call);

    function eh_call(varargin)
        eh=findobj('Name','Signal inspection');
        close(eh);
    end

filt.h = uicontrol('style','pushbutton','units','centimeters',...
    'position',[10.5,0.25,5,1],'string','Filter signal',...
    'callback',@fh_call);

    function fh_call(varargin)
        y=evalin('base','Total');
        t=evalin('base','time');
%         d=evalin('base','d');
%         f=evalin('base','f');
        Fs = 41100;  % Sampling Frequency

        Fstop1 = 48;          % First Stopband Frequency
        Fpass1 = 49;          % First Passband Frequency
        Fpass2 = 51;          % Second Passband Frequency
        Fstop2 = 52;          % Second Stopband Frequency
        Astop1 = 3;           % First Stopband Attenuation (dB)
        Apass  = 1;           % Passband Ripple (dB)
        Astop2 = 3;           % Second Stopband Attenuation (dB)
        match  = 'stopband';  % Band to match exactly

        % Construct an FDESIGN object and call its BUTTER method.
        h  = fdesign.bandpass(Fstop1, Fpass1, Fpass2, Fstop2, Astop1, Apass, ...
                              Astop2, Fs);
        Hd = design(h, 'butter', 'MatchExactly', match);
        DataFilt=filter(Hd,y);
        
        plot(ax6,t,DataFilt);
        grid(ax6,'on');
        
        fs=44100;
        N = size(t,1);
        DF = fftshift(fft(DataFilt));
        dF = fs/N;
        f = -fs/2:dF:fs/2-dF;        

        plot(ax7,f,abs(DF)/N); 
        set(ax7,'xlim',[0 2500]);
        grid(ax7, 'on');
        
        w=(0:10:2000);
        [b,a]=tf(Hd);
        Y=freqs(b,a,w); 
        y1=abs(Y);
        y2=angle(Y);
        semilogx(ax8,w,20*log10(y1));
        grid (ax8,'on');
  
        semilogx(ax9,w,y2*(180/pi));
        grid(ax9,'on');

        
%         omega=(0:3000)*pi/3000;
%         hp=freqz(DataFilt,1,omega);
%         
%         plot(ax8,omega/pi,abs(hp));
%         plot(ax9,omega/pi,angle(hp));
        
%         [hh,w]=freqz(DataFilt);
%         plot(ax8,w,20*log10(abs(hh)));
%         grid(ax8,'on');
% 
%         [phi,w]=phasez(DataFilt);
%         plot(ax9,w,20*log10(abs(phi)));
%         grid(ax9,'on');
        
%         xlabel(ax8, 'Radians/sample');
%         ylabel(ax8, 'dB');
%         
%         xlabel(ax9, 'Radians/sample');
%         ylabel(ax9, 'dB');

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

% uicontrol('style','slider','parent',h,'units','centimeters',...
%     'position',[38 1 0.2 1],'value',1,'CallBack',@sliderCall);
% 
%     function sliderCall
%         val = get(hObject,'Value');
%         set(h, 'Position', [0 -val 1 1.95]);
%     end

end
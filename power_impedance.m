function power_impedance

m=figure('units','centimeters','position',[1,1,38.5,20],...
    'toolbar','none','menu','none','name','Power and impedance');

ax8=axes('Units','centimeters','Position',[2 16 17 2],...
    'Parent',m);
ax9=axes('Units','centimeters','Position',[20.5 16 17 2],...
    'Parent',m);
ax10=axes('Units','centimeters','Position',[2 4 5 5],...
    'Parent',m);
ax11=axes('Units','centimeters','Position',[13 4 5 5],...
    'Parent',m);

uicontrol('style','text','units','centimeters','position',[7.5,8.5,2,0.5],...
    'string','Voltage','backgroundcolor','white','horizontalalignment',...
    'left','fontweight','bold');
m(1)=uicontrol('style','text','units','centimeters','position',...    
    [7.5,8,3,0.5],'backgroundcolor','white','horizontalalignment',...
    'left');
m(2)=uicontrol('style','text','units','centimeters','position',...
    [7.5,7.5,3,0.5],'backgroundcolor','white','horizontalalignment',...
    'left');

uicontrol('style','text','units','centimeters','position',[7.5,6.5,2,0.5],...
    'string','Current','backgroundcolor','white','horizontalalignment',...
    'left','fontweight','bold');
m(3)=uicontrol('style','text','units','centimeters','position',...    
    [7.5,6,3,0.5],'backgroundcolor','white','horizontalalignment',...
    'left');
m(4)=uicontrol('style','text','units','centimeters','position',...
    [7.5,5.5,3,0.5],'backgroundcolor','white','horizontalalignment',...
    'left');

uicontrol('style','text','units','centimeters','position',[7.5,4.5,4,0.5],...
    'string','Phase difference','backgroundcolor','white','horizontalalignment',...
    'left','fontweight','bold');
m(5)=uicontrol('style','text','units','centimeters','position',...    
    [7.5,4,3,0.5],'backgroundcolor','white','horizontalalignment',...
    'left');

uicontrol('style','text','units','centimeters','position',[18.5,8.5,5,0.5],...
    'string','S (Apparent power)','backgroundcolor','white','horizontalalignment',...
    'left','fontweight','bold');
m(6)=uicontrol('style','text','units','centimeters','position',...    
    [18.5,8,3,0.5],'backgroundcolor','white','horizontalalignment',...
    'left');
m(7)=uicontrol('style','text','units','centimeters','position',...    
    [18.5,7.5,3,0.5],'backgroundcolor','white','horizontalalignment',...
    'left');

uicontrol('style','text','units','centimeters','position',[18.5,6.5,5,0.5],...
    'string','Q (Reactive power)','backgroundcolor','white','horizontalalignment',...
    'left','fontweight','bold');
m(8)=uicontrol('style','text','units','centimeters','position',...    
    [18.5,6,3,0.5],'backgroundcolor','white','horizontalalignment',...
    'left');
m(9)=uicontrol('style','text','units','centimeters','position',...    
    [18.5,5.5,3,0.5],'backgroundcolor','white','horizontalalignment',...
    'left');

uicontrol('style','text','units','centimeters','position',[18.5,4.5,5,0.5],...
    'string','P (Active power)','backgroundcolor','white','horizontalalignment',...
    'left','fontweight','bold');
m(10)=uicontrol('style','text','units','centimeters','position',...    
    [18.5,4,3,0.5],'backgroundcolor','white','horizontalalignment',...
    'left');
m(11)=uicontrol('style','text','units','centimeters','position',...    
    [18.5,3.5,3,0.5],'backgroundcolor','white','horizontalalignment',...
    'left');


I=0;

g.m=uicontrol('style','pushbutton','units','centimeters',...
            'position',[2,14,4,1],'string','Get Signal',...
            'Callback',@getSig);
        
    function getSig(~,~)
        choice=questdlg('Do you want to load a signal from file or workspace?',...
            'Load signal', 'Workspace','File','File');
        switch choice
            case 'Workspace'
                I=evalin('base','Total');
            case 'File'
                [FileName,PathName]=uigetfile('*.csv','Select the Appliance information (CSV)',...
                'Generated csv files/Signals/');

                fid=fopen(sprintf('%s%s',PathName,FileName));

                cfile=textscan(fid,'%s','CollectOutput',true,'Delimiter',',');
                csig=cfile{1};

                I=str2double(csig);                
                
                uicontrol('style','text','units','centimeters',...
                'position',[2,18.5,4,0.5],'backgroundcolor','white',...
                'horizontalalignment','left','string', FileName);
        end 
        
        pow_imp();
    end



    function pow_imp(~,~)        
        zoom on;
        
        I=reshape(I,1,length(I));
        t=(1:1:22050)/44100;
        
        plot(ax8,t,I);
        grid(ax8,'on');
        xlabel(ax8, 'Time (seconds)');
        ylabel(ax8, 'Amplitude');
        title(ax8, 'Appliance current');
        
        V=325*sin((100*pi*t));
        
        plot(ax9,t,V);
        grid(ax9,'on');
        xlabel(ax9, 'Time (seconds)');
        ylabel(ax9, 'Amplitude');
        title(ax9, 'Dummy supply Voltage');
        
        fft_V=fftshift(fft(V));                        
        fft_I=fftshift(fft(I));
        [~,idx_fftV]=max(abs(fft_V));
        [~,idx_fftI]=max(abs(fft_I));
        angle_V=angle(fft_V(idx_fftV));
        angle_I=angle(fft_I(idx_fftI));
        phi=angle_V-angle_I;
        
        V_grad=(angle_V/pi)*180;      
        I_grad=(angle_I/pi)*180;
        phi_grad=(phi/pi)*180;
        Vmag=max(V);
        Imag=max(I);

        S=V.*I;
        Smag=max(S);        
        
        fft_S=fftshift(fft(S)); 
        [~,idx_fftS]=max(abs(fft_S));
        angle_S=angle(fft_S(idx_fftS));
        S_grad=(angle_S/pi)*180;
        
        vphasor=Vmag*exp(1i*angle_V);
        iphasor=Imag*exp(1i*angle_I);
        sphasor=Smag*exp(1i*angle_S);
        
        quiver(ax10,0,0,real(vphasor),imag(vphasor),'linewidth',2,'color','r');
        text(real(vphasor)/2,imag(vphasor)/2,[' V=',(int2str(Vmag)),'e^{j ',...
            int2str(V_grad),'}'],'parent',ax10);
        hold(ax10,'on');
        quiver(ax10,0,0,real(iphasor),imag(iphasor),'linewidth',2,'color','g');
        text(real(iphasor)/2,imag(iphasor)/2,[' I=',(int2str(Imag)),'e^{j ',...
            int2str(I_grad),'}'],'parent',ax10);
        
%         pvi1=[real(vphasor)/2,imag(vphasor)/2];
%         pvi2=[real(iphasor)/2,imag(iphasor)/2];
% %         pvi0=[;];
%         
%         scatter(ax10,pvi1,pvi2);
        
        hold(ax10,'off');
        grid(ax10,'on');        
        axis(ax10,'square');
        
        quiver(ax11,0,0,real(sphasor),imag(sphasor),0,'linewidth',2,'color','r');
        text(real(sphasor)/2,imag(sphasor)/2,[' S=',(int2str(Smag)),'e^{j ',...
            int2str(S_grad),'}'],'parent',ax11);
        hold(ax11,'on');
        quiver(ax11,0,0,real(sphasor),0,0,'linewidth',2,'color','g');       
        quiver(ax11,real(sphasor),0,0,imag(sphasor),0,'linewidth',2,'color','y');
        text(real(sphasor)/2,0,[' P=',(int2str(real(sphasor))),'e^{j ',...
            int2str(cos(S_grad)),'}'],'parent',ax11);
        text(real(sphasor),imag(sphasor)/2,[' Q=',(int2str(imag(sphasor))),'e^{j ',...
            int2str(sin(S_grad)),'}'],'parent',ax11);
        hold(ax11,'off');
        grid(ax11,'on');
        axis(ax11,'square');
        
        xlabel(ax10,'Real');
        ylabel(ax10,'Imaginary');
        title(ax10,'Voltage and current phasors');        
        
        xlabel(ax11,'Real');
        ylabel(ax11,'Imaginary');
        title(ax11,'Power triangle');        
              
        set(m(1),'string',sprintf('%s%c%c',num2str(Vmag),' ','V'));
        set(m(2),'string',sprintf('%s%c%c',num2str(V_grad),' ',char(176)));
        set(m(3),'string',sprintf('%s%c%c',num2str(Imag),' ','A'));
        set(m(4),'string',sprintf('%s%c%c',num2str(I_grad),' ',char(176)));
        set(m(5),'string',sprintf('%s%c%c',num2str(phi_grad),' ',char(176))); 
        set(m(6),'string',sprintf('%s%c%s',num2str(Smag),' ','VA'));
        set(m(7),'string',sprintf('%s%c%c',num2str(S_grad),' ',char(176)));
        set(m(8),'string',sprintf('%s%c%s',int2str(imag(sphasor)),' ','VAR'));
        set(m(9),'string',sprintf('%s%s%c%s','cos(',num2str(S_grad),char(176),')'));
        set(m(10),'string',sprintf('%s%c%s',int2str(real(sphasor)),' ','W'));
        set(m(11),'string',sprintf('%s%s%c%s','sin(',num2str(S_grad),char(176),')'));
    end

end
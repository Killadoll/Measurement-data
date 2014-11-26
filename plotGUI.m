function plotGUI

p=figure('units','centimeters','position',[1,1,38.5,20],...
    'toolbar','none','menu','none','name','Current measurements');

ax1=axes('Units','centimeters','Position',[17 14 20 4],...
    'Parent',p);         
ax2=axes('Units','centimeters','Position',[17 8 20 4],...
    'Parent',p); 
ax3=axes('Units','centimeters','Position',[17 2 20 4],...
    'Parent',p);

vars = evalin('base','who');

p(1) = uicontrol('style','checkbox','units','centimeters',...
    'position',[0.5,18.5,7,1],'string','Laptop',...
    'Callback',@updatePlot);
if any(strcmp(vars,'laptop'))
    set(p(1),'Enable','on');
else
    set(p(1),'Enable','off');
end 

p(2) = uicontrol('style','checkbox','units','centimeters',...
    'position',[0.5,17.5,7,1],'string','Floor lamp (common)',...
    'Callback',@setP2);             
if any(strcmp(vars,'floor_lamp_common'))
    set(p(2),'Enable','on');
else
    set(p(2),'Enable','off');
end

    function setP2(~,~)        
        set(p(3),'value',0);
        set(p(4),'value',0);
        updatePlot();
    end

p(3) = uicontrol('style','checkbox','units','centimeters',...
    'position',[0.5,16.5,7,1],'string','Floor lamp (max)',...
    'Callback',@setP3);
if any(strcmp(vars,'floor_lamp_max'))
    set(p(3),'Enable','on');
else
    set(p(3),'Enable','off');
end 

    function setP3(~,~)        
        set(p(2),'value',0);
        set(p(4),'value',0);
        updatePlot();
    end

p(4) = uicontrol('style','checkbox','units','centimeters',...
    'position',[0.5,15.5,7,1],'string','Floor lamp (min)',...
    'Callback',@setP4);
if any(strcmp(vars,'floor_lamp_min'))
    set(p(4),'Enable','on');
else
    set(p(4),'Enable','off');
end 

    function setP4(~,~)
        set(p(2),'value',0);
        set(p(3),'value',0);
        updatePlot();
    end

p(5) = uicontrol('style','checkbox','units','centimeters',...
    'position',[0.5,14.5,7,1],'string','Senseo (warming-up)',...
    'Callback',@senseoW);
if any(strcmp(vars,'senseo_warmingup'))
    set(p(5),'Enable','on');
else
    set(p(5),'Enable','off');
end 

    function senseoW(~,~)
        set(p(6),'value',0);
        updatePlot();
    end

p(6) = uicontrol('style','checkbox','units','centimeters',...
    'position',[0.5,13.5,7,1],'string','Senseo (running)',...
    'Callback',@senseoR); 
if any(strcmp(vars,'senseo_running'))
    set(p(6),'Enable','on');
else
    set(p(6),'Enable','off');
end 

    function senseoR(~,~)
        set(p(5),'value',0);
        updatePlot();
    end

p(7) = uicontrol('style','checkbox','units','centimeters',...
    'position',[0.5,12.5,7,1],'string','Dishwasher (preparing/ending)',...
    'Callback',@dishPE); 
if any(strcmp(vars,'dishwasher_prep_end'))
    set(p(7),'Enable','on');
else
    set(p(7),'Enable','off');
end 

    function dishPE(~,~)
        set(p(8),'value',0);
        set(p(9),'value',0);
        set(p(10),'value',0);
        updatePlot();
    end

p(8) = uicontrol('style','checkbox','units','centimeters',...
    'position',[0.5,11.5,7,1],'string','Dishwasher (rincing)',...
    'Callback',@dishR);
if any(strcmp(vars,'dishwasher_rincing'))
    set(p(8),'Enable','on');
else
    set(p(8),'Enable','off');
end

    function dishR(~,~)
        set(p(7),'value',0);
        set(p(9),'value',0);
        set(p(10),'value',0);
        updatePlot();
    end

p(9) = uicontrol('style','checkbox','units','centimeters',...
    'position',[0.5,10.5,7,1],'string','Dishwasher (blowdrying)',...
    'Callback',@dishB);
if any(strcmp(vars,'dishwasher_blowdrying'))
    set(p(9),'Enable','on');
else
    set(p(9),'Enable','off');
end 

    function dishB(~,~)
        set(p(7),'value',0);
        set(p(8),'value',0);
        set(p(10),'value',0);
        updatePlot();
    end

p(10) = uicontrol('style','checkbox','units','centimeters',...
    'position',[0.5,9.5,7,1],'string','Dishwasher (cleaning)',...
    'Callback',@dishC);
if any(strcmp(vars,'dishwasher_cleaning'))
    set(p(10),'Enable','on');
else
    set(p(10),'Enable','off');
end 

    function dishC(~,~)
        set(p(7),'value',0);
        set(p(8),'value',0);
        set(p(9),'value',0);
        updatePlot();
    end

p(11) = uicontrol('style','checkbox','units','centimeters',...
    'position',[0.5,8.5,7,1],'string','Washingmachine (disposing water)',...
    'Callback',@washDW);
if any(strcmp(vars,'washingmachine_disposing_water'))
    set(p(11),'Enable','on');
else
    set(p(11),'Enable','off');
end 

    function washDW(~,~)
        set(p(12),'value',0);
        set(p(13),'value',0);
        set(p(14),'value',0);
        set(p(15),'value',0);
        set(p(16),'value',0);
        set(p(17),'value',0);
        updatePlot();
    end

p(12) = uicontrol('style','checkbox','units','centimeters',...
    'position',[0.5,7.5,7,1],'string','Washingmachine (rincing)',...
    'Callback',@washR);
if any(strcmp(vars,'washingmachine_rincing'))
    set(p(12),'Enable','on');
else
    set(p(12),'Enable','off');
end 

    function washR(~,~)
        set(p(11),'value',0);
        set(p(13),'value',0);
        set(p(14),'value',0);
        set(p(15),'value',0);
        set(p(16),'value',0);
        set(p(17),'value',0);
        updatePlot();
    end

p(13) = uicontrol('style','checkbox','units','centimeters',...
    'position',[0.5,6.5,7,1],'string','Washingmachine (slow centrifuge)',...
    'Callback',@washSC);
if any(strcmp(vars,'washingmachine_slow_centrifuge'))
    set(p(13),'Enable','on');
else
    set(p(13),'Enable','off');
end 

    function washSC(~,~)
        set(p(11),'value',0);
        set(p(12),'value',0);
        set(p(14),'value',0);
        set(p(15),'value',0);
        set(p(16),'value',0);
        set(p(17),'value',0);
        updatePlot();
    end

p(14) = uicontrol('style','checkbox','units','centimeters',...
    'position',[0.5,5.5,7,1],'string','Washingmachine (fast centrifuge)',...
    'Callback',@washFC);
if any(strcmp(vars,'washingmachine_fast_centrifuge'))
    set(p(14),'Enable','on');
else
    set(p(14),'Enable','off');
end 

    function washFC(~,~)
        set(p(11),'value',0);
        set(p(12),'value',0);
        set(p(13),'value',0);
        set(p(15),'value',0);
        set(p(16),'value',0);
        set(p(17),'value',0);
        updatePlot();
    end

p(15) = uicontrol('style','checkbox','units','centimeters',...
    'position',[0.5,4.5,7,1],'string','Washingmachine (washing)',...
    'Callback',@washW);
if any(strcmp(vars,'washingmachine_washing'))
    set(p(15),'Enable','on');
else
    set(p(15),'Enable','off');
end

    function washW(~,~)
        set(p(11),'value',0);
        set(p(12),'value',0);
        set(p(13),'value',0);
        set(p(14),'value',0);
        set(p(16),'value',0);
        set(p(17),'value',0);
        updatePlot();
    end

p(16) = uicontrol('style','checkbox','units','centimeters',...
    'position',[0.5,3.5,7,1],'string','Washingmachine (rest)',...
    'Callback',@washRest);
if any(strcmp(vars,'washingmachine_rest'))
    set(p(16),'Enable','on');
else
    set(p(16),'Enable','off');
end

    function washRest(~,~)
        set(p(11),'value',0);
        set(p(12),'value',0);
        set(p(13),'value',0);
        set(p(14),'value',0);
        set(p(15),'value',0);
        set(p(17),'value',0);
        updatePlot();
    end
            
p(17) = uicontrol('style','checkbox','units','centimeters',...
    'position',[0.5,2.5,7,1],'string','Washingmachine (taking water)',...
    'Callback',@washTW);
if any(strcmp(vars,'washingmachine_taking_water'))
    set(p(17),'Enable','on');
else
    set(p(17),'Enable','off');
end  

    function washTW(~,~)
        set(p(11),'value',0);
        set(p(12),'value',0);
        set(p(13),'value',0);
        set(p(14),'value',0);
        set(p(15),'value',0);
        set(p(16),'value',0);
        updatePlot();
    end

p(18) = uicontrol('style','checkbox','units','centimeters',...
    'position',[0.5,1.5,7,1],'string','Dryer (drying)',...
    'Callback',@dryerD);
if any(strcmp(vars,'dryer_drying'))
    set(p(18),'Enable','on');
else
    set(p(18),'Enable','off');
end 

    function dryerD(~,~)
        set(p(19),'value',0);
        updatePlot();
    end

p(19) = uicontrol('style','checkbox','units','centimeters',...
    'position',[8,18.5,7,1],'string','Dryer (ventilating)', 'Callback',@dryerV); 
if any(strcmp(vars,'dryer_vent'))
    set(p(19),'Enable','on');
else
    set(p(19),'Enable','off');
end

    function dryerV(~,~)
        set(p(18),'value',0);
        updatePlot();
    end

p(20) = uicontrol('style','checkbox','units','centimeters',...
    'position',[8,17.5,7,1],'string','Freezer', 'Callback',@updatePlot); 
if any(strcmp(vars,'freezer'))
    set(p(20),'Enable','on');
else
    set(p(20),'Enable','off');
end  

p(21) = uicontrol('style','checkbox','units','centimeters',...
    'position',[8,16.5,7,1],'string','Fridge', 'Callback',@updatePlot); 
if any(strcmp(vars,'fridge'))
    set(p(21),'Enable','on');
else
    set(p(21),'Enable','off');
end 

p(22) = uicontrol('style','checkbox','units','centimeters',...
    'position',[8,15.5,7,1],'string','Extractor hood', 'Callback',@updatePlot); 
if any(strcmp(vars,'extractor'))
    set(p(22),'Enable','on');
else
    set(p(22),'Enable','off');
end 

p(23) = uicontrol('style','checkbox','units','centimeters',...
    'position',[8,14.5,7,1],'string','Phone charger', 'Callback',@updatePlot); 
if any(strcmp(vars,'phone_charger'))
    set(p(23),'Enable','on');
else
    set(p(23),'Enable','off');
end 

p(24) = uicontrol('style','checkbox','units','centimeters',...
    'position',[8,13.5,7,1],'string','TV', 'Callback',@updatePlot); 
if any(strcmp(vars,'tv'))
    set(p(24),'Enable','on');
else
    set(p(24),'Enable','off');
end 

p(25) = uicontrol('style','checkbox','units','centimeters',...
    'position',[8,12.5,7,1],'string','TV Receiver', 'Callback',@updatePlot); 
if any(strcmp(vars,'tv_receiver'))
    set(p(25),'Enable','on');
else
    set(p(25),'Enable','off');
end 

p(26) = uicontrol('style','checkbox','units','centimeters',...
    'position',[8,11.5,7,1],'string','Sound amplifier', 'Callback',@updatePlot); 
if any(strcmp(vars,'sound_amp'))
    set(p(26),'Enable','on');
else
    set(p(26),'Enable','off');
end 

p(27) = uicontrol('style','checkbox','units','centimeters',...
    'position',[8,10.5,7,1],'string','Subwoofer', 'Callback',@updatePlot); 
if any(strcmp(vars,'sub'))
    set(p(27),'Enable','on');
else
    set(p(27),'Enable','off');
end 

p(28) = uicontrol('style','checkbox','units','centimeters',...
    'position',[8,9.5,7,1],'string','PS3', 'Callback',@updatePlot); 
if any(strcmp(vars,'ps3'))
    set(p(28),'Enable','on');
else
    set(p(28),'Enable','off');
end 

p(29) = uicontrol('style','checkbox','units','centimeters',...
    'position',[8,8.5,7,1],'string','Wii', 'Callback',@updatePlot); 
if any(strcmp(vars,'wii'))
    set(p(29),'Enable','on');
else
    set(p(29),'Enable','off');
end 

p(30) = uicontrol('style','checkbox','units','centimeters',...
    'position',[8,7.5,7,1],'string','DVD player', 'Callback',@updatePlot); 
if any(strcmp(vars,'dvd'))
    set(p(30),'Enable','on');
else
    set(p(30),'Enable','off');
end 

p(31) = uicontrol('style','checkbox','units','centimeters',...
    'position',[8,6.5,7,1],'string','Modem', 'Callback',@updatePlot); 
if any(strcmp(vars,'modem'))
    set(p(31),'Enable','on');
else
    set(p(31),'Enable','off');
end 

p(32) = uicontrol('style','checkbox','units','centimeters',...
    'position',[8,5.5,7,1],'string','Alarm clock', 'Callback',@updatePlot); 
if any(strcmp(vars,'alarm'))
    set(p(32),'Enable','on');
else
    set(p(32),'Enable','off');
end 

p(33) = uicontrol('style','checkbox','units','centimeters',...
    'position',[8,4.5,7,1],'string','External HDD', 'Callback',@updatePlot); 
if any(strcmp(vars,'ex_hdd'))
    set(p(33),'Enable','on');
else
    set(p(33),'Enable','off');
end 

p(34) = uicontrol('style','checkbox','units','centimeters',...
    'position',[8,3.5,7,1],'string','Oven', 'Callback',@updatePlot); 
if any(strcmp(vars,'oven'))
    set(p(34),'Enable','on');
else
    set(p(34),'Enable','off');
end

p(35) = uicontrol('style','checkbox','units','centimeters',...
    'position',[8,2.5,7,1],'string','Frying pan', 'Callback',@updatePlot); 
if any(strcmp(vars,'fry'))
    set(p(35),'Enable','on');
else
    set(p(35),'Enable','off');
end
            
    function updatePlot(~,~)

        t=evalin('base','time');  
                              
        if get(p(1),'Value')
            y1=evalin('base','laptop');
            T1=100*(10^((thd(y1))/20));
            lab1='Laptop';
        else
            y1=0; T1=0; lab1='0';            
        end
        
        if get(p(2),'Value')
            y2=evalin('base','floor_lamp_common');
            T2=100*(10^((thd(y2))/20));
            lab2='FloorLamp_c';
        else
            y2=0; T2=0; lab2='0';            
        end
        
        if get(p(3),'Value')
            y3=evalin('base','floor_lamp_max');
            T3=100*(10^((thd(y3))/20));
            lab3='FloorLamp_mx';
        else
            y3=0; T3=0; lab3='0';            
        end
        
        if get(p(4),'Value')
            y4=evalin('base','floor_lamp_min');
            T4=100*(10^((thd(y4))/20));
            lab4='FloorLamp_mn';
        else
            y4=0; T4=0; lab4='0';            
        end
        
        if get(p(5),'Value')
            y5=evalin('base','senseo_warmingup'); 
            T5=100*(10^((thd(y5))/20));
            lab5='SenseoWU';
        else
            y5=0; T5=0; lab5='0';            
        end
        
        if get(p(6),'Value')
            y6=evalin('base','senseo_running'); 
            T6=100*(10^((thd(y6))/20));
            lab6='SenseoR';
        else
            y6=0; T6=0; lab6='0';            
        end
        
        if get(p(7),'Value')
            y7=evalin('base','dishwasher_prep_end');
            T7=100*(10^((thd(y7))/20));
            lab7='DishwasherPE';
        else
            y7=0; T7=0; lab7='0';            
        end
        
        if get(p(8),'Value')
            y8=evalin('base','dishwasher_rincing');
            T8=100*(10^((thd(y8))/20));
            lab8='DishwasherR';
        else
            y8=0; T8=0; lab8='0';            
        end
        
        if get(p(9),'Value')
            y9=evalin('base','dishwasher_blowdrying');
            T9=100*(10^((thd(y9))/20));
            lab9='DishwasherB';
        else
            y9=0; T9=0; lab9='0';            
        end
        
        if get(p(10),'Value')
            y10=evalin('base','dishwasher_cleaning');  
            T10=100*(10^((thd(y10))/20));
            lab10='DishwasherC';
        else
            y10=0; T10=0; lab10='0';   
        end
        
        if get(p(11),'Value')
            y11=evalin('base','washingmachine_disposing_water');
            T11=100*(10^((thd(y11))/20));
            lab11='WashingmachineDW';
        else
            y11=0; T11=0; lab11='0';            
        end        
       
        if get(p(12),'Value')
            y12=evalin('base','washingmachine_rincing');
            T12=100*(10^((thd(y12))/20));
            lab12='WashingmachineR';
        else
            y12=0; T12=0; lab12='0';            
        end
        
        if get(p(13),'Value')
            y13=evalin('base','washingmachine_slow_centrifuge'); 
            T13=100*(10^((thd(y13))/20));
            lab13='WashingmachineSC';
        else
            y13=0; T13=0; lab13='0';            
        end
        
        if get(p(14),'Value')
            y14=evalin('base','washingmachine_fast_centrifuge'); 
            T14=100*(10^((thd(y14))/20));
            lab14='WashingmachineFC';
        else
            y14=0; T14=0; lab14='0';            
        end
        
        if get(p(15),'Value')
            y15=evalin('base','washingmachine_washing');
            T15=100*(10^((thd(y15))/20));
            lab15='WashingmachineW';
        else
            y15=0; T15=0; lab15='0';            
        end
        
        if get(p(16),'Value')
            y16=evalin('base','washingmachine_rest');  
            T16=100*(10^((thd(y16))/20));
            lab16='WashingmachineR';
        else
            y16=0; T16=0; lab16='0';            
        end
        
        if get(p(17),'Value')
            y17=evalin('base','washingmachine_taking_water'); 
            T17=100*(10^((thd(y17))/20));
            lab17='WashingmachineTW';
        else
            y17=0; T17=0; lab17='0';            
        end
        
        if get(p(18),'Value')
            y18=evalin('base','dryer_drying'); 
            T18=100*(10^((thd(y18))/20));
            lab18='DryerD';
        else
            y18=0; T18=0; lab18='0';            
        end
        
        if get(p(19),'Value')
            y19=evalin('base','dryer_vent'); 
            T19=100*(10^((thd(y19))/20));
            lab19='DryerV';
        else
            y19=0; T19=0; lab19='0';            
        end 
        
        if get(p(20),'Value')
            y20=evalin('base','freezer'); 
            T20=100*(10^((thd(y20))/20));
            lab20='Freezer';
        else
            y20=0; T20=0; lab20='0';            
        end
        
        if get(p(21),'Value')
            y21=evalin('base','fridge'); 
            T21=100*(10^((thd(y21))/20));
            lab21='Fridge';
        else
            y21=0; T21=0; lab21='0';            
        end
        
        if get(p(22),'Value')
            y22=evalin('base','extractor'); 
            T22=100*(10^((thd(y22))/20));
            lab22='Extractor';
        else
            y22=0; T22=0; lab22='0';            
        end
        
        if get(p(23),'Value')
            y23=evalin('base','phone_charger'); 
            T23=100*(10^((thd(y23))/20));
            lab23='Phone';
        else
            y23=0; T23=0; lab23='0';            
        end
        
        if get(p(24),'Value')
            y24=evalin('base','tv'); 
            T24=100*(10^((thd(y24))/20));
            lab24='TV';
        else
            y24=0; T24=0; lab24='0';            
        end
        
        if get(p(25),'Value')
            y25=evalin('base','tv_receiver'); 
            T25=100*(10^((thd(y25))/20));
            lab25='TV Reciever';
        else
            y25=0; T25=0; lab25='0';            
        end
        
        if get(p(26),'Value')
            y26=evalin('base','sound_amp'); 
            T26=100*(10^((thd(y26))/20));
            lab26='SoundAmp';
        else
            y26=0; T26=0; lab26='0';            
        end
        
        if get(p(27),'Value')
            y27=evalin('base','sub'); 
            T27=100*(10^((thd(y27))/20));
            lab27='Sub';
        else
            y27=0; T27=0; lab27='0';            
        end
        
        if get(p(28),'Value')
            y28=evalin('base','ps3'); 
            T28=100*(10^((thd(y28))/20));
            lab28='PS3';
        else
            y28=0; T28=0; lab28='0';            
        end
        
        if get(p(29),'Value')
            y29=evalin('base','wii'); 
            T29=100*(10^((thd(y29))/20));
            lab29='Wii';
        else
            y29=0; T29=0; lab29='0';            
        end
        
        if get(p(30),'Value')
            y30=evalin('base','dvd'); 
            T30=100*(10^((thd(y30))/20));
            lab30='DVD';
        else
            y30=0; T30=0; lab30='0';            
        end
        
        if get(p(31),'Value')
            y31=evalin('base','modem'); 
            T31=100*(10^((thd(y31))/20));
            lab31='Modem';
        else
            y31=0; T31=0; lab31='0';            
        end
        
        if get(p(32),'Value')
            y32=evalin('base','alarm'); 
            T32=100*(10^((thd(y32))/20));
            lab32='Alarm';
        else
            y32=0; T32=0; lab32='0';            
        end
        
        if get(p(33),'Value')
            y33=evalin('base','ex_hdd'); 
            T33=100*(10^((thd(y33))/20));
            lab33='ExtHDD';
        else
            y33=0; T33=0; lab33='0';            
        end
        
        if get(p(34),'Value')
            y34=evalin('base','oven'); 
            T34=100*(10^((thd(y34))/20));
            lab34='Oven';
        else
            y34=0; T34=0; lab34='0';            
        end
        
        if get(p(35),'Value')
            y35=evalin('base','fry'); 
            T35=100*(10^((thd(y35))/20));
            lab35='FryerPan';
        else
            y35=0; T35=0; lab35='0';            
        end
               
        y=y1+y2+y3+y4+y5+y6+y7+y8+y9+y10+y11+y12+y13...
            +y14+y15+y16+y17+y18+y19+y20+y21+y22+y23...
            +y24+y25+y26+y27+y28+y29+y30+y31+y32+y33...
            +y34+y35;
        
        assignin('base','Total',y);
        
        Ttot=100*(10^((thd(y))/20));
        labtot='Total';
        
        plot(ax1,t,y);
        grid(ax1, 'on');
        zoom;
        
        fs = 44100;
        
        N = size(t,1);
        Y = fftshift(fft(y));
        dF = fs/N;
        f = -fs/2:dF:fs/2-dF;        

        plot(ax2,f,abs(Y)/N); 
        set(ax2,'xlim',[0 3000]);
        grid(ax2, 'on'); 
        
        T=[T1,T2,T3,T4,T5,T6,T7,T8,T9,T10,T11,T12,T13,T14,T15,T16,T17,...
            T18,T19,T20,T21,T22,T23,T24,T25,T26,T27,T28,T29,T30,...
            T31,T32,T33,T34,T35,Ttot];
        TT=T(T>0);
        
        labt={lab1,lab2,lab3,lab4,lab5,lab6,lab7,lab8,lab9,lab10,lab11,...
            lab12,lab13,lab14,lab15,lab16,lab17,lab18,lab19,lab20,lab21,...
            lab22,lab23,lab24,lab25,lab26,lab27,lab28,lab29,lab30,...
            lab31,lab32,lab33,lab34,lab35,labtot};
        xlabt=cellstr(labt);
        xlab=xlabt(~strcmp(xlabt,'0')); 
        
        assignin('base','Tot_lab',xlab);
              
        bar(ax3,TT);
        grid(ax3, 'on');        
        
        xlabel(ax1, 'Time (seconds)');
        ylabel(ax1, 'Amplitude (pixels per sample unit)');
        title(ax1, 'Current waveform');

        xlabel(ax2, 'Frequency (Hz)');
        ylabel(ax2, '|Current|');
        title(ax2, 'Frequency Spectrum');

        xlabel(ax3, 'Appliances','fontsize',10);
        ylabel(ax3, 'Percentages','fontsize',10);
        title(ax3, 'Total Harmonic distortion (THD)','fontsize',10); 
        set(ax3,'XTickLabel',xlab,'fontsize',7);
    end

H.p = uicontrol('style','pushbutton','units','centimeters',...
    'position',[0.25,0.25,5.3,1],'string','(Re)load variables',...
    'callback',@p_call);

    function p_call(varargin)
        results();
        delete(p);
    end

E.p = uicontrol('style','pushbutton','units','centimeters',...
    'position',[10.85,0.25,5,1],'string','End Program',...
    'callback',@e_call);

    function e_call(varargin)
        hf=findobj('Name','Current measurements');
        close(hf);
    end

t.p = uicontrol('style','pushbutton','units','centimeters',...
            'position',[5.55,0.25,5.3,1],'string','Open signal inspection',...
            'callback',@t_call);
        
        function t_call(varargin)
            inspectGUI();
            hf=findobj('Name','Current measurements');
            close(hf);
        end

p(100) = uicontrol('style','checkbox','units','centimeters',...
    'position',[34.5,18.5,3.5,1],'string','Place/use cursor', 'Callback',@placeCursor); 

    function placeCursor(~,~)
       if get(p(100),'Value')
            datacursormode on;
        else
            datacursormode off;
            zoom on;
        end 
    end

end


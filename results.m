function results

clc; close all;

% choice1=questdlg('Do you want to clear the workspace?',...
%     'Clear all','Yes','No','No');
% switch choice1
%     case 'No'
%         disp('Variables stay in the workspace');
%     case 'Yes'
%         clear all;
%         disp('Workspace is cleared');         
% end

%------------------------------------------------------------------
% Load the test data, from Measurements.xlsx, into the matlab 
% workspace.

vars1=evalin('base','who');
row=22051;
col=1;
steps=2;
idx=fix(linspace(0,row,steps+1));

choice2=questdlg('Do you want to load the time variable to the workspace?',...
    'Time Input','Yes','No','No');
switch choice2
    case 'No'
        disp('Time variable is not being loaded to the workspace');
    case 'Yes' 
        if any(strcmp(vars1,'time'))
            choice3=questdlg('The time variable is allready present in the workspace, do you want to reload?',...
                'Time variable','Yes','No','No');
            switch choice3
                case 'Yes' 
                    disp([9 '-----> Loading Time variable']);
                    time=cell(steps,1);
                    h = waitbar(0,'Loading Time variable...');
                    for i=1:steps                        
                        cellRange = sprintf('%c%d:%c%d', ...
                            'B', idx(i)+1, char('B'+col-1), idx(i+1));
                        time{i} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(i / steps);
                    end
                    close(h)
                    time=cell2mat(time);
                    assignin('base','time',time);
                    disp('Time variable is loaded to the workspace');     
                case 'No'
                    disp('Time variable remains as before');
            end
        else
            disp([9 '-----> Loading Time variable']);
             time=cell(steps,1);
             h = waitbar(0,'Loading Time variable...');
             for i=1:steps                        
                 cellRange = sprintf('%c%d:%c%d', ...
                     'B', idx(i)+1, char('B'+col-1), idx(i+1));
                 time{i} = xlsread('Measurements.xlsx', 1, cellRange);
                 waitbar(i / steps);
             end
             close(h)
             time=cell2mat(time);
             assignin('base','time',time);
             disp('Time variable is loaded to the workspace');
        end
end

choice4=questdlg('Do you want to load (more)measurement data to the workspace?:',...
    'Data Input','Yes','No','No');
switch choice4
    case 'No'
        data=0;
        assignin('base','data',data);
        disp('No more data will be loaded in to the workspace');
    case 'Yes'
        data=0;
        assignin('base','data',data);
        dataGUI;           
        uiwait();
        disp('The folowing data will be loaded in to the workspace:');
end

data=evalin('base','data');
l=length(data);
for i=1:l
    if data(i)==1
        disp([9 '-----> Laptop']);
        if any(strcmp(vars1,'laptop'))
            choice5=questdlg('The laptop data is allready present in the workspace, do you want to reload?',...
                'Laptop data','Yes','No','No');
            switch choice5
                case 'Yes'
                    laptop=cell(steps,1);
                    h = waitbar(0,'Loading Laptop data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%d:%c%d', ...
                            'C', idx(j)+1, char('C'+col-1), idx(j+1));
                        laptop{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    laptop=cell2mat(laptop);
                    assignin('base','laptop',laptop);
                    disp('Laptop data is loaded');
                case 'No'
                    disp('Laptop data remains as before');
            end
        else
        laptop=cell(steps,1);
        h = waitbar(0,'Loading Laptop data...');
        for j=1:steps  
            cellRange = sprintf('%c%d:%c%d', ...
                'C', idx(j)+1, char('C'+col-1), idx(j+1));
            laptop{j} = xlsread('Measurements.xlsx', 1, cellRange);
            waitbar(j/steps);
        end
        close(h)
        laptop=cell2mat(laptop);
        assignin('base','laptop',laptop);        
        disp('Laptop data is loaded');
        end            
    end
    
    if data(i)==2
        disp([9 '-----> Floor lamp (common)']);
        if any(strcmp(vars1,'floor_lamp_common'))
            choice6=questdlg('The Floor lamp (common) data is allready present in the workspace, do you want to reload?',...
                'Floor lamp (common) data','Yes','No','No');
            switch choice6
                case 'Yes'
                    floor_lamp_common=cell(steps,1);
                    h = waitbar(0,'Loading Floor lamp (common) data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%d:%c%d', ...
                            'D', idx(j)+1, char('D'+col-1), idx(j+1));
                        floor_lamp_common{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    floor_lamp_common=cell2mat(floor_lamp_common); 
                    assignin('base','floor_lamp_common',floor_lamp_common);
                    disp('Floor lamp (common) data is loaded');
                case 'No'
                    disp('Floor lamp (common) remains as before');
            end
        else
            floor_lamp_common=cell(steps,1);
            h = waitbar(0,'Loading Floor lamp (common) data...');
            for j=1:steps  
                cellRange = sprintf('%c%d:%c%d', ...
                    'D', idx(j)+1, char('D'+col-1), idx(j+1));
                floor_lamp_common{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            floor_lamp_common=cell2mat(floor_lamp_common); 
            assignin('base','floor_lamp_common',floor_lamp_common);    
            disp('Floor lamp (common) data is loaded');
        end
    end
    
    if data(i)==3
        disp([9 '-----> Floor lamp (max)']);
        if any(strcmp(vars1,'floor_lamp_max'))
            choice7=questdlg('The Floor lamp (max) data is allready present in the workspace, do you want to reload?',...
                'Floor lamp (max) data','Yes','No','No');
            switch choice7
                case 'Yes'
                    floor_lamp_max=cell(steps,1);
                    h = waitbar(0,'Loading Floor lamp (max) data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%d:%c%d', ...
                            'E', idx(j)+1, char('E'+col-1), idx(j+1));
                        floor_lamp_max{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    floor_lamp_max=cell2mat(floor_lamp_max);
                    assignin('base','floor_lamp_max',floor_lamp_max);             
                    disp('Floor lamp (max) data is loaded');
                case 'No'
                    disp('Floor lamp (max) remains as before');
            end
        else 
            floor_lamp_max=cell(steps,1);
            h = waitbar(0,'Loading Floor lamp (max) data...');
            for j=1:steps  
                cellRange = sprintf('%c%d:%c%d', ...
                    'E', idx(j)+1, char('E'+col-1), idx(j+1));
                floor_lamp_max{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            floor_lamp_max=cell2mat(floor_lamp_max);
            assignin('base','floor_lamp_max',floor_lamp_max);
            disp('Floor lamp (max) data is loaded');
        end
    end
    
    if data(i)==4
        disp([9 '-----> Floor lamp (min)']);
        if any(strcmp(vars1,'floor_lamp_min'))
            choice8=questdlg('The Floor lamp (min) data is allready present in the workspace, do you want to reload?',...
                'Floor lamp (min) data','Yes','No','No');
            switch choice8
                case 'Yes'
                    floor_lamp_min=cell(steps,1);
                    h = waitbar(0,'Loading Floor lamp (min) data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%d:%c%d', ...
                            'F', idx(j)+1, char('F'+col-1), idx(j+1));
                        floor_lamp_min{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    floor_lamp_min=cell2mat(floor_lamp_min);
                    assignin('base','floor_lamp_min',floor_lamp_min);                    
                    disp('Floor lamp (min) data is loaded');
                case 'No'
                    disp('Floor lamp (min) remains as before');
            end
        else 
            floor_lamp_min=cell(steps,1);
            h = waitbar(0,'Loading Floor lamp (min) data...');
            for j=1:steps  
                cellRange = sprintf('%c%d:%c%d', ...
                    'F', idx(j)+1, char('F'+col-1), idx(j+1));
                floor_lamp_min{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            floor_lamp_min=cell2mat(floor_lamp_min);
            assignin('base','floor_lamp_min',floor_lamp_min);
            disp('Floor lamp (min) data is loaded');
        end
    end
    
    if data(i)==5
        disp([9 '-----> Senseo (warming-up)']);
        if any(strcmp(vars1,'senseo_warmingup'))
            choice9=questdlg('Senseo (warming-up) data is allready present in the workspace, do you want to reload?',...
                'Senseo (warming-up data','Yes','No','No');
            switch choice9
                case 'Yes'
                    senseo_warmingup=cell(steps,1);
                    h = waitbar(0,'Loading Senseo (warming-up) data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%d:%c%d', ...
                            'G', idx(j)+1, char('G'+col-1), idx(j+1));
                        senseo_warmingup{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    senseo_warmingup=cell2mat(senseo_warmingup);
                    assignin('base','senseo_warmingup',senseo_warmingup);                    
                    disp('Senseo (warming-up) data is loaded');
                case 'No'
                    disp('Senseo (warming-up) remains as before');
            end
        else
            senseo_warmingup=cell(steps,1);
            h = waitbar(0,'Loading Senseo (warming-up) data...');
            for j=1:steps  
                cellRange = sprintf('%c%d:%c%d', ...
                    'G', idx(j)+1, char('G'+col-1), idx(j+1));
                senseo_warmingup{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            senseo_warmingup=cell2mat(senseo_warmingup);
            assignin('base','senseo_warmingup',senseo_warmingup);
            disp('Senseo (warming-up) data is loaded');
        end
    end
    
    if data(i)==6
        disp([9 '-----> Senseo (running)']);
        if any(strcmp(vars1,'senseo_running'))
            choice10=questdlg('Senseo (running) data is allready present in the workspace, do you want to reload?',...
                'Senseo (running) data','Yes','No','No');
            switch choice10
                case 'Yes'
                    senseo_running=cell(steps,1);
                    h = waitbar(0,'Loading Senseo (running) data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%d:%c%d', ...
                            'H', idx(j)+1, char('H'+col-1), idx(j+1));
                        senseo_running{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    senseo_running=cell2mat(senseo_running);
                    assignin('base','senseo_running',senseo_running);
                    disp('Senseo (running) data is loaded');
                case 'No'
                    disp('Senseo (running) remains as before');
            end
        else 
            senseo_running=cell(steps,1);
            h = waitbar(0,'Loading Senseo (running) data...');
            for j=1:steps  
                cellRange = sprintf('%c%d:%c%d', ...
                    'H', idx(j)+1, char('H'+col-1), idx(j+1));
                senseo_running{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            senseo_running=cell2mat(senseo_running);
            assignin('base','senseo_running',senseo_running);   
            disp('Senseo (running) data is loaded');
        end
    end
    
    if data(i)==7
        disp([9 '-----> Dishwasher (preparing/ending)']);
        if any(strcmp(vars1,'dishwasher_prep_end'))
            choice11=questdlg('Dishwasher (preparing/ending) data is allready present in the workspace, do you want to reload?',...
                'Dishwasher (preparing/ending) data','Yes','No','No');
            switch choice11
                case 'Yes'
                    dishwasher_prep_end=cell(steps,1);
                    h = waitbar(0,'Loading Dishwasher (preparing/ending) data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%d:%c%d', ...
                            'I', idx(j)+1, char('I'+col-1), idx(j+1));
                        dishwasher_prep_end{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    dishwasher_prep_end=cell2mat(dishwasher_prep_end);
                    assignin('base','dishwasher_prep_end',dishwasher_prep_end);                    
                    disp('Dishwasher (preparing/ending) data is loaded');
                case 'No'
                    disp('Dishwasher (preparing/ending) remains as before');
            end
        else 
            dishwasher_prep_end=cell(steps,1);
            h = waitbar(0,'Loading Dishwasher (preparing/ending) data...');
            for j=1:steps  
                cellRange = sprintf('%c%d:%c%d', ...
                    'I', idx(j)+1, char('I'+col-1), idx(j+1));
                dishwasher_prep_end{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            dishwasher_prep_end=cell2mat(dishwasher_prep_end);
            assignin('base','dishwasher_prep_end',dishwasher_prep_end);      
            disp('Dishwasher (preparing/ending) data is loaded');
        end
    end
    
    if data(i)==8
        disp([9 '-----> Dishwasher (rincing)']);
        if any(strcmp(vars1,'dishwasher_rincing'))
            choice12=questdlg('Dishwasher (rincing) data is allready present in the workspace, do you want to reload?',...
                'Dishwasher (rincing) data','Yes','No','No');
            switch choice12
                case 'Yes'
                    dishwasher_rincing=cell(steps,1);
                    h = waitbar(0,'Loading Dishwasher (rincing) data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%d:%c%d', ...
                            'J', idx(j)+1, char('J'+col-1), idx(j+1));
                        dishwasher_rincing{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    dishwasher_rincing=cell2mat(dishwasher_rincing);
                    assignin('base','dishwasher_rincing',dishwasher_rincing);                    
                    disp('Dishwasher (rincing) data is loaded');
                case 'No'
                    disp('Dishwasher (rincing) remains as before');
            end
        else 
            dishwasher_rincing=cell(steps,1);
            h = waitbar(0,'Loading Dishwasher (rincing) data...');
            for j=1:steps  
                cellRange = sprintf('%c%d:%c%d', ...
                    'J', idx(j)+1, char('J'+col-1), idx(j+1));
                dishwasher_rincing{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            dishwasher_rincing=cell2mat(dishwasher_rincing);
            assignin('base','dishwasher_rincing',dishwasher_rincing);
            disp('Dishwasher (rincing) data is loaded');
        end
    end
    
    if data(i)==9
        disp([9 '-----> Dishwasher (blowdrying)']);
        if any(strcmp(vars1,'dishwasher_blowdrying'))
            choice13=questdlg('Dishwasher (blowdrying) data is allready present in the workspace, do you want to reload?',...
                'Dishwasher (blowdrying) data','Yes','No','No');
            switch choice13
                case 'Yes'
                    dishwasher_blowdrying=cell(steps,1);
                    h = waitbar(0,'Loading Dishwasher (blowdrying) data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%d:%c%d', ...
                            'K', idx(j)+1, char('K'+col-1), idx(j+1));
                        dishwasher_blowdrying{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    dishwasher_blowdrying=cell2mat(dishwasher_blowdrying);
                    assignin('base','dishwasher_blowdrying',dishwasher_blowdrying);                    
                    disp('Dishwasher (blowdrying) data is loaded');
                case 'No'
                    disp('Dishwasher (blowdrying) remains as before');
            end
        else 
            dishwasher_blowdrying=cell(steps,1);
            h = waitbar(0,'Loading Dishwasher (blowdrying) data...');
            for j=1:steps  
                cellRange = sprintf('%c%d:%c%d', ...
                    'K', idx(j)+1, char('K'+col-1), idx(j+1));
                dishwasher_blowdrying{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            dishwasher_blowdrying=cell2mat(dishwasher_blowdrying);
            assignin('base','dishwasher_blowdrying',dishwasher_blowdrying);
            disp('Dishwasher (blowdrying) data is loaded');
        end
    end
    
    if data(i)==10
        disp([9 '-----> Dishwasher (cleaning)']);
        if any(strcmp(vars1,'dishwasher_cleaning'))
            choice14=questdlg('Dishwasher (cleaning) data is allready present in the workspace, do you want to reload?',...
                'Dishwasher (cleaning) data','Yes','No','No');
            switch choice14
                case 'Yes'
                    dishwasher_cleaning=cell(steps,1);
                    h = waitbar(0,'Loading Dishwasher (cleaning) data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%d:%c%d', ...
                            'L', idx(j)+1, char('L'+col-1), idx(j+1));
                        dishwasher_cleaning{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    dishwasher_cleaning=cell2mat(dishwasher_cleaning);
                    assignin('base','dishwasher_cleaning',dishwasher_cleaning);                    
                    disp('Dishwasher (cleaning) data is loaded');
                case 'No'
                    disp('Dishwasher (cleaning) remains as before');
            end
        else
            dishwasher_cleaning=cell(steps,1);
            h = waitbar(0,'Loading Dishwasher (cleaning) data...');
            for j=1:steps  
                cellRange = sprintf('%c%d:%c%d', ...
                    'L', idx(j)+1, char('L'+col-1), idx(j+1));
                dishwasher_cleaning{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            dishwasher_cleaning=cell2mat(dishwasher_cleaning);
            assignin('base','dishwasher_cleaning',dishwasher_cleaning);
            disp('Dishwasher (cleaning) data is loaded');
        end        
    end
    
    if data(i)==11
        disp([9 '-----> Washingmachine (disposing water)']);
        if any(strcmp(vars1,'washingmachine_disposing_water'))
            choice15=questdlg('Washingmachine (disposing water) data is allready present in the workspace, do you want to reload?',...
                'Washingmachine (disposing water) data','Yes','No','No');
            switch choice15
                case 'Yes'
                    washingmachine_disposing_water=cell(steps,1);
                    h = waitbar(0,'Loading Washingmachine (disposing water) data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%d:%c%d', ...
                            'M', idx(j)+1, char('M'+col-1), idx(j+1));
                        washingmachine_disposing_water{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    washingmachine_disposing_water=cell2mat(washingmachine_disposing_water);
                    assignin('base','washingmachine_disposing_water',washingmachine_disposing_water);                    
                    disp('Washingmachine (disposing water) data is loaded');
                case 'No'
                    disp('Washingmachine (disposing water) remains as before');
            end
        else 
            washingmachine_disposing_water=cell(steps,1);
            h = waitbar(0,'Loading Washingmachine (disposing water) data...');
            for j=1:steps  
                cellRange = sprintf('%c%d:%c%d', ...
                    'M', idx(j)+1, char('M'+col-1), idx(j+1));
                washingmachine_disposing_water{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            washingmachine_disposing_water=cell2mat(washingmachine_disposing_water);
            assignin('base','washingmachine_disposing_water',washingmachine_disposing_water);
            disp('Washingmachine (disposing water) data is loaded');
        end 
    end
    
     if data(i)==12
        disp([9 '-----> Washingmachine (rincing)']);
        if any(strcmp(vars1,'washingmachine_rincing'))
            choice16=questdlg('Washingmachine (rincing) data is allready present in the workspace, do you want to reload?',...
                'Washingmachine (rincing) data','Yes','No','No');
            switch choice16
                case 'Yes'
                    washingmachine_rincing=cell(steps,1);
                    h = waitbar(0,'Loading Washingmachine (rincing) data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%d:%c%d', ...
                            'N', idx(j)+1, char('N'+col-1), idx(j+1));
                        washingmachine_rincing{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    washingmachine_rincing=cell2mat(washingmachine_rincing);
                    assignin('base','washingmachine_rincing',washingmachine_rincing);                    
                    disp('Washingmachine (rincing) data is loaded');
                case 'No'
                    disp('Washingmachine (rincing) remains as before');
            end
        else 
            washingmachine_rincing=cell(steps,1);
            h = waitbar(0,'Loading Washingmachine (rincing) data...');
            for j=1:steps  
                cellRange = sprintf('%c%d:%c%d', ...
                    'N', idx(j)+1, char('N'+col-1), idx(j+1));
                washingmachine_rincing{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            washingmachine_rincing=cell2mat(washingmachine_rincing);
            assignin('base','washingmachine_rincing',washingmachine_rincing); 
            disp('Washingmachine (rincing) data is loaded');
        end 
     end
    
    if data(i)==13
        disp([9 '-----> Washingmachine (slow centrifuge)']);
        if any(strcmp(vars1,'washingmachine_slow_centrifuge'))
            choice17=questdlg('Washingmachine (slow centrifuge) data is allready present in the workspace, do you want to reload?',...
                'Washingmachine (slow centrifuge) data','Yes','No','No');
            switch choice17
                case 'Yes'
                    washingmachine_slow_centrifuge=cell(steps,1);
                    h = waitbar(0,'Loading Washingmachine (slow centrifuge) data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%d:%c%d', ...
                            'O', idx(j)+1, char('O'+col-1), idx(j+1));
                        washingmachine_slow_centrifuge{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    washingmachine_slow_centrifuge=cell2mat(washingmachine_slow_centrifuge);
                    assignin('base','washingmachine_slow_centrifuge',washingmachine_slow_centrifuge);                    
                    disp('Washingmachine (slow centrifuge) data is loaded');
                case 'No'
                    disp('Washingmachine (slow centrifuge) remains as before');
            end
        else 
            washingmachine_slow_centrifuge=cell(steps,1);
            h = waitbar(0,'Loading Washingmachine (slow centrifuge) data...');
            for j=1:steps  
                cellRange = sprintf('%c%d:%c%d', ...
                    'O', idx(j)+1, char('O'+col-1), idx(j+1));
                washingmachine_slow_centrifuge{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            washingmachine_slow_centrifuge=cell2mat(washingmachine_slow_centrifuge);
            assignin('base','washingmachine_slow_centrifuge',washingmachine_slow_centrifuge);                    
            disp('Washingmachine (slow centrifuge) data is loaded');
        end
    end
    
    if data(i)==14
        disp([9 '-----> Washingmachine (fast centrifuge)']);
        if any(strcmp(vars1,'washingmachine_fast_centrifuge'))
            choice18=questdlg('Washingmachine (fast centrifuge) data is allready present in the workspace, do you want to reload?',...
                'Washingmachine (fast centrifuge) data','Yes','No','No');
            switch choice18
                case 'Yes'
                    washingmachine_fast_centrifuge=cell(steps,1);
                    h = waitbar(0,'Loading Washingmachine (fast centrifuge) data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%d:%c%d', ...
                            'P', idx(j)+1, char('P'+col-1), idx(j+1));
                        washingmachine_fast_centrifuge{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    washingmachine_fast_centrifuge=cell2mat(washingmachine_fast_centrifuge);
                    assignin('base','washingmachine_fast_centrifuge',washingmachine_fast_centrifuge);                    
                    disp('Washingmachine (fast centrifuge) data is loaded');
                case 'No'
                    disp('Washingmachine (fast centrifuge) remains as before');
            end
        else 
            washingmachine_fast_centrifuge=cell(steps,1);
            h = waitbar(0,'Loading Washingmachine (fast centrifuge) data...');
            for j=1:steps  
                cellRange = sprintf('%c%d:%c%d', ...
                    'P', idx(j)+1, char('P'+col-1), idx(j+1));
                washingmachine_fast_centrifuge{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            washingmachine_fast_centrifuge=cell2mat(washingmachine_fast_centrifuge);
            assignin('base','washingmachine_fast_centrifuge',washingmachine_fast_centrifuge);
            disp('Washingmachine (fast centrifuge) data is loaded');
        end
    end
    
    if data(i)==15
        disp([9 '-----> Washingmachine (washing)']);
        if any(strcmp(vars1,'washingmachine_washing'))
            choice19=questdlg('Washingmachine (washing) data is allready present in the workspace, do you want to reload?',...
                'Washingmachine (washing) data','Yes','No','No');
            switch choice19
                case 'Yes'
                    washingmachine_washing=cell(steps,1);
                    h = waitbar(0,'Loading Washingmachine (washing) data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%d:%c%d', ...
                            'Q', idx(j)+1, char('Q'+col-1), idx(j+1));
                        washingmachine_washing{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    washingmachine_washing=cell2mat(washingmachine_washing);
                    assignin('base','washingmachine_washing',washingmachine_washing);                    
                    disp('Washingmachine (washing) data is loaded');
                case 'No'
                    disp('Washingmachine (washing) remains as before');
            end
        else
            washingmachine_washing=cell(steps,1);
            h = waitbar(0,'Loading Washingmachine (washing) data...');
            for j=1:steps  
                cellRange = sprintf('%c%d:%c%d', ...
                    'Q', idx(j)+1, char('Q'+col-1), idx(j+1));
                washingmachine_washing{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            washingmachine_washing=cell2mat(washingmachine_washing);
            assignin('base','washingmachine_washing',washingmachine_washing);
            disp('Washingmachine (washing) data is loaded');
        end
    end
    
    if data(i)==16
        disp([9 '-----> Washingmachine (rest)']);
        if any(strcmp(vars1,'washingmachine_rest'))
            choice20=questdlg('Washingmachine (rest) data is allready present in the workspace, do you want to reload?',...
                'Washingmachine (rest) data','Yes','No','No');
            switch choice20
                case 'Yes'
                    washingmachine_rest=cell(steps,1);
                    h = waitbar(0,'Loading Washingmachine (rest) data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%d:%c%d', ...
                            'R', idx(j)+1, char('R'+col-1), idx(j+1));
                        washingmachine_rest{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    washingmachine_rest=cell2mat(washingmachine_rest);
                    assignin('base','washingmachine_rest',washingmachine_rest);                    
                    disp('Washingmachine (rest) data is loaded');
                case 'No'
                    disp('Washingmachine (rest) remains as before');
            end
        else
            washingmachine_rest=cell(steps,1);
            h = waitbar(0,'Loading Washingmachine (rest) data...');
            for j=1:steps  
                cellRange = sprintf('%c%d:%c%d', ...
                    'R', idx(j)+1, char('R'+col-1), idx(j+1));
                washingmachine_rest{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            washingmachine_rest=cell2mat(washingmachine_rest);
            assignin('base','washingmachine_rest',washingmachine_rest); 
            disp('Washingmachine (rest) data is loaded');
        end
    end
    
    if data(i)==17
        disp([9 '-----> Washingmachine (taking water)']);
        if any(strcmp(vars1,'washingmachine_taking_water'))
            choice21=questdlg('Washingmachine (taking water) data is allready present in the workspace, do you want to reload?',...
                'Washingmachine (taking water) data','Yes','No','No');
            switch choice21
                case 'Yes'
                    washingmachine_taking_water=cell(steps,1);
                    h = waitbar(0,'Loading Washingmachine (taking water) data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%d:%c%d', ...
                            'S', idx(j)+1, char('S'+col-1), idx(j+1));
                        washingmachine_taking_water{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    washingmachine_taking_water=cell2mat(washingmachine_taking_water);
                    assignin('base','washingmachine_taking_water',washingmachine_taking_water);                    
                    disp('Washingmachine (taking water) data is loaded');
                case 'No'
                    disp('Washingmachine (taking water) remains as before');
            end
        else
            washingmachine_taking_water=cell(steps,1);
            h = waitbar(0,'Loading Washingmachine (taking water) data...');
            for j=1:steps  
                cellRange = sprintf('%c%d:%c%d', ...
                    'S', idx(j)+1, char('S'+col-1), idx(j+1));
                washingmachine_taking_water{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            washingmachine_taking_water=cell2mat(washingmachine_taking_water);
            assignin('base','washingmachine_taking_water',washingmachine_taking_water); 
            disp('Washingmachine (taking water) data is loaded');
        end
    end
    
    if data(i)==18
        disp([9 '-----> Dryer (drying)']);
        if any(strcmp(vars1,'dryer_drying'))
            choice22=questdlg('Dryer (drying) data is allready present in the workspace, do you want to reload?',...
                'Dryer (drying) data','Yes','No','No');
            switch choice22
                case 'Yes'
                    dryer_drying=cell(steps,1);
                    h = waitbar(0,'Loading Dryer (drying) data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%d:%c%d', ...
                            'T', idx(j)+1, char('T'+col-1), idx(j+1));
                        dryer_drying{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    dryer_drying=cell2mat(dryer_drying);
                    assignin('base','dryer_drying',dryer_drying);                    
                    disp('Dryer (drying) data is loaded');
                case 'No'
                    disp('Dryer (drying) remains as before');
            end
        else 
            dryer_drying=cell(steps,1);
            h = waitbar(0,'Loading Dryer (drying) data...');
            for j=1:steps  
                cellRange = sprintf('%c%d:%c%d', ...
                    'T', idx(j)+1, char('T'+col-1), idx(j+1));
                dryer_drying{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            dryer_drying=cell2mat(dryer_drying);
            assignin('base','dryer_drying',dryer_drying);
            disp('Dryer (drying) data is loaded');
        end
    end
    
    if data(i)==19
        disp([9 '-----> Dryer ventilating']);
        if any(strcmp(vars1,'dryer_vent'))
            choice23=questdlg('Dryer ventilating data is allready present in the workspace, do you want to reload?',...
                'Dryer ventilating data','Yes','No','No');
            switch choice23
                case 'Yes'
                    dryer_vent=cell(steps,1);
                    h = waitbar(0,'Loading Dryer ventilating data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%d:%c%d', ...
                            'U', idx(j)+1, char('U'+col-1), idx(j+1));
                        dryer_vent{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    dryer_vent=cell2mat(dryer_vent);
                    assignin('base','dryer_vent',dryer_vent);                    
                    disp('Dryer ventilating data is loaded');
                case 'No'
                    disp('Dryer ventilating remains as before');
            end
        else
            dryer_vent=cell(steps,1);
            h = waitbar(0,'Loading Dryer ventilating data...');
            for j=1:steps  
                cellRange = sprintf('%c%d:%c%d', ...
                    'U', idx(j)+1, char('U'+col-1), idx(j+1));
                dryer_vent{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            dryer_vent=cell2mat(dryer_vent);
            assignin('base','dryer_vent',dryer_vent);  
            disp('Dryer ventilating data is loaded');
        end
    end
    
    if data(i)==20
        disp([9 '-----> Freezer']);
        if any(strcmp(vars1,'freezer'))
            choice24=questdlg('Freezer data is allready present in the workspace, do you want to reload?',...
                'Freezer data','Yes','No','No');
            switch choice24
                case 'Yes'
                    freezer=cell(steps,1);
                    h = waitbar(0,'Loading Freezer data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%d:%c%d', ...
                            'V', idx(j)+1, char('V'+col-1), idx(j+1));
                        freezer{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    freezer=cell2mat(freezer);
                    assignin('base','freezer',freezer);                    
                    disp('Freezer data is loaded');
                case 'No'
                    disp('Freezer remains as before');
            end
        else
            freezer=cell(steps,1);
            h = waitbar(0,'Loading Freezer data...');
            for j=1:steps  
                cellRange = sprintf('%c%d:%c%d', ...
                    'V', idx(j)+1, char('V'+col-1), idx(j+1));
                freezer{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            freezer=cell2mat(freezer);
            assignin('base','freezer',freezer);  
            disp('Freezer data is loaded');
        end
    end
    
    if data(i)==21
        disp([9 '-----> Fridge']);
        if any(strcmp(vars1,'fridge'))
            choice25=questdlg('Fridge data is allready present in the workspace, do you want to reload?',...
                'Fridge data','Yes','No','No');
            switch choice25
                case 'Yes'
                    fridge=cell(steps,1);
                    h = waitbar(0,'Loading Fridge data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%d:%c%d', ...
                            'W', idx(j)+1, char('W'+col-1), idx(j+1));
                        fridge{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    fridge=cell2mat(fridge);
                    assignin('base','fridge',fridge);                    
                    disp('Fridge data is loaded');
                case 'No'
                    disp('Fridge remains as before');
            end
        else
            fridge=cell(steps,1);
            h = waitbar(0,'Loading Fridge data...');
            for j=1:steps  
                cellRange = sprintf('%c%d:%c%d', ...
                    'W', idx(j)+1, char('W'+col-1), idx(j+1));
                fridge{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            fridge=cell2mat(fridge);
            assignin('base','fridge',fridge);  
            disp('Fridge data is loaded');
        end
    end
    
    if data(i)==22
        disp([9 '-----> Extractor hood']);
        if any(strcmp(vars1,'extractor'))
            choice26=questdlg('Extractor hood data is allready present in the workspace, do you want to reload?',...
                'Extractor hood data','Yes','No','No');
            switch choice26
                case 'Yes'
                    extractor=cell(steps,1);
                    h = waitbar(0,'Loading Extractor hood data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%d:%c%d', ...
                            'X', idx(j)+1, char('X'+col-1), idx(j+1));
                        extractor{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    extractor=cell2mat(extractor);
                    assignin('base','extractor',extractor);                    
                    disp('Extractor hood data is loaded');
                case 'No'
                    disp('Extractor hood remains as before');
            end
        else
            extractor=cell(steps,1);
            h = waitbar(0,'Loading Extractor hood data...');
            for j=1:steps  
                cellRange = sprintf('%c%d:%c%d', ...
                    'X', idx(j)+1, char('X'+col-1), idx(j+1));
                extractor{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            extractor=cell2mat(extractor);
            assignin('base','extractor',extractor); 
            disp('Extractor hood data is loaded');
        end
    end
    
    if data(i)==23
        disp([9 '-----> Phone Charger']);
        if any(strcmp(vars1,'phone_charger'))
            choice27=questdlg('Phone Charger data is allready present in the workspace, do you want to reload?',...
                'Phone Charger data','Yes','No','No');
            switch choice27
                case 'Yes'
                    phone_charger=cell(steps,1);
                    h = waitbar(0,'Loading Phone Charger data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%d:%c%d', ...
                            'Y', idx(j)+1, char('Y'+col-1), idx(j+1));
                        phone_charger{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    phone_charger=cell2mat(phone_charger);
                    assignin('base','phone_charger',phone_charger);                    
                    disp('Phone Charger data is loaded');
                case 'No'
                    disp('Phone Charger remains as before');
            end
        else
            phone_charger=cell(steps,1);
            h = waitbar(0,'Loading Phone Charger data...');
            for j=1:steps  
                cellRange = sprintf('%c%d:%c%d', ...
                    'Y', idx(j)+1, char('Y'+col-1), idx(j+1));
                phone_charger{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            phone_charger=cell2mat(phone_charger);
            assignin('base','phone_charger',phone_charger); 
            disp('Phone Charger data is loaded');
        end
    end
    
    if data(i)==24
        disp([9 '-----> TV']);
        if any(strcmp(vars1,'tv'))
            choice28=questdlg('TV data is allready present in the workspace, do you want to reload?',...
                'TV data','Yes','No','No');
            switch choice28
                case 'Yes'
                    tv=cell(steps,1);
                    h = waitbar(0,'Loading TV data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%d:%c%d', ...
                            'Z', idx(j)+1, char('Z'+col-1), idx(j+1));
                        tv{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    tv=cell2mat(tv);
                    assignin('base','tv',tv);                    
                    disp('TV data is loaded');
                case 'No'
                    disp('TV remains as before');
            end
        else
            tv=cell(steps,1);
            h = waitbar(0,'Loading TV data...');
            for j=1:steps  
                cellRange = sprintf('%c%d:%c%d', ...
                    'Z', idx(j)+1, char('Z'+col-1), idx(j+1));
                tv{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            tv=cell2mat(tv);
            assignin('base','tv',tv); 
            disp('TV data is loaded');
        end
    end
    
    if data(i)==25
        disp([9 '-----> TV receiver']);
        if any(strcmp(vars1,'tv_receiver'))
            choice29=questdlg('TV receiver data is allready present in the workspace, do you want to reload?',...
                'TV receiver data','Yes','No','No');
            switch choice29
                case 'Yes'
                    tv_receiver=cell(steps,1);
                    h = waitbar(0,'Loading TV receiver data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%c%d:%c%c%d', ...
                            'A','A',idx(j)+1, char('A','A'+col-1), idx(j+1));
                        tv_receiver{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    tv_receiver=cell2mat(tv_receiver);
                    assignin('base','tv_receiver',tv_receiver);                    
                    disp('TV receiver data is loaded');
                case 'No'
                    disp('TV receiver remains as before');
            end
        else
            tv_receiver=cell(steps,1);
            h = waitbar(0,'Loading TV receiver data...');
            for j=1:steps  
                cellRange = sprintf('%c%c%d:%c%c%d', ...
                    'A','A',idx(j)+1, char('A','A'+col-1), idx(j+1));
                tv_receiver{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            tv_receiver=cell2mat(tv_receiver);
            assignin('base','tv_receiver',tv_receiver); 
            disp('TV receiver data is loaded');
        end
    end
    
    if data(i)==26
        disp([9 '-----> Sound amplifier']);
        if any(strcmp(vars1,'sound_amp'))
            choice30=questdlg('Sound amplifier data is allready present in the workspace, do you want to reload?',...
                'Sound amplifier data','Yes','No','No');
            switch choice30
                case 'Yes'
                    sound_amp=cell(steps,1);
                    h = waitbar(0,'Loading Sound amplifier data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%c%d:%c%c%d', ...
                            'A','B',idx(j)+1, char('A','B'+col-1), idx(j+1));
                        sound_amp{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    sound_amp=cell2mat(sound_amp);
                    assignin('base','sound_amp',sound_amp);                    
                    disp('Sound amplifier data is loaded');
                case 'No'
                    disp('Sound amplifier remains as before');
            end
        else
            sound_amp=cell(steps,1);
            h = waitbar(0,'Loading Sound amplifier data...');
            for j=1:steps  
                cellRange = sprintf('%c%c%d:%c%c%d', ...
                    'A','B',idx(j)+1, char('A','B'+col-1), idx(j+1));
                sound_amp{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            sound_amp=cell2mat(sound_amp);
            assignin('base','sound_amp',sound_amp); 
            disp('Sound amplifier data is loaded');
        end
    end
    
    if data(i)==27
        disp([9 '-----> Subwoofer']);
        if any(strcmp(vars1,'sub'))
            choice31=questdlg('Subwoofer data is allready present in the workspace, do you want to reload?',...
                'Subwoofer data','Yes','No','No');
            switch choice31
                case 'Yes'
                    sub=cell(steps,1);
                    h = waitbar(0,'Loading Subwoofer data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%c%d:%c%c%d', ...
                            'A','C',idx(j)+1, char('A','C'+col-1), idx(j+1));
                        sub{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    sub=cell2mat(sub);
                    assignin('base','sub',sub);                    
                    disp('Subwoofer data is loaded');
                case 'No'
                    disp('Subwoofer remains as before');
            end
        else
            sub=cell(steps,1);
            h = waitbar(0,'Loading Subwoofer data...');
            for j=1:steps  
                cellRange = sprintf('%c%c%d:%c%c%d', ...
                    'A','C',idx(j)+1, char('A','C'+col-1), idx(j+1));
                sub{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            sub=cell2mat(sub);
            assignin('base','sub',sub); 
            disp('Subwoofer data is loaded');
        end
    end
    
    if data(i)==28
        disp([9 '-----> PS3']);
        if any(strcmp(vars1,'ps3'))
            choice32=questdlg('PS3 data is allready present in the workspace, do you want to reload?',...
                'PS3 data','Yes','No','No');
            switch choice32
                case 'Yes'
                    ps3=cell(steps,1);
                    h = waitbar(0,'Loading PS3 data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%c%d:%c%c%d', ...
                            'A','D',idx(j)+1, char('A','D'+col-1), idx(j+1));
                        ps3{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    ps3=cell2mat(ps3);
                    assignin('base','ps3',ps3);                    
                    disp('PS3 data is loaded');
                case 'No'
                    disp('PS3 remains as before');
            end
        else
            ps3=cell(steps,1);
            h = waitbar(0,'Loading PS3 data...');
            for j=1:steps  
                cellRange = sprintf('%c%c%d:%c%c%d', ...
                    'A','D',idx(j)+1, char('A','D'+col-1), idx(j+1));
                ps3{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            ps3=cell2mat(ps3);
            assignin('base','ps3',ps3); 
            disp('PS3 data is loaded');
        end
    end
    
    if data(i)==29
        disp([9 '-----> Wii']);
        if any(strcmp(vars1,'wii'))
            choice33=questdlg('Wii data is allready present in the workspace, do you want to reload?',...
                'Wii data','Yes','No','No');
            switch choice33
                case 'Yes'
                    wii=cell(steps,1);
                    h = waitbar(0,'Loading Wii data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%c%d:%c%c%d', ...
                            'A','E',idx(j)+1, char('A','E'+col-1), idx(j+1));
                        wii{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    wii=cell2mat(wii);
                    assignin('base','wii',wii);                    
                    disp('Wii data is loaded');
                case 'No'
                    disp('Wii remains as before');
            end
        else
            wii=cell(steps,1);
            h = waitbar(0,'Loading Wii data...');
            for j=1:steps  
                cellRange = sprintf('%c%c%d:%c%c%d', ...
                    'A','E',idx(j)+1, char('A','E'+col-1), idx(j+1));
                wii{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            wii=cell2mat(wii);
            assignin('base','wii',wii); 
            disp('Wii data is loaded');
        end
    end
    
    if data(i)==30
        disp([9 '-----> DVD player']);
        if any(strcmp(vars1,'dvd'))
            choice34=questdlg('DVD player data is allready present in the workspace, do you want to reload?',...
                'DVD player data','Yes','No','No');
            switch choice34
                case 'Yes'
                    dvd=cell(steps,1);
                    h = waitbar(0,'Loading DVD player data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%c%d:%c%c%d', ...
                            'A','F',idx(j)+1, char('A','F'+col-1), idx(j+1));
                        dvd{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    dvd=cell2mat(dvd);
                    assignin('base','dvd',dvd);                    
                    disp('DVD player data is loaded');
                case 'No'
                    disp('DVD player remains as before');
            end
        else
            dvd=cell(steps,1);
            h = waitbar(0,'Loading DVD player data...');
            for j=1:steps  
                cellRange = sprintf('%c%c%d:%c%c%d', ...
                    'A','F',idx(j)+1, char('A','F'+col-1), idx(j+1));
                dvd{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            dvd=cell2mat(dvd);
            assignin('base','dvd',dvd); 
            disp('DVD player data is loaded');
        end
    end
    
    if data(i)==31
        disp([9 '-----> Modem']);
        if any(strcmp(vars1,'modem'))
            choice35=questdlg('Modem data is allready present in the workspace, do you want to reload?',...
                'Modem data','Yes','No','No');
            switch choice35
                case 'Yes'
                    modem=cell(steps,1);
                    h = waitbar(0,'Loading Modem data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%c%d:%c%c%d', ...
                            'A','G',idx(j)+1, char('A','G'+col-1), idx(j+1));
                        modem{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    modem=cell2mat(modem);
                    assignin('base','modem',modem);                    
                    disp('Modem data is loaded');
                case 'No'
                    disp('Modem remains as before');
            end
        else
            modem=cell(steps,1);
            h = waitbar(0,'Loading Modem data...');
            for j=1:steps  
                cellRange = sprintf('%c%c%d:%c%c%d', ...
                    'A','G',idx(j)+1, char('A','G'+col-1), idx(j+1));
                modem{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            modem=cell2mat(modem);
            assignin('base','modem',modem); 
            disp('Modem data is loaded');
        end
    end
    
    if data(i)==32
        disp([9 '-----> Alarm clock']);
        if any(strcmp(vars1,'alarm'))
            choice36=questdlg('Alarm clock is allready present in the workspace, do you want to reload?',...
                'Alarm clock','Yes','No','No');
            switch choice36
                case 'Yes'
                    alarm=cell(steps,1);
                    h = waitbar(0,'Loading Alarm clock data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%c%d:%c%c%d', ...
                            'A','H',idx(j)+1, char('A','H'+col-1), idx(j+1));
                        alarm{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    alarm=cell2mat(alarm);
                    assignin('base','alarm',alarm);                    
                    disp('Alarm clock data is loaded');
                case 'No'
                    disp('Alarm clock remains as before');
            end
        else
            alarm=cell(steps,1);
            h = waitbar(0,'Loading Alarm clock data...');
            for j=1:steps  
                cellRange = sprintf('%c%c%d:%c%c%d', ...
                    'A','H',idx(j)+1, char('A','H'+col-1), idx(j+1));
                alarm{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            alarm=cell2mat(alarm);
            assignin('base','alarm',alarm); 
            disp('Alarm clock data is loaded');
        end
    end
    
    if data(i)==33
        disp([9 '-----> External HDD']);
        if any(strcmp(vars1,'ex_hdd'))
            choice37=questdlg('External HDD is allready present in the workspace, do you want to reload?',...
                'External HDD','Yes','No','No');
            switch choice37
                case 'Yes'
                    ex_hdd=cell(steps,1);
                    h = waitbar(0,'Loading External HDD data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%c%d:%c%c%d', ...
                            'A','I',idx(j)+1, char('A','I'+col-1), idx(j+1));
                        ex_hdd{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    ex_hdd=cell2mat(ex_hdd);
                    assignin('base','ex_hdd',ex_hdd);                    
                    disp('External HDD data is loaded');
                case 'No'
                    disp('External HDD remains as before');
            end
        else
            ex_hdd=cell(steps,1);
            h = waitbar(0,'Loading External HDD data...');
            for j=1:steps  
                cellRange = sprintf('%c%c%d:%c%c%d', ...
                    'A','I',idx(j)+1, char('A','I'+col-1), idx(j+1));
                ex_hdd{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            ex_hdd=cell2mat(ex_hdd);
            assignin('base','ex_hdd',ex_hdd); 
            disp('External HDD data is loaded');
        end
    end
    
    if data(i)==34
        disp([9 '-----> Oven']);
        if any(strcmp(vars1,'oven'))
            choice38=questdlg('Oven is allready present in the workspace, do you want to reload?',...
                'Oven','Yes','No','No');
            switch choice38
                case 'Yes'
                    oven=cell(steps,1);
                    h = waitbar(0,'Loading Oven data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%c%d:%c%c%d', ...
                            'A','J',idx(j)+1, char('A','J'+col-1), idx(j+1));
                        oven{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    oven=cell2mat(oven);
                    assignin('base','oven',oven);                    
                    disp('Oven data is loaded');
                case 'No'
                    disp('Oven remains as before');
            end
        else
            oven=cell(steps,1);
            h = waitbar(0,'Loading Oven data...');
            for j=1:steps  
                cellRange = sprintf('%c%c%d:%c%c%d', ...
                    'A','J',idx(j)+1, char('A','J'+col-1), idx(j+1));
                oven{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            oven=cell2mat(oven);
            assignin('base','oven',oven); 
            disp('Oven data is loaded');
        end
    end
    
    if data(i)==35
        disp([9 '-----> Frying pan']);
        if any(strcmp(vars1,'fry'))
            choice39=questdlg('Frying pan is allready present in the workspace, do you want to reload?',...
                'Frying pan','Yes','No','No');
            switch choice39
                case 'Yes'
                    fry=cell(steps,1);
                    h = waitbar(0,'Loading Frying pan data...');
                    for j=1:steps  
                        cellRange = sprintf('%c%c%d:%c%c%d', ...
                            'A','K',idx(j)+1, char('A','K'+col-1), idx(j+1));
                        fry{j} = xlsread('Measurements.xlsx', 1, cellRange);
                        waitbar(j/steps);
                    end
                    close(h)
                    fry=cell2mat(fry);
                    assignin('base','fry',fry);                    
                    disp('Frying pan data is loaded');
                case 'No'
                    disp('Frying pan remains as before');
            end
        else
            fry=cell(steps,1);
            h = waitbar(0,'Loading Frying pan data...');
            for j=1:steps  
                cellRange = sprintf('%c%c%d:%c%c%d', ...
                    'A','K',idx(j)+1, char('A','K'+col-1), idx(j+1));
                fry{j} = xlsread('Measurements.xlsx', 1, cellRange);
                waitbar(j/steps);
            end
            close(h)
            fry=cell2mat(fry);
            assignin('base','fry',fry); 
            disp('Frying pan data is loaded');
        end
    end
end

plotGUI;

end
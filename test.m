V=5; %the peak voltage
f0 = 1000; % Fundamental frequency in Hertz
w0 = 2*pi*f0; % Fundamental frequency in radians
T=1/f0; 
D=0.5; % pulse duty ratio
% plotting a square wave
dT=T/512; % incremental time,
t1=0:dT:D*T-dT; % Positive half period
t2=D*T:dT:T-dT; % Negative half period
t=[t1 t2]; %One complete period
v=V*[ones(size(t1)) -ones(size(t2))]; % square wave signal over a period 

V0=0;
V1= 4*V/pi;
V3= 4*V/(3*pi);
V5= 4*V/(5*pi);
V7= 4*V/(7*pi);
V9= 4*V/(9*pi);
v1 = V0+V1*sin(w0*t); % First (fundamental) harmonic
v13 = v1+V3*sin(3*w0*t); % First + Third harmonic
v135 =v13+V5*sin(5*w0*t); % First +Third +Fifth harmonic
subplot (3,2,1)
plot (t,v,t,v1)
axis ([ 0 .001 -15 15])
subplot(3,2,2)
plot(t,v,t,v13)
axis([0 .001 -15 15])
subplot(3,2,3)
plot(t,v,t,v135) 
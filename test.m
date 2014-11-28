omega=(0:400)*pi/400; 
b=[0 2];
H=freqz(b,1,omega);
subplot(2,1,1); 
plot(omega/pi,abs(H));
subplot(2,1,2); 
plot(omega/pi,angle(H));
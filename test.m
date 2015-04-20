t = 0:0.001:5;
A1 = 3; % amplitude
phi1 = pi/6; % phase in radians
x1 = real(A1*exp(1j*phi1).*exp(1j*2*pi*4*t));
plot(t, x1)
close all, clc

Fs = 100 % Sampling frequency
N = 128 % Number of samples
dt = 1/Fs % Time sampling interval
T = N*dt % fft imposed period: x(t+/-T) = x(t)
t = (0:N-1)*dt; % Time vector t = 0:dt:T-dt

f01 = 5 % Dominant frequency component 
f02 = 20
f03 = 40
fc = 10 % Box filter cutoff frequency

if(fc > Fs/2)
   error('Lowpass Cutoff exceeds Nyquist')
end

x1 = 2*sin(2*pi*f01*t);
x2 = sin(2*pi*f02*t);
x3 = sin(2*pi*f03*t);
x = x1+x2+x3;
meanx = mean(x) % 0.0048
% x = x - mean(x); % Eliminates DC component

k=k+1; figure(k) % figure 1
subplot(2,2,1)
plot(t,x1)
subplot(2,2,2)
plot(t,x2)
subplot(2,2,3)
plot(t,x3)
subplot(2,2,4)
plot(t,x)

X = fft(x);

df = 1/T % Frequency sampling interval
Fs = N*df % fft imposed period: X(f+/-Fs) = X(f)
f = (0:N-1)*df; % Frequency vector f = 0:df:Fs-df

k=k+1; figure(k) % figure 2
subplot(2,2,1)
plot(f,real(X))
subplot(2,2,2)
plot(f,imag(X))
subplot(2,2,3)
plot(f,abs(X))
subplot(2,2,4)
plot(f,angle(X))

indlow = 1 + max(find( f(f <= fc) )) % 14
fclow = f(indlow) % 10.1563
indhigh = N+2-indlow % 116
fchigh = f(indhigh) % 89.8438
Xlow = X;
Xlow(indlow:indhigh) = 0.0;

k=k+1; figure(k) % figure 3
subplot(2,2,1)
plot(f,real(Xlow))
subplot(2,2,2)
plot(f,imag(Xlow))
subplot(2,2,3)
plot(f,abs(Xlow))
subplot(2,2,4)
plot(f,angle(Xlow))

xlow = real(ifft(Xlow));

k=k+1; figure(k) % figure 4
subplot(2,1,1)
plot(t,x)
hold on
plot(t,xlow,'r')
subplot(2,1,2)
plot(t,x1)
hold on
plot(t,xlow,'r')

Xb = fftshift(X); % Defined on a "b"ipolar frequency

Q = ceil((N+1)/2) % Q Unique points for real x
P = floor((N+1)/2) % P = N+1-Q
fQ = (Q-1)*df % Maximum positive frequency
fP = (P-1)*df % Maximum negative frequency
fb = -fP : df : fQ; % fb = f-fP;

k=k+1; figure(k) % figure 5
subplot(2,2,1)
plot(fb,real(Xb)) % Symmetric
subplot(2,2,2)
plot(fb,imag(Xb)) % Antisymmetric
subplot(2,2,3)
plot(fb,abs(Xb)) % Symmetric
subplot(2,2,4)
plot(fb,angle(Xb)) % Antisymmetric

Outb = find(abs(fb)>fc);
Xblow = Xb;
Xblow(Outb) = 0.0;

k=k+1; figure(k) % figure 6
subplot(2,2,1)
plot(fb,real(Xblow))
subplot(2,2,2)
plot(fb,imag(Xblow))
subplot(2,2,3)
plot(fb,abs(Xblow))
subplot(2,2,4)
plot(fb,angle(Xblow))

err1 = maxabs(ifftshift(Xblow)-Xlow) % 0

Out = find(f>fc & f< fP+fQ+df-fc);
Xlow2 = X;
Xlow2(Out) = 0.0;
err2 = maxabs(Xlow2-Xlow) % 0

for j=k:-1:1
   figure(j)
end

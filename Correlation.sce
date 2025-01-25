//CORRELATION OF 2 SEQUENCES
x1=[1,1,1,0]
x2=[1,2,3,4]
m=length(x1)
n=length(x2)
y=xcorr(x1,x2)
z=xcorr(x1,x1)
a=xcorr(x2,x2)
subplot(511)
plot2d3(x1)
subplot(512)
plot2d3(x2)
subplot(513)
plot2d3(y)
subplot(514)
plot2d3(z)
subplot(515)
plot2d3(a)


//RADAR SIGNAL PROCESSING
x=[1 2 3 4 5 6 7 8]
r=[0 0 0 1 2 3 4 5 6 7 8]
n=rand(length(r))
y1=r+n
y2=n
detected = corr(y1,r)
pass= xcorr(y2,r)
subplot(311)
title("Sequence")
plot2d3(x)
subplot(312)
title("Autocorrelation")
plot2d3(detected)
subplot(313)
title("Crosscorrelation")
plot2d3(pass)


//BINARY SYMBOL DETECION AT RECEIVER
N=100
n=0:N-1
x0=cos(n*%pi/4)
x1=cos(n*%pi/8)
lol=rand(1,N)
noise=lol-0.5
y0=x0+noise
y1=x1+noise
x0corr=xcorr(x0,y0)
x1corr=xcorr(x1,y1)
subplot(511)
title("x0 signal")
xlabel("Index")
ylabel("Amplitude")
plot2d3(x0)
subplot(512)
title("x1 signal")
xlabel("Index")
ylabel("Amplitude")
plot2d3(x1)
subplot(513)
title("Noise")
xlabel("Index")
ylabel("Amplitude")
plot2d3(noise)
subplot(514)
title("Autocorrelation of x(t)")
xlabel("Index")
ylabel("Amplitude")
plot2d3(x0corr)
subplot(515)
title("Crosscorrelation of x(t) with y(t)")
xlabel("Index")
ylabel("Amplitude")
plot2d3(x1corr)


//CROSS CORRELATION OF 2 PULSE AMPLITUDE MODULATION SIGNALS
N = 100;
n = 0:N-1;
carrier = cos(2 * %pi * 0.1 * n);
message1 = sin(2 * %pi * 0.02 * n);
message2 = cos(2 * %pi * 0.03 * n);
pam1 = carrier .* message1;
pam2 = carrier .* message2;
noise1 = rand(1, N) - 0.5;
noise2 = rand(1, N) - 0.5;
y1 = pam1 + noise1;
y2 = pam2 + noise2;
cross_corr = xcorr(pam1, pam2);
clf;
scf()
title("Message Signal 1")
xlabel("Index")
ylabel("Amplitude")
plot2d3(n, message1);
scf()
title("Message Signal 2")
xlabel("Index")
ylabel("Amplitude")
plot2d3(n, message2);
scf()
title("PAM Signal 1 (Message1 modulated with carrier)")
xlabel("Index")
ylabel("Amplitude")
plot2d3(n, pam1);
scf()
title("PAM Signal 2 (Message2 modulated with carrier)")
xlabel("Index")
ylabel("Amplitude")
plot2d3(n, pam2);
scf()
title("Noise Added to PAM Signal 1")
xlabel("Index")
ylabel("Amplitude")
plot2d3(n, y1);
scf()
title("Cross-correlation of PAM Signals")
xlabel("Index")
ylabel("Amplitude")
plot2d3(-N+1:N-1, cross_corr);

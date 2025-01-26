// Storing sound 
clc;
close;
clear;
row_f1=[700 770 850 941]; // Row Frequency
colum_f1=[1220 1350 1490]; // Column Frequency
fs=8000; // Sampling Frequency
N=1:8000; // Total No. of Sample
mobile=[9]; // Mobile Number
temp=[]; // Array that Contain total signal for each Digit
figure;
for i=1:length(mobile)
select mobile(i)
case 1
row_f=1;
colum_f=1;
case 2
row_f=1;
colum_f=2;
case 3
row_f=1;
colum_f=3;
case 4
row_f=2;
colum_f=1;
case 5
row_f=2;
colum_f=2;
case 6
row_f=2;
colum_f=3;
case 7
row_f=3;
colum_f=1;
case 8
row_f=3;
colum_f=2;
case 9
row_f=3;
colum_f=3;
case 0
row_f=4;
colum_f=2;
else
row_f=4;
colum_f=1;
end
y=sin(2*3.14*(row_f1(row_f)/fs)*N)+sin(2*3.14*(colum_f1(colum_f)/fs)*N);
temp=[temp y zeros(1,4000)]; // Append the Signal + zeros After each Number
end
plot(temp);
//sound(temp,fs);
wavwrite(temp, fs, 'C:\Users\user1/sound.wav')
plot(temp)
f=fft(temp)
scf()
plot(f)



// NUMBER DETECTION
clc 
clear
[thissound, fs]=wavread('C:\Users\user1\sound.wav');
L=length(thissound);
Y=fft(thissound);
L=length(Y)
f=(0:L-1)*(fs/L);
magnitude = abs(Y)
plot(f, magnitude)



// NUMBER DETECTION WITH MORE RESOLUTION
clc 
clear
[thissound, fs]=wavread('C:\Users\user1\sound.wav');
L=length(thissound);
Y=mtlb_fft(thissound, 64);
L=length(Y)
f=(0:L-1)*(fs/L);
magnitude = abs(Y)
plot(f, magnitude)


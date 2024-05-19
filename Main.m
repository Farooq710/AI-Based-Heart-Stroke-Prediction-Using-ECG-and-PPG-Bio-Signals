clear
close all
clc
%%100-109 and rec series ECG, Bidmc and ch series PPG
% ini1 = 1;
% ini2 = 1;
% for ini = 1:15
%     ini1
%%Loading of Datasets
%
[file1,path1] = uigetfile('*.*','Select Signal');
Name1 = [path1,file1];
load(Name1)
x = val(1,:);
%     ini2
[file2,path2] = uigetfile('*.*','Select Signal');
Name2 = [path2,file2];
load(Name2)
y = val(1,:);
filenma = str2num(file1(1));
if filenma == 1
filenm1 = str2num(file1(3));
else
filenm1a = str2num(file1(5));
    if filenm1a < 4
        filenm1 = filenm1a+10;
    else
        if filenm1a == 5
            filenm1 = filenm1a+9;
        else
            filenm1 = filenm1a+8;
        end
    end
end
kin1 = filenm1;

filenmb = file2(1);
if filenmb == 'b'
filenm2 = str2num(file2(7));
else
filenm2 = str2num(file2(5))+10;
end
kin2 = filenm2;
% load('slp01am.mat')
% z = val(1,:);
fs = 250;
tx = 0:(1/fs):(length(x)-1)/fs;
figure;
plot(tx,x);
xlabel('Time in Secs');
ylabel('Amplitude in mV');
title('ECG Signal');
ty = 0:(1/fs):(length(y)-1)/fs;
figure;
plot(ty,y);
xlabel('Time in Secs');
ylabel('Amplitude in mV');
title('PPG Signal');
% tz = 0:(1/fs):(length(z)-1)/fs;
% figure;
% plot(tz,z);
% xlabel('Time in Secs');
% ylabel('Amplitude in mV');
% title('ECG Signal');

%%Feature Extraction
%BPM calculation from ECG signal
[pks,locs] = findpeaks(x);
if kin1 >= 2 && kin1 <= 10
    bpm = length(pks)/6;
elseif kin1 < 2
    bpm = length(pks)/5;
else
    bpm = length(pks)/20;
end
% BPM(ini) = bpm;

%Heart rate from PPG signal
[pksp,locsp] = findpeaks(y,'MinPeakDistance',300);
% if ini <= 10
% hrt = length(pksp)*25;
if kin2 >= 4 && kin2 <= 10
    hrt = length(pksp)*25;
elseif kin2 < 4
    hrt = length(pksp)*35;
else
    hrt = length(pksp)*5;
end
% else
% hrt = length(pksp)*50;
% end
% HRT(ini) = hrt;
% ini1 = ini1+1;ini2 = ini2+1;
% end

% figure;
% findpeaks(y,'MinPeakDistance',300);

%%ANN Classification
%Training
%Features
load('BPM.mat')

%Labels
load('labels1.mat')

%Training with ECG Signals
input1 = BPM;
correct_Output1 = labels1;

Weight1 = 2*rand(1,1)-1;
for epoch = 1:10
    Weight1 = SGD_method(Weight1, input1, correct_Output1);
end

save('Trained_Network1.mat')
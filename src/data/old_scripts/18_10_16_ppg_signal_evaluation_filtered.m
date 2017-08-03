clear all; clc;

min_peak_dist = 250;

Fs = 500;
for i=1:length(files)
    outfilename = files{i}
    ppg = eval(outfilename);   
    ppg_filtered{i} = filtro_paso_banda(ppg,Fs,0.5,1.5);
end
save ppg_filtered ppg_filtered

load('ppg_filtered.mat') 

% A
HRV_tot=[];
for i=1:5
    ppg = ppg_filtered{i};   
    [pks,locs] = findpeaks(ppg,'MinPeakDistance',250,'MinPeakHeight',1);
    locs(pks<0) = [];
    HRV = diff(locs); 
    
    HRV_tot = [HRV_tot; HRV];
end

figure
subplot(6,1,1)
plot(HRV_tot)
ylim([200 800])
xlim([0 9000])

% B
HRV_tot=[];
for i=6:21
    ppg = ppg_filtered{i};   
    [pks,locs] = findpeaks(ppg,'MinPeakDistance',min_peak_dist);
    locs(pks<0) = [];
    HRV = diff(locs); 
    
    HRV_tot = [HRV_tot; HRV];
end

subplot(6,1,2)
plot(HRV_tot)
ylim([200 800])
xlim([0 9000])

% C
HRV_tot=[];
for i=22:37
    ppg = ppg_filtered{i};   
    [pks,locs] = findpeaks(ppg,'MinPeakDistance',min_peak_dist);
    locs(pks<0) = [];
    HRV = diff(locs); 
    
    HRV_tot = [HRV_tot; HRV];
end

subplot(6,1,3)
plot(HRV_tot)
ylim([200 1800])
xlim([0 9000])

% D
HRV_tot=[];
for i=38:40
    ppg = ppg_filtered{i};   
    [pks,locs] = findpeaks(ppg,'MinPeakDistance',min_peak_dist);
    locs(pks<0) = [];
    HRV = diff(locs); 
    
    HRV_tot = [HRV_tot; HRV];
end

subplot(6,1,4)
plot(HRV_tot)
ylim([200 800])
xlim([0 9000])

% E
HRV_tot=[];
for i=41:57
    ppg = ppg_filtered{i};   
    [pks,locs] = findpeaks(ppg,'MinPeakDistance',min_peak_dist);
    locs(pks<0) = [];
    HRV = diff(locs); 
    
    HRV_tot = [HRV_tot; HRV];
end

subplot(6,1,5)
plot(HRV_tot)
ylim([200 800])
xlim([0 9000])

% P
HRV_tot=[];
for i=58:59
    ppg = ppg_filtered{i};   
    [pks,locs] = findpeaks(ppg,'MinPeakDistance',min_peak_dist);
    locs(pks<0) = [];
    HRV = diff(locs); 
    
    HRV_tot = [HRV_tot; HRV];
end

subplot(6,1,6)
plot(HRV_tot)
ylim([200 800])
xlim([0 9000])


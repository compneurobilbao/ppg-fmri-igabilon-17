clear all; clc;

min_peak_dist = 250;
min_peak_high = 100;

load('data_raw_ppg.mat') 
files = who;

% A
HRV_tot=[];
for i=1:5
    outfilename=files{i}
    ppg = eval(outfilename);   
    [pks,locs] = findpeaks(ppg,'MinPeakDistance',min_peak_dist,'MinPeakHeight',min_peak_high);
    HRV = diff(locs); 
    
    all_idx = 1:length(HRV);
    outlier_idx = abs(HRV - median(HRV)) > 3*std(HRV); % Find outlier idx
    HRV(outlier_idx) = interp1(all_idx(~outlier_idx), HRV(~outlier_idx), all_idx(outlier_idx)); % Linearly interpolate over outlier idx for x

    
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
    outfilename=files{i}
    ppg = eval(outfilename);   
    [pks,locs] = findpeaks(ppg,'MinPeakDistance',min_peak_dist,'MinPeakHeight',min_peak_high);
    HRV = diff(locs); 
    
    all_idx = 1:length(HRV);
    outlier_idx = abs(HRV - median(HRV)) > 3*std(HRV); % Find outlier idx
    HRV(outlier_idx) = interp1(all_idx(~outlier_idx), HRV(~outlier_idx), all_idx(outlier_idx)); % Linearly interpolate over outlier idx for x
    
    HRV_tot = [HRV_tot; HRV];
end

subplot(6,1,2)
plot(HRV_tot)
ylim([200 800])
xlim([0 9000])

% C
HRV_tot=[];
for i=22:36
    outfilename=files{i}
    ppg = eval(outfilename);   
    [pks,locs] = findpeaks(ppg,'MinPeakDistance',min_peak_dist,'MinPeakHeight',min_peak_high);
    HRV = diff(locs); 
    
    all_idx = 1:length(HRV);
    outlier_idx = abs(HRV - median(HRV)) > 3*std(HRV); % Find outlier idx
    HRV(outlier_idx) = interp1(all_idx(~outlier_idx), HRV(~outlier_idx), all_idx(outlier_idx)); % Linearly interpolate over outlier idx for x
    
    HRV_tot = [HRV_tot; HRV];
end

subplot(6,1,3)
plot(HRV_tot)
ylim([200 800])
xlim([0 9000])

% D
HRV_tot=[];
for i=37:38
    outfilename=files{i}
    ppg = eval(outfilename);   
    [pks,locs] = findpeaks(ppg,'MinPeakDistance',min_peak_dist,'MinPeakHeight',min_peak_high);
    HRV = diff(locs); 
    
    all_idx = 1:length(HRV);
    outlier_idx = abs(HRV - median(HRV)) > 3*std(HRV); % Find outlier idx
    HRV(outlier_idx) = interp1(all_idx(~outlier_idx), HRV(~outlier_idx), all_idx(outlier_idx)); % Linearly interpolate over outlier idx for x
    
    HRV_tot = [HRV_tot; HRV];
end

subplot(6,1,4)
plot(HRV_tot)
ylim([200 800])
xlim([0 9000])

% E
HRV_tot=[];
for i=39:55
    outfilename=files{i}
    ppg = eval(outfilename);   
    [pks,locs] = findpeaks(ppg,'MinPeakDistance',min_peak_dist,'MinPeakHeight',min_peak_high);
    HRV = diff(locs); 
    
    all_idx = 1:length(HRV);
    outlier_idx = abs(HRV - median(HRV)) > 3*std(HRV); % Find outlier idx
    HRV(outlier_idx) = interp1(all_idx(~outlier_idx), HRV(~outlier_idx), all_idx(outlier_idx)); % Linearly interpolate over outlier idx for x
    
    HRV_tot = [HRV_tot; HRV];
end

subplot(6,1,5)
plot(HRV_tot)
ylim([200 800])
xlim([0 9000])

% P
HRV_tot=[];
for i=56:57
    outfilename=files{i}
    ppg = eval(outfilename);   
    [pks,locs] = findpeaks(ppg,'MinPeakDistance',min_peak_dist,'MinPeakHeight',min_peak_high);
    HRV = diff(locs); 
    
    all_idx = 1:length(HRV);
    outlier_idx = abs(HRV - median(HRV)) > 3*std(HRV); % Find outlier idx
    HRV(outlier_idx) = interp1(all_idx(~outlier_idx), HRV(~outlier_idx), all_idx(outlier_idx)); % Linearly interpolate over outlier idx for x
    
    HRV_tot = [HRV_tot; HRV];
end

subplot(6,1,6)
plot(HRV_tot)
ylim([200 800])
xlim([0 9000])

% age = [32.3 34.7 51.9 56.3 57.7 41.4 55.2 52 59.4 61.5 59.9 43.2 65.6 ...
% 61.9 69.4 55.3 56.6 57.3 57.6 68.6 42.9 51.8 55.8 61 57.6 66.8 61.6...
% 65.9 71.6 56.7 67 66.3 68.5 73.3 66 62 72.9 81.5 31.2 57.6 52 29.4...
% 35.6 55.3 50.1 57.1 54 59.7 67.9 65.3 35.8 36.8 34.7 61.7 70 40.7 73.1];
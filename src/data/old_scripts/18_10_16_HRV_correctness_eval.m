clear all; clc;

min_peak_dist = 250;
min_peak_high = 100;

load('data_raw_ppg.mat') 
files = who;



for i=38:59
    outfilename = files{i};
    ppg = eval(outfilename);   
    [pks,locs] = findpeaks(ppg,'MinPeakDistance',min_peak_dist,'MinPeakHeight',min_peak_high);
    HRV = diff(locs);
    
    
    all_idx = 1:length(HRV);
    outlier_idx = abs(HRV - median(HRV)) > 3*std(HRV); % Find outlier idx
    HRV(outlier_idx) = interp1(all_idx(~outlier_idx), HRV(~outlier_idx), all_idx(outlier_idx)); % Linearly interpolate over outlier idx for x


    figure
    subplot(2,1,1)
    plot(ppg)
    hold on
    plot(length(HRV),HRV,locs,pks,'o') 

    subplot(2,1,2)
    plot(HRV)
end


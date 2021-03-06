%% Created 02/08/2017 to generate HRV, HRV_HF and HRV_LF signals from data_raw_ppg.mat
% HF, from 0.15 to 0.4 Hz 
% LF , from 0.04 to 0.15 Hz 
% LF/HF ratio 
clear all; clc;

load('/home/asier/git/ppg-fmri-igabilon-17/data/raw/data_raw_ppg.mat') %select the ones that are available!! B07,B08...NO!
files = who;

min_peak_dist = 250;
min_peak_high = 100;
Fs = 1/2.1;



for i=1:length(files)
    outfilename=files{i} % prints the file we are analyzing
    ppg = eval(outfilename);   
    [pks,locs] = findpeaks(ppg,'MinPeakDistance',min_peak_dist,'MinPeakHeight',min_peak_high);
    HRV = diff(locs); 
    
    all_idx = 1:length(HRV);
    outlier_idx = abs(HRV - median(HRV)) > 3*std(HRV); % Find outlier idx
    HRV(outlier_idx) = interp1(all_idx(~outlier_idx), HRV(~outlier_idx), all_idx(outlier_idx)); % Linearly interpolate over outlier idx for x
    % HRV series filtering
           
    
    HRV_LF = filtro_paso_banda(HRV,Fs,0.04,0.15);
    HRV_HF = filtro_paso_banda(HRV,Fs,0.15,0.23);

    save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/HRV/', outfilename, '_HRV'), 'HRV')
    save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/HRV/', outfilename, '_HRV_LF'), 'HRV_LF')
    save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/HRV/', outfilename, '_HRV_HF'), 'HRV_HF')
end  


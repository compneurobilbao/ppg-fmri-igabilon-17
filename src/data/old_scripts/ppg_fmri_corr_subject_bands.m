clear all; clc;

load('data_raw_ppg.mat') %select the ones that are available!! B07,B08...NO!
files = who;

min_peak_dist = 250;
min_peak_high = 100;
Fs = 1/2.1;

for i=1:length(files)
    outfilename=files{i}
    ppg = eval(outfilename);   
    [pks,locs] = findpeaks(ppg,'MinPeakDistance',min_peak_dist,'MinPeakHeight',min_peak_high);
    HRV = diff(locs); 
    
    all_idx = 1:length(HRV);
    outlier_idx = abs(HRV - median(HRV)) > 3*std(HRV); % Find outlier idx
    HRV(outlier_idx) = interp1(all_idx(~outlier_idx), HRV(~outlier_idx), all_idx(outlier_idx)); % Linearly interpolate over outlier idx for x
    % HRV series filtering
           
    %load corresponding fmri in a variable called time-series
    load(strcat('/home/asier/Desktop/scanphysio_igabilon/data_fmri/',...
        outfilename,'/time_series.txt'));
    time_series = time_series';
    %downsampling
    resampled_HRV = resample(HRV,size(time_series,1),length(HRV));
    HRV_LF=filtro_paso_banda(resampled_HRV,Fs,0.04,0.15);
    HRV_HF=filtro_paso_banda(resampled_HRV,Fs,0.15,0.23);
    %correlation
    [brain_result_LF,pval] = corr(HRV_LF,time_series);
    [brain_result_HF,pval] = corr(HRV_HF,time_series);

    %brain_result_pval = brain_result;
    %brain_result_pval(pval>0.05) = 0;
    %save
    nii_base = load_nii('/home/asier/Desktop/scanphysio_igabilon/atlas_3000.nii');
    nii_result_LF = nii_base;
    nii_result_HF = nii_base;

    for i=1:max(nii_base.img(:))
        nii_result_LF.img(nii_base.img==i) = brain_result_LF(i);
        nii_result_HF.img(nii_base.img==i) = brain_result_HF(i);
    end
    save_nii(nii_result_LF, strcat('/home/asier/Desktop/scanphysio_igabilon/maps/LF/',outfilename,'.nii.gz'))     
    save_nii(nii_result_HF, strcat('/home/asier/Desktop/scanphysio_igabilon/maps/HF/',outfilename,'.nii.gz'))
end  





resampled_HRV
HRV_LF=filtro_paso_banda(resampled_HRV,Fs,0.04,0.15);
HRV_HF=filtro_paso_banda(resampled_HRV,Fs,0.15,0.23);

subplot(3,1,1)
plot(resampled_HRV)
title('HRV (resampled)')
subplot(3,1,2)
plot(HRV_LF)
title('HRV LF (0.04-0.15 Hz)')
subplot(3,1,3)
plot(HRV_HF)
title('HRV HF (0.15-0.23 Hz)')

plot(ppg)
title('PPG')



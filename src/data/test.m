clear all; clc;
%addtopath /nifti_tools

load('data_raw_ppg.mat') %select the ones that are available!! B07,B08...NO!
files = who;

cor_maps = zeros(57,2514);

for i=1:length(files)
    outfilename=files{i}
    ppg = eval(outfilename);   
    [pks,locs] = findpeaks(ppg,'MinPeakDistance',300);
    HRV = diff(locs); 
    % HRV series filtering
           
    %load corresponding fmri in a variable called time-series
    load(strcat('/home/asier/Desktop/scanphysio_igabilon/data_fmri/',...
        outfilename,'/time_series.txt'));
    time_series = time_series';
    %downsampling
    resampled_HRV = resample(HRV,size(time_series,1),length(HRV));
    
    %correlation
    [brain_result,pval] = corr(resampled_HRV,time_series);
    brain_result_pval = brain_result;
    brain_result_pval(pval>0.05) = 0;
   
    cor_maps(i,:) = brain_result_pval;
end

load('cor_maps.mat')

patients_corr = cor_maps([1:38,56,57],:);
controls_corr = cor_maps([39:55],:);

[H,P] = ttest2(patients_corr, controls_corr);

nii_base = load_nii('/home/asier/Desktop/scanphysio_igabilon/atlas_3000.nii');
nii_result = nii_base;
for i=1:max(nii_base.img(:))
    nii_result.img(nii_base.img==i) = H(i);
end
save_nii(nii_result, strcat('/home/asier/Desktop/scanphysio_igabilon/corr_map.nii.gz')) 


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

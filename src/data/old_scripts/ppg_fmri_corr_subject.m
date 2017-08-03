clear all; clc;


%addtopath /nifti_tools

load('data_raw_ppg.mat') %select the ones that are available!! B07,B08...NO!
files = who;

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
    %brain_result_pval = brain_result;
    %brain_result_pval(pval>0.05) = 0;
    %save
    nii_base = load_nii('/home/asier/Desktop/scanphysio_igabilon/atlas_3000.nii');
    nii_result = nii_base;
    for i=1:max(nii_base.img(:))
        nii_result.img(nii_base.img==i) = brain_result(i);
    end
    save_nii(nii_result, strcat('/home/asier/Desktop/scanphysio_igabilon/maps/raw/',outfilename,'.nii.gz')) 
end




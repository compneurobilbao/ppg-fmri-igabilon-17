clear all; clc;

load('/home/asier/git/ppg-fmri-igabilon-17/data/raw/subjects_name.mat');

HRV_path = strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/HRV/');

for i=1:length(files)
    outfilename = files{i} % prints the file we are analyzing
    
    load(strcat(HRV_path,  outfilename, '_HRV'));
    load(strcat(HRV_path,  outfilename, '_HRV_LF'));
    load(strcat(HRV_path,  outfilename, '_HRV_HF'));  
    
    [alpha_HRV, s, in, MSE, R2, S, is, f]= fastdfa(HRV);
    [alpha_HRV_LF, s, in, MSE, R2, S, is, f]= fastdfa(HRV_LF);
    [alpha_HRV_HF, s, in, MSE, R2, S, is, f]= fastdfa(HRV_HF);
    close all
    
    alpha_HRV_all(i) = alpha_HRV;
    alpha_HRV_LF_all(i) = alpha_HRV_LF;
    alpha_HRV_HF_all(i) = alpha_HRV_HF;

    save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/alpha/', outfilename, '_alpha_HRV'), 'alpha_HRV')
    save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/alpha/', outfilename, '_alpha_HRV_LF'), 'alpha_HRV_LF')
    save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/alpha/', outfilename, '_alpha_HRV_HF'), 'alpha_HRV_HF')
end  


save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/alpha/alpha_HRV_all'), 'alpha_HRV_all')
save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/alpha/alpha_HRV_LF_all'), 'alpha_HRV_LF_all')
save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/alpha/alpha_HRV_HF_all'), 'alpha_HRV_HF_all')

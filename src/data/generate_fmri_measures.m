clear all; clc;

load('/home/asier/git/ppg-fmri-igabilon-17/data/raw/subjects_name.mat');

fmri_path = strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/fmri/');

for i=1:length(files)
    outfilename = files{i} % prints the file we are analyzing
    
    load(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/raw/data_fmri/',...
        outfilename,'/time_series.txt'));
    time_series = time_series';

    mean_fmri = mean(time_series)';
    std_fmri = std(time_series)';
    energy_fmri = calc_energy(time_series)';
    pp_fmri = point_process(time_series)';
    
    mean_fmri_all(:,i) = mean_fmri;
    std_fmri_all(:,i) = std_fmri;
    energy_fmri_all(:,i) = energy_fmri;
    pp_fmri_all(:,i) = pp_fmri;

%     save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/fmri/', outfilename, '_mean'), 'mean_fmri')
%     save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/fmri/', outfilename, '_std'), 'std_fmri')
%     save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/fmri/', outfilename, '_energy'), 'energy_fmri')
%     save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/fmri/', outfilename, '_pp'), 'pp_fmri')
end  


save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/fmri/mean_all'), 'mean_fmri_all')
save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/fmri/std_all'), 'std_fmri_all')
save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/fmri/energy_all'), 'energy_fmri_all')
save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/fmri/pp_all'), 'pp_fmri_all')

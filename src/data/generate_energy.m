clear all; clc;

load('/home/asier/git/ppg-fmri-igabilon-17/data/raw/subjects_name.mat');

HRV_path = strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/HRV/');

for i=1:length(files)
    outfilename = files{i} % prints the file we are analyzing
    
    load(strcat(HRV_path,  outfilename, '_HRV'));
    load(strcat(HRV_path,  outfilename, '_HRV_LF'));
    load(strcat(HRV_path,  outfilename, '_HRV_HF'));

    energy_HRV = calc_energy(HRV);
    energy_HRV_LF = calc_energy(HRV_LF);
    energy_HRV_HF = calc_energy(HRV_HF);
    
    energy_HRV_all(i) = energy_HRV;
    energy_HRV_LF_all(i) = energy_HRV_LF;
    energy_HRV_HF_all(i) = energy_HRV_HF;

    save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/energy/', outfilename, '_energy_HRV'), 'energy_HRV')
    save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/energy/', outfilename, '_energy_HRV_LF'), 'energy_HRV_LF')
    save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/energy/', outfilename, '_energy_HRV_HF'), 'energy_HRV_HF')
end  


save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/energy/energy_HRV_all'), 'energy_HRV_all')
save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/energy/energy_HRV_LF_all'), 'energy_HRV_LF_all')
save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/energy/energy_HRV_HF_all'), 'energy_HRV_HF_all')

clear all; clc;
addpath('/home/asier/matlab/NIfTI_tools')


load(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/alpha/alpha_HRV_all'))
y = alpha_HRV_all

% save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/energy/energy_HRV_LF_all'), 'energy_HRV_LF_all')
% save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/energy/energy_HRV_HF_all'), 'energy_HRV_HF_all')
% save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/alpha/alpha_HRV_all'), 'energy_HRV_HF_all')
% save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/alpha/alpha_HRV_LF_all'), 'energy_HRV_HF_all')
% save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/alpha/alpha_HRV_HF_all'), 'energy_HRV_HF_all')


load(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/fmri/mean_all'))
X = mean_fmri_all
% save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/fmri/std_all'), 'std_fmri_all')
% save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/fmri/energy_all'), 'energy_fmri_all')
% save(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/fmri/pp_all'), 'pp_fmri_all')




X_pat = X(:,[1:38,56,57]);
X_con = X(:,[39:55]);

y_pat = y([1:38,56,57]);
y_con = y([39:55]);

[weigths,dev,stats] = glmfit(X_pat',y_pat);

[weigths,dev,stats] = glmfit(X_con',y_con);


% mdl = fitglm(X',y');

g = stats.p;
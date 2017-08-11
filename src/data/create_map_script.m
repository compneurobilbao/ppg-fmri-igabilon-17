clear all; clc;

load(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/fmri/mean_all'))
load(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/fmri/std_all'))
load(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/fmri/energy_all'))
load(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/fmri/pp_all'))

%% X
% mean_fmri_all
% std_fmri_all
% energy_fmri_all
% pp_fmri_all

load(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/energy/energy_HRV_all'))
load(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/energy/energy_HRV_LF_all'))
load(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/energy/energy_HRV_HF_all'))
load(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/alpha/alpha_HRV_all'))
load(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/alpha/alpha_HRV_LF_all'))
load(strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/alpha/alpha_HRV_HF_all'))

%% y
% energy_HRV_LF_all
% energy_HRV_HF_all
% energy_HRV_HF_all
% energy_HRV_HF_all
% energy_HRV_HF_all


pat_control_comp( mean_fmri_all, energy_HRV_all, 'mean' , 'energy')
pat_control_comp( mean_fmri_all, energy_HRV_LF_all, 'mean' , 'energy_LF')
pat_control_comp( mean_fmri_all, energy_HRV_HF_all, 'mean' , 'energy_HF')
pat_control_comp( mean_fmri_all, alpha_HRV_all, 'mean' , 'alpha')
pat_control_comp( mean_fmri_all, alpha_HRV_LF_all, 'mean' , 'alpha_LF')
pat_control_comp( mean_fmri_all, alpha_HRV_HF_all, 'mean' , 'alpha_HF')
pat_control_comp( std_fmri_all, energy_HRV_all, 'std', 'energy')
pat_control_comp( std_fmri_all, energy_HRV_LF_all, 'std', 'energy_LF')
pat_control_comp( std_fmri_all, energy_HRV_HF_all, 'std', 'energy_HF')
pat_control_comp( std_fmri_all, alpha_HRV_all, 'std', 'alpha')
pat_control_comp( std_fmri_all, alpha_HRV_LF_all, 'std', 'alpha_LF')
pat_control_comp( std_fmri_all, alpha_HRV_HF_all, 'std', 'alpha_HF')
pat_control_comp( energy_fmri_all, energy_HRV_all, 'energy', 'energy')
pat_control_comp( energy_fmri_all, energy_HRV_LF_all, 'energy', 'energy_LF')
pat_control_comp( energy_fmri_all, energy_HRV_HF_all, 'energy', 'energy_HF')
pat_control_comp( energy_fmri_all, alpha_HRV_all, 'energy', 'alpha')
pat_control_comp( energy_fmri_all, alpha_HRV_LF_all, 'energy', 'alpha_LF')
pat_control_comp( energy_fmri_all, alpha_HRV_HF_all, 'energy', 'alpha_HF')
pat_control_comp( pp_fmri_all, energy_HRV_all, 'pp' , 'energy')
pat_control_comp( pp_fmri_all, energy_HRV_LF_all, 'pp' , 'energy_LF')
pat_control_comp( pp_fmri_all, energy_HRV_HF_all, 'pp' , 'energy_HF')
pat_control_comp( pp_fmri_all, alpha_HRV_all, 'pp' , 'alpha')
pat_control_comp( pp_fmri_all, alpha_HRV_LF_all, 'pp' , 'alpha_LF')
pat_control_comp( pp_fmri_all, alpha_HRV_HF_all, 'pp' , 'alpha_HF')

function pat_control_comp( X, y, X_name, y_name )
%PAT_CONTROL_COMP Summary of this function goes here
%   Detailed explanation goes here
addpath('/home/asier/matlab/NIfTI_tools')


X_pat = X(:,[1:38,56,57]);
X_con = X(:,[39:55]);

y_pat = y([1:38,56,57]);
y_con = y([39:55]);

[H_y,P_y] = ttest2(y_pat, y_con);
[H_X,P_X] = ttest2(X_pat(:), X_con(:));


result_pat = generate_map( X_pat, y_pat );
result_con = generate_map( X_con, y_con );

nii_base = load_nii('/home/asier/git/ppg-fmri-igabilon-17/data/raw/atlas_3000.nii');
nii_result = nii_base;

nii_result.img = result_pat;
save_nii(nii_result, strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/maps/', ...
    'pat_fmri_', X_name, '_ppg_', y_name,'.nii'))

nii_result.img = result_con;
save_nii(nii_result, strcat('/home/asier/git/ppg-fmri-igabilon-17/data/processed/maps/', ...
    'con_fmri_', X_name, '_ppg_', y_name,'.nii'))

fileID = fopen('/home/asier/git/ppg-fmri-igabilon-17/data/processed/ttest_results.txt','a');
line =  strcat('PPG_', y_name ,' H: ', num2str(H_y),' P: ', num2str(P_y),'   \n',...
               'fMRI_', X_name ,' H: ', num2str(H_X),' P: ', num2str(P_X),'   \n');
fprintf(fileID,line);
fclose(fileID);

end

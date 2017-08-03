
files = dir('C:\Users\erramuzp\Desktop\scanphysio_igabilon\maps_randomise\*.nii.gz');
for file = files'
    outfilename=file.name(1:end-4)
    
    nii = load_nii(strcat('C:\Users\erramuzp\Desktop\scanphysio_igabilon\maps_randomise\',file.name));
    
    nii_result = nii;
    nii_result.img(nii.img>0.05) = 1;
    nii_result.img(nii.img==0) = 1;
    nii_result.img = 1 - nii_result.img; 
    
    
    %

    for i=1:max(nii.img(:))
        nii_result_LF.img(nii_base.img==i) = brain_result_LF(i);
    end
    save_nii(nii_result_LF, strcat('C:\Users\erramuzp\Desktop\scanphysio_igabilon\maps\LF\',outfilename,'.nii.gz'))     
    save_nii(nii_result_HF, strcat('C:\Users\erramuzp\Desktop\scanphysio_igabilon\maps\HF\',outfilename,'.nii.gz'))

end
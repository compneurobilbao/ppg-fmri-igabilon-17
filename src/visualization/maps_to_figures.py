from nilearn import image
from nilearn import plotting as plt
import matplotlib.pyplot
import nibabel as nib
import os
import numpy as np


os_path = '/home/asier/git/ppg-fmri-igabilon-17'
input_path = os.path.join(os_path, 'data', 'processed', 'maps')
output_path = os.path.join(os_path, 'reports', 'maps')

for file in os.listdir(input_path):
    if file.endswith(".nii"):
        statmap = nib.load(os.path.join(input_path, file))

        plt.plot_glass_brain(statmap, threshold=0, colorbar=True,
                             cmap=matplotlib.pyplot.cm.autumn,
                             display_mode='lyrz',
                             output_file=os.path.join(input_path, file) + '.png')
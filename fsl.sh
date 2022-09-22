#!/bin/bash

# This is the main file run by the brainlife.io orchestration system
# Author: Hanna Willis & Giulia Bertò

# input configs
lesion=`jq -r '.lesion' config.json`
roi=`jq -r '.roi' config.json`

# make output directory
mkdir -p out_dir

# use fslmaths to mask lesion by roi 

echo "mask lesion by roi"
fslmaths $lesion -mas $roi out_dir/roi_lesion_mask.nii.gz

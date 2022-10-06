#!/bin/bash

# This is the main file run by the brainlife.io orchestration system
# Author: Hanna Willis & Brad Caron

set -x
set -e

# Set up directory 
rois_1_loc=`jq -r '.rois_1_loc' config.json`
rois_2_loc=`jq -r '.rois_2_loc' config.json`

# Set up ROI of interest
roi_1=`jq  -r '.roi_1' config.json`
roi_2=`jq -r '.roi_2' config.json`

# Set up function (i.e. sub,add,mul or mas)
function=`jq -r '.function' config.json`

# Set up output name
output_roi_name=`jq -r '.output_roi_name' config.json`

# Make directories for output directories 
mkdir output output/rois

# Copy over ROIs into output directory 
cp -r ${rois_1_loc}/${roi_1}.nii.gz ${rois_2_loc}/${roi_2}.nii.gz ./output/rois

roi1=./output/rois/${roi_1}.nii.gz
roi2=./output/rois/${roi_2}.nii.gz

# Run fslmaths command
fslmaths ${roi1} -${function} ${roi2} ./output/rois/${output_roi_name}.nii.gz


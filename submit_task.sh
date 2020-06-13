#!/bin/bash -l
#
# Usage: gputest.sh
# Change job name and email address as needed 
#        
# -- our name ---
#SBATCH -J gat
#SBATCH -o gat.output

# partition
#SBATCH -p xye 
# to request a GPU
#SBATCH --gres=gpu:1

Request an amount of RAM for the job
#SBATCH --mem=32G #32GB requested.
# Run on 1 node
#SBATCH --nodes=1
# Use 1 CPU
#SBATCH --ntasks-per-node=2 

/bin/echo Running on host: `hostname`.
/bin/echo In directory: `pwd`
/bin/echo Starting on: `date`
 
# Load CUDA module
module load singularity
module load cuda
#This is an example command

singularity exec --nv docker://divyachandana/kerasyolo:latest python ./yolo_RS_1.py

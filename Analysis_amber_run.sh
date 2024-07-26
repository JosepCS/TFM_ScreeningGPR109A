#!/bin/bash -l

#SBATCH --nodes=1                          # number of nodes
#SBATCH --ntasks=4                         # number of tasks
#SBATCH --ntasks-per-node=4                # number of tasks per node
#SBATCH --gpus-per-task=1                  # number of gpu per task
#SBATCH --cpus-per-task=1                  # number of cores per task
#SBATCH --time=24:00:00                     # time (HH:MM:SS)
#SBATCH --partition=gpu                    # partition
#SBATCH --account=p200417                  # project account
#SBATCH --qos=default                      # SLURM qos

module load netCDF-Fortran/4.6.1-gompi-2023a

/project/home/p200417/AMBER/amber24/bin/cpptraj -i analysis.in

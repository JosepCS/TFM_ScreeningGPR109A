#!/bin/bash -l

#SBATCH --nodes=2                          # number of nodes
#SBATCH --ntasks=8                         # number of tasks
#SBATCH --ntasks-per-node=4                # number of tasks per node
#SBATCH --gpus-per-task=1                  # number of gpu per task
#SBATCH --cpus-per-task=1                  # number of cores per task
#SBATCH --time=5:00:00                     # time (HH:MM:SS)
#SBATCH --partition=gpu                    # partition
#SBATCH --account=p200417                  # project account
#SBATCH --qos=default                      # SLURM qos

module load env/staging/2023.1
module load foss/2023a
module load CUDA/12.1.1

module load AutoDock-GPU/1.5.3-GCC-12.3.0-CUDA-12.1.1

autodock_gpu \
    --lfile /project/home/p200417/GYPSUM/8ija_editSPLL_NIO.pdbqt \
    --ffile /project/home/p200417/GYPSUM/8ija_editSPLL_protein.maps.fld \
    --gbest 1 \
    --clustering 1 

mv /home/users/u101702/best.pdbqt /project/home/p200417/GYPSUM/BEST/best_NIO.pdbqt

for ((XX=1; XX<=1181; XX++)); do

for ((YY=1; YY<=5; YY++)); do

autodock_gpu \
    --lfile /project/home/p200417/GYPSUM/Gypsum_8ija_${XX}_var${YY}/untitled_line_${XX}__input${XX}__variant${YY}.pdbqt \
    --ffile /project/home/p200417/GYPSUM/Gypsum_8ija_${XX}_var${YY}/8ija_editSPLL_protein.maps.fld \
    --gbest 1 \
    --clustering 1 

mv /home/users/u101702/best.pdbqt /project/home/p200417/GYPSUM/BEST/best_${XX}_var${YY}.pdbqt

done

done





























#!/bin/bash

#SBATCH --job-name=16_workers_2_steps
#SBATCH --nodes=17
#SBATCH --ntasks-per-node=1
#SBATCH --output=16_workers_2_steps.out
#SBATCH --error=16_workers_2_steps.error
#SBATCH --cpus-per-task=1
#SBATCH --time=02:00:00

use_cuda='false'
workers=8
opt='adam'
num_proc=17 # number of processors, must be equal to #SBATCH --nodes
out_file=log-$num_proc-$use_cuda-$workers-$opt

module load openmpi/intel/2.0.3
module load cuda/9.2.88

mpirun -np $num_proc python  lab4_ppo208.py --steps 2 --data_path '/scratch/gd66/spring2019/lab4/kaggleamazon/' --disable_cuda  --workers $workers

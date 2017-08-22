#!/bin/bash

#PBS -N pmm-OpenMP
#PBS -q ac

echo "Id$PBS_O_WORKDIR usuario de trabajo: $PBS_O_LOGNAME" 
echo "Id$PBS_O_WORKDIR de trabajo: $PBS_JOBID" 
echo "Nombre del trabajo dado por el usuario: $PBS_JOBNAME" 
echo "Nodo que ejecuta qsub: $PBS_O_HOST" 
echo "Directorio en el que se ha ejecutado qsub: $PBS_O_WORKDIR" 
echo "Cola: $PBS_QUEUE" 
echo "Nodos asignados al trabajo: " 
cat $PBS_NODEFILE

echo "Paralelo 2 threads"
export OMP_NUM_THREADS=2

$PBS_O_WORKDIR/pmm-OpenMP 100
$PBS_O_WORKDIR/pmm-OpenMP 500
$PBS_O_WORKDIR/pmm-OpenMPl 1000
$PBS_O_WORKDIR/pmm-OpenMP 1500

echo "Paralelo 4 threads"
export OMP_NUM_THREADS=4

$PBS_O_WORKDIR/pmm-OpenMP 100
$PBS_O_WORKDIR/pmm-OpenMP 500
$PBS_O_WORKDIR/pmm-OpenMP 1000
$PBS_O_WORKDIR/pmm-OpenMP 1500

echo "Paralelo 6 threads"
export OMP_NUM_THREADS=6

$PBS_O_WORKDIR/pmm-OpenMP 100
$PBS_O_WORKDIR/pmm-OpenMP 500
$PBS_O_WORKDIR/pmm-OpenMP 1000
$PBS_O_WORKDIR/pmm-OpenMP 1500

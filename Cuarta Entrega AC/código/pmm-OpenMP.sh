#!/bin/bash

echo "Paralelo 2 threads"
export OMP_NUM_THREADS=2

./pmm-OpenMP 100
./pmm-OpenMP 500
./pmm-OpenMP 1000
./pmm-OpenMP 1500

echo "Paralelo 4 threads"
export OMP_NUM_THREADS=4

./pmm-OpenMP 100
./pmm-OpenMP 500
./pmm-OpenMP 1000
./pmm-OpenMP 1500

echo "Paralelo 6 threads"
export OMP_NUM_THREADS=6

./pmm-OpenMP 100
./pmm-OpenMP 500
./pmm-OpenMP 1000
./pmm-OpenMP 1500

#!/bin/bash


echo "Código normal. Optimización -O2"
gcc -O2 pmm-secuencial.c -o secuencial
./secuencial 500


echo "-----------------------------------------------"


echo "Código optimizado A. Optimización -O2"
gcc -O2 pmm-secuencialModificadoA.c -o modificadoA
./modificadoA 500


echo "-----------------------------------------------"


echo "Código optimizado B. Optimización -O2"
gcc -O2 pmm-secuencialModificadoB.c -o modificadoB
./modificadoB 500



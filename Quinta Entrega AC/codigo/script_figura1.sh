#!/bin/bash

echo "Código normal. Optimización -O2"
gcc -O2 figura1-original.c -o original
./original 500

gcc -S -O2 figura1-original.c -o figura1-original.s

echo "-----------------------------------------------"


echo "Código optimizado A. Optimización -O2"
gcc -O2 figura1-modificado_a.c -o modificadoA
./modificadoA

gcc -S -O2 figura1-modificado_a.s -o figura1-modificado_a.s


echo "-----------------------------------------------"

echo "Código optimizado B. Optimización -O2"
gcc -O2 figura1-modificado_b.c -o modificadoB
./modificadoB

gcc -S -O2 figura1-modificado_b.c -o figura1-modificado_b.s






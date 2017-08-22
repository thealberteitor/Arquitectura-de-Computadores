echo "Optimización -O0"
gcc -O0 daxpy.c -o daxpy
./daxpy

gcc -S -O0 daxpy.c -o daxpyO0.s



echo "----------------------------"



echo "Optimización -O2"
gcc -O2 daxpy.c -o daxpy
./daxpy

gcc -S -O2 daxpy.c -o daxpyO2.s



echo "............................"



echo "Optimización -O3"
gcc -O3 daxpy.c -o daxpy
./daxpy

gcc -S -O3 daxpy.c -o daxpyO3.s

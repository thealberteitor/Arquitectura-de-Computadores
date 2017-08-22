#include <stdio.h>
#include <time.h>
#include <stdlib.h>


int main(int argc, char *argv[]){

    double N=100000000; //Tamaño del vector
    double a = 10; //Constante
    double *x, *y;
    register int i;

    srand (time(NULL));

    x = (double*) malloc(N*sizeof(double));
    y = (double*) malloc(N*sizeof(double));


    for (i=0; i<N; i++){
        x[i] = rand()%1000;
        y[i] = rand()%1000;
    }

    struct timespec cgt1,cgt2; double ncgt;

    clock_gettime(CLOCK_REALTIME,&cgt1);
    //Benchmark Linpack
    for (i=0; i<N; i++)
        y[i] += a*x[i];

    clock_gettime(CLOCK_REALTIME,&cgt2);

    ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+( double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

    printf("Tamaño: %f", N);
    printf("\nTiempo (seg.) = %11.9f\n", ncgt);

    free(x);
    free(y);

    return 0;
}

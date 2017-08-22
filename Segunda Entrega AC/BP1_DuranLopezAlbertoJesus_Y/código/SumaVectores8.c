#include <stdlib.h> //atoi(), malloc() y free()
#include <stdio.h> //printf()
#include <time.h> //clock_gettime()
#include <omp.h>//biblioteca omp

#define PRINTF_ALL // comentar para quitar el printf ...
#define MAX 33554432 //=2^25

double v1[MAX], v2[MAX], v3[MAX];
int main(int argc, char** argv) {
    int i;
    double ncgt, cgt1,cgt2;


    if (argc<2) {
        printf("Faltan no componentes del vector\n");
        exit(-1);
    }
    unsigned int N = atoi(argv[1]); // Máximo N =2^32-1
#ifdef VECTOR_GLOBAL
    if (N>MAX) N=MAX;
#endif

    //Inicializar vectores
        #pragma omp parallel private(i)
        {
                #pragma omp sections
                {
                        #pragma omp section
                        for(i=0; i<N/4; i++)
                        {
                                v1[i] = N*0.1+i*0.1;
                                v2[i] = N*0.1-i*0.1;
                        }

                        #pragma omp section
                        for(i=N/4; i<N/2; i++)
                        {
                                v1[i] = N*0.1+i*0.1;
                                v2[i] = N*0.1-i*0.1;
                        }

                        #pragma omp section
                        for(i=N/2; i<3*N/4; i++)
                        {
                                v1[i] = N*0.1+i*0.1;
                                v2[i] = N*0.1-i*0.1;
                        }

                        #pragma omp section
                        for(i=3*N/4; i<N; i++)
                        {
                                v1[i] = N*0.1+i*0.1;
                                v2[i] = N*0.1-i*0.1;
                        }
                }

                #pragma omp single
                {
                        cgt1 = omp_get_wtime();
                }

                //Calcular suma de vectores
                #pragma omp sections
                {
                        // Dividimos las iteraciones for de forma manual en 4 pedazos
                        #pragma omp section
                        for(i=0; i<N/4; i++)
                                v3[i] = v1[i] + v2[i];

                        #pragma omp section
                        for(i=N/4; i<N/2; i++)
                                v3[i] = v1[i] + v2[i];

                        #pragma omp section
                        for(i=N/2; i<3*N/4; i++)
                                v3[i] = v1[i] + v2[i];

                        #pragma omp section
                        for(i=3*N/4; i<N; i++)
                                v3[i] = v1[i] + v2[i];

                }

                #pragma omp single
                {
                        cgt2 = omp_get_wtime();
                }
        }
        ncgt = cgt2-cgt1;

    //Imprimir resultado de la suma y el tiempo de ejecución
#ifdef PRINTF_ALL
    printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\n",ncgt,N);
    for(i=0; i<N; i++)
        printf("/ V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n",i,i,i,v1[i],v2[i],v3[i]);
#else
    printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\t/ V1[0]+V2[0]=V3[0](%8.6f+%8.6f=%8.6f) / /V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n",ncgt,N,v1[0],v2[0],v3[0],N-1,N-1,N-1,v1[N-1],v2[N-1],v3[N-1]);
#endif

    return 0;
}

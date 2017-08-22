#include <stdlib.h> //atoi(), malloc() y free()
#include <stdio.h> //printf()
#include <time.h> //clock_gettime()
#include <omp.h>//biblioteca omp

//#define PRINTF_ALL // comentar para quitar el printf
#define MAX 33554432

double v1[MAX], v2[MAX], v3[MAX];
int main(int argc, char** argv) {
    int i;
    //Diferencia de tiempo entre el inicio y el final
    double dif;
    double inicio, final;

    if (argc<2) {
        printf("Faltan indicar componentes del vector\n");
        exit(-1);
    }

    unsigned int num = atoi(argv[1]); // Máximo N =2^32-1

    #ifdef VECTOR_GLOBAL
    if (num>MAX)
      num=MAX;
	  #endif

    //Inicializar vectores
    #pragma omp parallel for
    for(i=0; i<num; i++) {
        v1[i] = num*0.1+i*0.1;
        v2[i] = num*0.1-i*0.1;
    }

    inicio=omp_get_wtime();

	  //Calcular suma de vectores
    #pragma omp parallel for
    for(i=0; i<num; i++)
        v3[i] = v1[i] + v2[i];

    final=omp_get_wtime();
    //Calculamos el tiempo (end-start)
    dif=final-inicio;

    //Imprimir resultado de la suma y el tiempo de ejecución
    #ifdef PRINTF_ALL
    printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\n",dif,num);
    for(i=0; i<num; i++)
        printf("/ V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n", i,i,i,v1[i],v2[i],v3[i]);
	  #else
    printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\t/ V1[0]+V2[0]=V3[0](%8.6f+%8.6f=%8.6f) / /V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n",dif,num,v1[0],v2[0],v3[0],num-1,num-1,num-1,v1[num-1],v2[num-1],v3[num-1]);
	  #endif

    return 0;
}

// gcc -O2 -fopenmp pmv-secuencia.lc -o globales
#include <stdlib.h>
#include <stdio.h>

#ifdef _OPENMP
  #include <omp.h>
#else
  #define omp_get_thread_num() 0
  #define omp_get_num_threads() 1
#endif

#define MAX 1000

int main(int argc, char** argv)
{
  double time1, time2, diferencia;
  int i, j;

  if (argc<2){
    printf("Introduzca tamaño de la matriz y vector\n");
    exit(-1);
  }

  unsigned int N = atoi(argv[1]);

  if(N>MAX)
     N=MAX;

  double vector1[MAX], vector2[MAX], datos[MAX][MAX];

  //Inicializamos
  for (i=0; i<N; i++)
  {
    vector1[i] = i;
    vector2[i] = 0;
    for(j=0;j<N;j++)
      datos[i][j] = i+j;
  }

  time1 = omp_get_wtime();

  //Calcular v2
  for (i=0; i<N; i++){
    for(j=0;j<N; j++)
      vector2[i] += datos[i][j] * vector1[j];
  }

  time2 = omp_get_wtime();

  //Calculamos la diferencia
  diferencia = time2 - time1;

  printf("Tiempo(seg.):%f\t / Tamaño:%u\t/ V2[0]=%f V2[%d]=%f\n", diferencia,N,vector2[0],N-1,vector2[N-1]);

  //Imprimimos los componentes si es un tamaño pequeño
  if (N<12)
    for (i=0; i<N;i++)
      printf(" V2[%d]=%f\n", i, vector2[i]);


  return 0;
}

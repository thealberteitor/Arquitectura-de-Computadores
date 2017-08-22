#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#define MAX 3000

int **matrizA, **matrizB, **matrizC;

int main(int argc, char** argv)
{
  int i, j, k;
  int valor;
  int suma=0;

  if (argc<2){
    printf("Introduzca tamaño de la matriz\n");
    exit(-1);
  }

  int N = atoi(argv[1]);

  if(N>MAX)
     N=MAX;

  matrizA=(int **)malloc(N*sizeof(int*));
  matrizB=(int **)malloc(N*sizeof(int*));
  matrizC=(int **)malloc(N*sizeof(int*));

  for(i=0; i<N; i++){
    matrizA[i]=(int*)malloc(N*sizeof(int));
    matrizB[i]=(int*)malloc(N*sizeof(int));
    matrizC[i]=(int*)malloc(N*sizeof(int));
  }

  srand (time(NULL));

  for (i=0; i<N; i++){
    for(j=0; j<N; j++){
      valor=rand() % 1000; //Número aleatorio entre 0 y 999
      matrizA[i][j]=valor;
      matrizB[j][i]=valor;
    }
  }


  struct timespec cgt1,cgt2; double ncgt;

  clock_gettime(CLOCK_REALTIME,&cgt1);

  //Calculamos el producto de las matrices
  for (i=0; i<N; i++){
    for(j=0; j<N; j++){
        for (k=0; k<N; k++){
          matrizC[i][j]+= matrizA[i][k]*matrizB[k][j];
	       }
    }
  }

  clock_gettime(CLOCK_REALTIME,&cgt2);

  //Calculamos la diferencia
  ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+( double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));


  printf("Tiempo(seg.):%f\t / Tamaño:%u\t/ \n", ncgt, N);

  //Liberamos memoria
  for(i=0; i<N; i++){
    free(matrizA[i]);
    free(matrizB[i]);
    free(matrizC[i]);
  }

  free(matrizA);
  free(matrizB);
  free(matrizC);

  return 0;
}

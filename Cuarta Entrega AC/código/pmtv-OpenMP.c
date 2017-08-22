#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <omp.h>

int main(int argc, char **argv){
	int i, j;
	int N;
	int suma=0;

	int *vector;
	int **matriz;
	int *resultado;

	if (argc < 2){
		printf("Falta el número de componentes\n");
		return(-1);
	}

	N = atoi(argv[1]);

  //Reservamos memoria para los vectores y la matriz
	vector = (int *)malloc(N * sizeof(int));
	resultado = (int *)malloc(N * sizeof(int));
	matriz = (int **)malloc(N * sizeof(int *));

	for (i=0; i<N; i++){
		matriz[i] = (int *)malloc(N * sizeof(int));
	}

  //Inicializamos matriz  y vector
	for (i=0; i<N; i++){
		for (j=0; j<N;j++){
			if (i>j)
				matriz[i][j] = 0;
			else
				matriz[i][j] = j*i;
		}
		vector[i] = j;
	}

  struct timespec cgt1,cgt2; double ncgt;

  clock_gettime(CLOCK_REALTIME,&cgt1);

  //Multiplicamos la matriz por el vector
  #pragma omp parallel for private(j) schedule(runtime)
	for (i=0; i<N; i++){
		suma=0;
		for (j=0; j<N; j++){
			suma+=(matriz[i][j]*vector[i]);
		}
		resultado[i] = suma;
	}

  clock_gettime(CLOCK_REALTIME,&cgt2);

	ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+( double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

  //Resultados
  printf("Tiempo: %f\n", ncgt);
	printf ("Componente(0,0): %d\n",resultado[0]);
	printf ("Componente (%d,%d): %d\n",N-1,N-1,resultado[N-1]);

  for(i=0; i<N; i++)
    free(matriz[i]);
  free(matriz);
  free(resultado);
  free(vector);

  return 0;
}

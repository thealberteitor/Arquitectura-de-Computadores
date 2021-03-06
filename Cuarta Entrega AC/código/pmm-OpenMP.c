#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include<omp.h>

int main(int argc, char **argv){
	int i, j, k;
	int N;
	int suma=0;

	int **matrizB;
	int **matrizC;
	int **matrizA;

	if (argc < 2){
		printf("Falta el número de componentes\n");
		return(1);
	}

	N = atoi(argv[1]);

	//Reservamos memoria
	matrizB = (int **)malloc(N * sizeof(int*));
	matrizC = (int **)malloc(N * sizeof(int*));
	matrizA = (int **)malloc(N * sizeof(int*));

	for (i=0; i<N; i++){
		matrizB[i] = (int *)malloc(N * sizeof(int));
		matrizC[i] = (int *)malloc(N * sizeof(int));
		matrizA[i] = (int *)malloc(N * sizeof(int));
	}

	//Inicializamos las matrices
  #pragma omp parallel for private(j)
	for (i=0; i<N; i++){
		for (j=0; j<N; j++){
			matrizB[i][j] = j+i;
			matrizC[i][j] = j*i;
		}
	}

	struct timespec cgt1,cgt2; double ncgt;

  clock_gettime(CLOCK_REALTIME,&cgt1);

	//Multiplicación de matrices
  #pragma omp parallel for private(k,j)
	for (i=0; i<N; i++){
		for(j=0; j<N; j++){
			suma = 0;
			for (k=0; k<N; k++){
				suma += (matrizB[i][k]*matrizC[k][j]);
			}
			matrizA[i][j]=suma;
		}
	}

	clock_gettime(CLOCK_REALTIME,&cgt2);

	ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+( double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

	//Resultados
	printf("Tiempo: %f\n", ncgt);
	printf ("Componente(0,0): %d\n",matrizA[0][0]);
	printf ("Componente(%d,%d): %d\n",N-1, N-1, matrizA[N-1][N-1]);

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

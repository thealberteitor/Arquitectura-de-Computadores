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

  if(N%10!=0) {
   fprintf(stderr,"Num debe ser divisible entre 10\n");
   exit(-1);
 }

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

  int t0,t1,t2,t3,t4,t5,t6,t7,t8,t9;

  struct timespec cgt1,cgt2; double ncgt;

  clock_gettime(CLOCK_REALTIME,&cgt1);

  //Calculamos el producto de las matrices
  for (i=0; i<N; i++){
    for(j=0; j<N; j++){
        t0=t1=t2=t3=t4=t5=t6=t7=t8=t9=0;
        for (k=0; k<N; k+=10){
          t0+=matrizA[i][k]*matrizB[k][j];
          t1+=matrizA[i][k+1]*matrizB[k+1][j];
          t2+=matrizA[i][k+2]*matrizB[k+2][j];
          t3+=matrizA[i][k+3]*matrizB[k+3][j];
          t4+=matrizA[i][k+4]*matrizB[k+4][j];
          t5+=matrizA[i][k+5]*matrizB[k+5][j];
          t6+=matrizA[i][k+6]*matrizB[k+6][j];
          t7+=matrizA[i][k+7]*matrizB[k+7][j];
          t8+=matrizA[i][k+8]*matrizB[k+8][j];
          t9+=matrizA[i][k+9]*matrizB[k+9][j];

	 }
         matrizC[i][j]=t0+t1+t2+t3+t4+t5+t6+t7+t8+t9;
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

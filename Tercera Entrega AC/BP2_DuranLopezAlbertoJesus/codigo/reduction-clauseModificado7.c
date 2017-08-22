#include <stdio.h>
#include <stdlib.h>

#ifdef _OPENMP
 #include <omp.h>
#else
  #define omp_get_thread_num() 0
#endif

int main(int argc, char const **argv) {
  int i, n = 20, a[n], suma = 10;

  if(argc < 2){
    fprintf(stderr, "Falta iteraciones\n");
    exit(-1);
  }

  n = atoi(argv[1]);
  if(n > 20){
    n = 20;
    printf("n = %d\n",n);
  }

  for (i = 0; i < n; i++)
    a[i] = i;
    #pragma omp parallel
     {
      int suma_local=0;
     	#pragma omp for
    		for (i=0; i<n; i++){
    		  suma_local += a[i];
    		}
    		#pragma omp atomic
    			suma += suma_local;
    }

    printf("Tras 'parallel' suma=%d\n",suma);
}
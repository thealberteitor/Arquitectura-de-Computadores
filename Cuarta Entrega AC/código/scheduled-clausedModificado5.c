#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
  #include <omp.h>
#else
  #define omp_get_thread_num() 0
#endif

int main(int argc, char **argv)
{
  int i, n=200, chunk, a[n], suma=0;
  int dyn, nthreads, modifier;
  omp_sched_t kind;
  if(argc < 3) {
    fprintf(stderr,"\nFalta iteraciones o chunk \n");
    exit(-1);
  }
  
  n = atoi(argv[1]);
  if (n>200)
    n=200;
  chunk = atoi(argv[2]);

  for (i=0; i<n; i++)
    a[i]=i;

  omp_get_schedule(&kind,&modifier);
  printf("Antes de modificar:\n");
  printf("dyn-var: %d\n", omp_get_dynamic());
  printf("nthreads-var: %d\n", omp_get_num_threads());
  printf("run-sched-var: %d, %d\n", kind, modifier);
     
  omp_set_dynamic(1);
  omp_set_num_threads(1);
  omp_set_schedule(3,1);

  omp_get_schedule(&kind,&modifier);
  printf("Despues de modificar:\n");
  printf("dyn-var: %d\n", omp_get_dynamic());
  printf("nthreads-var: %d\n", omp_get_num_threads());
  printf("run-sched-var: %d, %d\n", kind, modifier);

  

  #pragma omp parallel for firstprivate(suma)  \
  lastprivate(suma) schedule(dynamic,chunk)
  for (i=0; i<n; i++) {
    suma = suma + a[i];
    printf(" thread %d suma a[%d]=%d suma=%d \n",
	   omp_get_thread_num(),i,a[i],suma);
  }
  
  printf("Fuera de 'parallel for' suma=%d\n",suma);
}

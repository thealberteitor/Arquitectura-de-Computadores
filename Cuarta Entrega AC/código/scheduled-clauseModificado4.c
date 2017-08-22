#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
  #include <omp.h>
#else
  #define omp_get_thread_num() 0
#endif

int main(int argc, char **argv)
{
  int i, n=16, chunk, a[n], suma=0;
  int modifier;
  omp_sched_t kind;
  if(argc < 3) {
    fprintf(stderr,"\nFalta iteraciones o chunk \n");
    exit(-1);
  }

  //dyn-var = omp_get_dynamic();
  //nthreads-var = omp_get_max_threads();
  //thread-limit-var=omp_get_thread_limit();
  //run-sched-var=omp_get_schedule(&kind,&modifier);

  
  n = atoi(argv[1]);
  if (n>200)
    n=200;
  chunk = atoi(argv[2]);

  for (i=0; i<n; i++)
    a[i]=i;

  #pragma omp parallel for firstprivate(suma) lastprivate(suma) schedule(dynamic,chunk)
  for (i=0; i<n; i++) {
    suma = suma + a[i];
    //printf(" thread %d suma a[%d]=%d suma=%d \n", omp_get_thread_num(),i,a[i],suma);
    
    //Sólo nos piden para un thread por lo que ponemos para el thread 0
    if(omp_get_thread_num() == 0)
    {
       omp_get_schedule(&kind,&modifier);
       printf("Dentro de 'parallel':\n");
       printf("dyn-var: %d\n", omp_get_dynamic());
       printf("nthreads-var: %d\n", omp_get_max_threads());
       printf("thread-limit-var: %d\n", omp_get_thread_limit());
       printf("run-sched-var: %d, %d\n", kind, modifier);
       printf(" NUM_THREADS: %d, NUM_PROCS: %d, IN_PARALLEL:%d \n", omp_get_num_threads() ,omp_get_num_procs(), omp_in_parallel());
   }
  }
  printf("Fuera de 'parallel for' suma=%d\n",suma);
  omp_get_schedule(&kind,&modifier);
  printf("Fuera de 'parallel':\n");
  printf("dyn-var: %d\n", omp_get_dynamic());
  printf("nthreads-var: %d\n", omp_get_max_threads());
  printf("thread-limit-var: %d\n", omp_get_thread_limit());
  printf("run-sched-var: %d, %d\n", kind, modifier);
  printf(" NUM_THREADS: %d, NUM_PROCS: %d, IN_PARALLEL:%d \n", omp_get_num_threads(), omp_get_num_procs(), omp_in_parallel());
}

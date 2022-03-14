// finished on 3/14/2019

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "randgenerator.h"

int * rand_int_arr(int val1, int val2, int*i_arr, int size){
  srand(time(0));
  int i;
  for (i=0;i<size;i++){
    i_arr[i] = rand()%(val2-val1) + val1;
  }
  return i_arr;
}

double * rand_dbl_arr(double val1, double val2, double * d_arr,int size){
  srand(time(0));
  int i;
  for (i=0;i<size;i++){
    d_arr[i] = ((double) rand()/RAND_MAX)*(val2-val1) + val1;
  }
  return d_arr;
}

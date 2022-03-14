// This file offers comprehesive testing of all code provided in this repo

#include <stdio.h>
#include <stdlib.h>
#include "quicksort.h"
#include "randgenerator.h"

int main(){
  int i, len = 100;
  int i_ar[len], * i_arr;
  double d_ar[len], * d_arr;

  i_arr = rand_int_arr(50,100,i_ar,len);
  d_arr = rand_dbl_arr(50,100.0,d_ar,len);

  for(i=0;i<len;i++){
    printf("%d ",i_arr[i]);
  }
  printf("\n\r");
  quicksort_i(i_arr,len);
  for(i=0;i<len;i++){
    printf("%d ",i_arr[i]);
  }
  printf("\n\r");

  for(i=0;i<len;i++){
    printf("%lf ",d_arr[i]);
  }
  printf("\n\r");
  quicksort_d(d_arr,len);
  for(i=0;i<len;i++){
    printf("%lf ",d_arr[i]);
  }
  printf("\n\r");


  return 0;
}

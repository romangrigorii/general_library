// finished on 3/14/2019
#include <stdio.h>
#include "quicksort.h"

int * quicksort_i(int * arr, int l){
  int la = 0, ra = 0, i, ii = 0, temp;
  int larr[l], rarr[l];
  int * larrs, * rarrs;
  if (l>2){
    for (i=1;i<l;i++){
      if (arr[0]>arr[i]){
        larr[la] = arr[i];
        la++;
      } else {
        rarr[ra] = arr[i];
        ra++;
      }
    }
    if (la==0){
      larr[0] = arr[0];
      la++;
    } else if (ra==0){
      rarr[0] = arr[0];
      ra++;
    } else {
      larr[la] = arr[0];
      la++;
    }
    larrs = quicksort_i(larr,la);
    rarrs = quicksort_i(rarr,ra);
    i = 0; ii = 0;
    while(i<l && ii<la){
      arr[i] = larrs[ii];
      ii++;
      i++;
    }
    ii = 0;
    while(i<l && ii<ra){
      arr[i] = rarrs[ii];
      ii++;
      i++;
    }
  } else {
    if (l==2){
      if (arr[0]>arr[1]){
        temp = arr[1];
        arr[1] = arr[0];
        arr[0] = temp;
      }
    }
  }
  return arr;
}

double * quicksort_d(double * arr, int l){
  int la = 0, ra = 0, i, ii = 0;
  double larr[l], rarr[l], temp;
  double * larrs, * rarrs;
  if (l>2){
    for (i=1;i<l;i++){
      if (arr[0]>arr[i]){
        larr[la] = arr[i];
        la++;
      } else {
        rarr[ra] = arr[i];
        ra++;
      }
    }
    if (la==0){
      larr[0] = arr[0];
      la++;
    } else if (ra==0){
      rarr[0] = arr[0];
      ra++;
    } else {
      larr[la] = arr[0];
      la++;
    }
    larrs = quicksort_d(larr,la);
    rarrs = quicksort_d(rarr,ra);
    i = 0; ii = 0;
    while(i<l && ii<la){
      arr[i] = larrs[ii];
      ii++;
      i++;
    }
    ii = 0;
    while(i<l && ii<ra){
      arr[i] = rarrs[ii];
      ii++;
      i++;
    }
  } else {
    if (l==2){
      if (arr[0]>arr[1]){
        temp = arr[1];
        arr[1] = arr[0];
        arr[0] = temp;
      }
    }
  }
  return arr;
}

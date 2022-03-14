#ifndef randgenerator
#define randgenerator

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// generates an array 'arr' of size 'size' which cotains random integer values in the range of val1 and val2
int * rand_int_arr(int val1, int val2, int*arr, int size);
// generates an array 'arr' of size 'size' which cotains random float values in the range of val1 and val2
double * rand_dbl_arr(double,double,double*,int);
#endif

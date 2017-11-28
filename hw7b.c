/*

  Thao Phan
  hw7b.c

  This program takes a user integer, N, and prints that many lines in Pascal's Triangle
*/
#include <stdio.h>
#include <stdlib.h>


int main( int argc, char *argv[] ) {

  /*  if ( argc<= 1 ) {
    printf( "Syntax %s N\n", argv[0] );
    printf( "where N is the number of rows of Pascal triangle to be printed\n" );
    return 0;
    }*/

  int N = atoi( argv[1] ); /* Get user's integer value*/

  /* initialize the array & populate it with 0's */
  int array[N];
  int j;
  for (j=0; j < N; j++) {
    array[j] = 0;
  }
  array[0] = 1; /* make first index have value of 1*/

  /* Produce Pascal's Triangle Below */

  int array_size = N;
  while (N>0){

    /* print current array */

    int p;
    for ( p=0; p < array_size; p++ ) {
      printf("%5d ", array[p]);
    }
    printf("\n");

    /* Calculate the new values in the array */

    int m;
    for ( m=array_size; m > 0; m-- ) {

      int position = m-1;
      int before = m-2;
      int newValue = array[position]+array[before];

      array[position] = newValue;
     }
    N--; /* decrement N so while loop doesn't go on forever */
  }

  return 0;
}

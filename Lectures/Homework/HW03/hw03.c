//Nash Reilly
//EELE 475/Snider
//HW03

#include <stdio.h>
#include "vnorm.c"

int coord; 
double mag;   // Variable for magnitude

int main(){

  coord = 4; 

  mag = vnorm(coord,2.0,3.0,4.0,5.0);

  printf("The magnitude of the given vector is %f.\n", mag);

  return(1);
}



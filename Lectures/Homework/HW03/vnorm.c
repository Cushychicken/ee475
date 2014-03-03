//Nash Reilly
//EELE 475/Snider
//HW03 subcomponent vnorm.c

#include <stdio.h>
#include <stdarg.h>
#include <math.h>

double vnorm(int coord, ...){

  va_list ap;
  int j;
  double tot = 0;
  double test = 0;
  int VERBOSE = 0;

  va_start(ap, coord);                 //Gets the address of last fixed parameter

  for(j=0; j<coord; j++){
    test = va_arg(ap, double);         //Requires the type for typecasting
    if(VERBOSE == 1){
      printf("%f\n",test);             //Troubleshooting statement
    };
    tot+=(powf(test,2));               //Adds the squared argument to "tot"
  };                                   //Increments ap to the next argument

  va_end(ap);

  tot = sqrt(tot);

  return(tot);

}

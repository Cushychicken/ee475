
#include <stdio.h>
#include <ctype.h>

FILE *pfile;		 	             /*File Pointer                                              */
char test;		 	             /*Character for evaluation                                  */
char cs;                        
int j;                                       /*Checksum test                                             */

// typedef struct{
	// ->
// }

char checksum(char test, char cs);

int main(){

  pfile = fopen("GPS_Characters.txt", "rt"); /*Opens file of GPS chars to read                           */
    
  test = 'a';                                /*Initialize test character                                 */

  while (test != EOF) {                      /*While condition: test character != end of file            */
    test = fgetc(pfile);                     /*Slurps next character from file                           */    
    j    = 0;
    if(test == 'G'){                
		cs   = test;
		test = fgetc(pfile);
		if(test == 'P'){
			cs   = checksum(test, cs);
			test = fgetc(pfile);
			if(test == 'G'){
				cs   = checksum(test, cs);
				test = fgetc(pfile);
				if(test == 'G'){
					cs   = checksum(test, cs);
					test = fgetc(pfile);
					if(test == 'A'){                 /*Nested if's execute for a string of "GPGGA"               */
						cs   = checksum(test, cs);
						printf("GPGGA");
						test = fgetc(pfile);           
						while(test != '$'){            /*While loop continues to slurp characters while not a $    */
							if(test == '*'){             /*Sets flag integer if checksum separator comes up          */
								j = 1;
							};
							if(j != 1){                  /*Implements checksum subfunction before checksum separator */
								cs = checksum(test, cs);	       
							};
							printf("%c", test);
							test = fgetc(pfile);
						};
						printf("Checksum (hex) = 0x%x\n", cs); /* Prints checksum */
					};	 
				};
			};
		};
    };
  };
  
  return(1);
}

char checksum(char test, char cs){
  cs = (cs ^ test);
  return(cs);
}

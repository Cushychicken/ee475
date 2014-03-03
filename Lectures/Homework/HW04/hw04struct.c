
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

FILE *pfile;		 	             /*File Pointer                                              */
char test;		 	             /*Character for evaluation                                  */
char cs;                        
int j;                                       /*Checksum test                                             */

typedef struct packet{
	char ident[6];
	char time[10];
	char latitude[12];
	char ns[2];
	char longitude[12];
	char ew[2];
	char qual[2];
	char satnum[3];
	char hdop[5];
	char ant_ht[7];
	char ant_unt[2];
	char geoid_diff[7];
	char geoid_unt[2];
	char cs[3];
 }

char checksum(char test, char cs);
void parse_GGA(packet GGA);

int main(){
  
  packet GGA;
  
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
	int j = 0;
	int k = 0;
	int l = 0;
	char pkt[83];
  
	while(test != EOF){
		j = 0;
		k = 0;
		l = 0;
		if(test == 'G'){                
			pkt[j] = test;
			j++;
			test   = fgetc(pfile);
			if(test == 'P'){
				pkt[j] = test;
				j++;
				test   = fgetc(pfile);
				if(test == 'G'){
					pkt[j] = test;
					j++;
					test   = fgetc(pfile);
					if(test == 'G'){
						pkt[j] = test;
						j++;
						test   = fgetc(pfile);
						if(test == 'A'){                 /*Nested if's execute for a string of "GPGGA"               */
							pkt[j] = test;
							j++;
							test   = fgetc(pfile);           
							while(test != '$'){			/*Populates the pkt variable  */
								pkt[j] = fgetc(pfile);
								j++;
							};
							if(test == '$'){			/*Sets flag when next packet starts*/
								pkt[(j+1)] = '\0';
							}; 
							
							for(k = 0; k =< j; k++){	/*For loop calculates the checksum*/
								if(k == 0){
									cs = pkt[k];
								};
								if(pkt[k] == '*'){
									l = 1;
								};
								if((k >> 0) && (l != 1)){
									cs = cs ^ pkt[k];
								};
							};
						
						};	 
					};
				};
			};
		};
	};
	
	
}

char parse_GGA(packet GGA, char cs, FILE *pfile){
  int j = 0;
  int k = 0;
  double dtemp;
  int itemp;
  char ctemp;
  char *test;
  char *str[16];
  test[] = fgetc(pfile);
  while(test != '$'){            /*While loop continues to slurp characters while not a $    */
    if(test == '*'){             /*Sets flag integer if checksum separator comes up          */
      j = 1;
    };
    if(j != 1){                  /*Implements checksum subfunction before checksum separator */
      cs = checksum(test, cs);	       
    };
    
    if(test == ','){
      k++;
      switch(k){
      case 1:
	dtemp = atof(str);
	GGA.time = dtemp;
      case 2:
	dtemp = atof(str);
	GGA.latitude = dtemp;
      case 3:
	ctemp = str;
	GGA.N = ctemp;
      case 4:
	dtemp = atof(str);
	GGA.longitude = dtemp;
      case 5:
	ctemp = str;
	GGA.E = ctemp;
      case 6:
	itemp = atoi(str);
	GGA.qual = itemp;
      case 7:
	itemp = atoi(str);
	GGA.satnum = itemp;
      case 8:
	dtemp = atof(str);
	GGA.hdop = dtemp;	
      }
    } else {
      strcat(str, test);
    }
    printf("%c", test);
    test[] = fgetc(pfile);
  };
  
}

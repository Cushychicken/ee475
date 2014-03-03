/*
 * lcdwrite.c
 *
 *  Created on: Sep 28, 2011
 *      Author: nash.reilly
 */

#include <stdio.h>
#include <string.h>
#include "C:\NRCREE475\lab04\DE2_System\nios_qsys\software\lcdwrite\lcdwrite.h"

#define Switches (volatile int *) 0x01001010
#define LEDs 	 (int *) 0x01001000\

int main (void){

	int test 			= 0;
	int prev 			= 0;
	int VERBOSE 		= 2;
	int j;
	int sw_array[4]  	= {1,2,4,8};
	char str1[16] 		= "Initialize.";
	char str2[16] 		= "Initialize.";

	sprintf(str1, "Switch program!");
	WriteLCD(str1);

	while(1){
		test = *Switches;

		if(VERBOSE == 1){										//Debug string for verbose == 1
			printf("Current value of test: %d\n", test);
		};


		for(j=0; j<4; j++){										// Runs through potential fitting values of array
			if((test == sw_array[j]) && (test != prev)){		// If test value matches a value in the array, prints switch number
				sprintf(str1, "SW%d is active.", j);			// Print statement of which switch is active
			};
		};

		for(j=0; j<4; j++){										// Runs through values for prev
			if((prev == sw_array[j]) && (test != prev)){		// Matching condition for prev
				sprintf(str2, "SW%d last used.", j);			// Prints value of last active switch
			};
		};

		if(test != prev){										// Updates LCD if a change occurs between test and prev
			WriteLCD(str1);
			WriteLCD(str2);
		};

		prev = test;											// Sets prev equal to test; will not trigger print/write statements until different

	};

	return(1);

}

/*
 * pwm.c
 *
 *  Created on: Oct 18, 2011
 *      Author: nash.reilly
 */

#include <stdio.h>

#define Switches (volatile int *) 0x010010b0
#define LEDs 	 (int *) 		  0x010010a0
#define PWM1_BASE_ADDRESS		  0x01001020
#define PWM1_CTRL				  ((int *)PWM1_BASE_ADDRESS)
#define PWM1_PERIOD				  ((int *)(PWM1_BASE_ADDRESS + 4))
#define PWM1_NEUTRAL			  ((int *)(PWM1_BASE_ADDRESS + 8))
#define PWM1_LARGEST			  ((int *)(PWM1_BASE_ADDRESS + 12))
#define PWM1_SMALLEST			  ((int *)(PWM1_BASE_ADDRESS + 16))
#define PWM1_ENABLE				  ((int *)(PWM1_BASE_ADDRESS + 20))

int main()
{
	int temp;

	*PWM1_PERIOD   = 1000000;
	*PWM1_NEUTRAL  = 75000;
	*PWM1_LARGEST  = 100000;
	*PWM1_SMALLEST = 50000;
	*PWM1_ENABLE   = 1;

	while(1){
		*LEDs = *Switches;
		temp  = *Switches;
		temp  = (temp & 0x00000007);

		switch(temp){
		case 1:
			*PWM1_CTRL = -128; break;
		case 2:
			*PWM1_CTRL = 0; break;
		case 4:
			*PWM1_CTRL = 127; break;
		default:
			break;
		};
	}

}

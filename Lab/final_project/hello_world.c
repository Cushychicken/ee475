/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */

#include <stdio.h>

/* PERIPHERAL ADDRESSES -- SEE system.h FOR BASE ADDRESS ASSIGNMENTS */
#define CALIBRATE_AVALON_0_BASE 0x01001040
#define CALIBRATE_DATA  		(int *) CALIBRATE_AVALON_0_BASE
#define CALIBRATE_X				(int *) (CALIBRATE_AVALON_0_BASE + 1)
#define CALIBRATE_Y  			(int *) (CALIBRATE_AVALON_0_BASE + 2)
#define CALIBRATE_MEM_OFF  		(int *) (CALIBRATE_AVALON_0_BASE + 3)
#define CALIBRATE_GAIN  		(int *) (CALIBRATE_AVALON_0_BASE + 4)
#define CALIBRATE_OFFSET  		(int *) (CALIBRATE_AVALON_0_BASE + 5)
#define CALIBRATE_DATA_CAL  	(int *) (CALIBRATE_AVALON_0_BASE + 6)

#define LEDs 	 				(int *) 0x01001060
#define Switches  				(int *) 0x01001070

#define IMAGE_SIZE_X	5
#define IMAGE_SIZE_Y	5

/* Array containing input image values */
int input_image[IMAGE_SIZE_Y][IMAGE_SIZE_X]  	= {	{6000, 6001, 6002, 6003, 6004},
													{5000, 5001, 5002, 5003, 5004},
													{4000, 4001, 4002, 4003, 4004},
													{3000, 3001, 3002, 3003, 3004},
													{2000, 2001, 2002, 2003, 2004}};
/* Array containing output image values */
int output_image[IMAGE_SIZE_Y][IMAGE_SIZE_X];

/* Array containing gain values for correction */
int gain_table[IMAGE_SIZE_Y][IMAGE_SIZE_X]    	= {	{2,2,2,2,2},
													{3,3,3,3,3},
													{2,2,2,2,2},
													{2,2,2,2,2},
													{3,3,3,3,3}};
/* Array containing offset values for correction */
int offset_table[IMAGE_SIZE_Y][IMAGE_SIZE_X]    = {	{},
													{},
													{},
													{},
													{}};

/* Array containing mem_offset values for confirmation purposes */
int mem_offset_table[IMAGE_SIZE_Y][IMAGE_SIZE_X];

int x,y;
int long count;
int offset;

int main()
{
	x = 0;
	y = 0;

	printf("Starting...\n");

	while(1){
		*LEDs = *Switches;

		for(y = 0; y < IMAGE_SIZE_Y; y++){
			for(x = 0; x < IMAGE_SIZE_X; x++){
				*CALIBRATE_DATA			= input_image[y][x];
				*CALIBRATE_X			= x;
				*CALIBRATE_Y			= y;
				mem_offset_table[y][x]	= *CALIBRATE_MEM_OFF;
				*CALIBRATE_GAIN			= gain_table[y][x];
				*CALIBRATE_OFFSET		= offset_table[y][x];
				output_image[y][x]		= *CALIBRATE_DATA_CAL;
			};
		};

	};


	return 0;
}

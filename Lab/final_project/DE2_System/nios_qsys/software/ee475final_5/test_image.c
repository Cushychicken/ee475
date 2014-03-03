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
#define CALIBRATE_DATA  		(int *) 0x01001000
#define CALIBRATE_X				(int *) 0x01001004
#define CALIBRATE_Y  			(int *) 0x01001008
#define CALIBRATE_MEM_OFF  		(volatile int *) 0x0100100C
#define CALIBRATE_GAIN  		(int *) 0x01001010
#define CALIBRATE_OFFSET  		(int *) 0x01001014
#define CALIBRATE_DATA_CAL  	(volatile int *) 0x01001018
#define CALIBRATE_MEM_PRODUCT  	(volatile int *) 0x0100101C
#define CALIBRATE_GAIN_PRODUCT  (volatile int *) 0x01001020


#define LEDs 	 				(int *) 0x01001080
#define Switches  				(volatile int *) 0x01001090

#define IMAGE_SIZE_X	5
#define IMAGE_SIZE_Y	5

/* Array containing input image values */
int input_image[IMAGE_SIZE_Y][IMAGE_SIZE_X]  	= {	{100, 101, 102, 103, 104},
													{200, 201, 202, 203, 204},
													{300, 301, 302, 303, 304},
													{400, 401, 402, 403, 404},
													{500, 501, 502, 503, 504}};
/* Array containing output image values */
int output_image[IMAGE_SIZE_Y][IMAGE_SIZE_X];

/* Array containing gain values for correction */
int gain_table[IMAGE_SIZE_Y][IMAGE_SIZE_X]    	= {	{2,2,2,2,2},
													{3,3,3,3,3},
													{2,2,2,2,2},
													{2,2,2,2,2},
													{3,3,3,3,3}};
/* Array containing offset values for correction */
int offset_table[IMAGE_SIZE_Y][IMAGE_SIZE_X]    = {	{20, 20, 20, 20, 20},
													{20, 20, 20, 20, 20},
													{20, 20, 20, 20, 20},
													{20, 20, 20, 20, 20},
													{20, 20, 20, 20, 20}};

/* Array containing mem_offset values for confirmation purposes */
int mem_offset_table[IMAGE_SIZE_Y][IMAGE_SIZE_X];

/* Scripted outputs for C code to calculate */
int correct_image[IMAGE_SIZE_Y][IMAGE_SIZE_X];
int correct_mem_offset[IMAGE_SIZE_Y][IMAGE_SIZE_X];

int x,y;
int correct;


int main()
{
	x = 0;
	y = 0;

	printf("Starting...\n");

	correct = 0;

	/* Populates Test Image Arrays */
	for(y = 0; y < IMAGE_SIZE_Y; y++){
		for(x = 0; x < IMAGE_SIZE_X; x++){
			*CALIBRATE_DATA			= input_image[y][x];
			*CALIBRATE_X			= x;
			*CALIBRATE_Y			= y;
			usleep(1);
			mem_offset_table[y][x]	= *CALIBRATE_MEM_OFF;
			*CALIBRATE_GAIN			= gain_table[y][x];
			*CALIBRATE_OFFSET		= offset_table[y][x];
			usleep(1);
			output_image[y][x]		= *CALIBRATE_DATA_CAL;
		};
	};

	/* Populates Correct Image Arrays */
	for(y = 0; y < IMAGE_SIZE_Y; y++){
		for(x = 0; x < IMAGE_SIZE_X; x++){
			correct_image[y][x]		= (input_image[y][x] + (input_image[y][x] * gain_table[y][x]) + offset_table[y][x]);
			correct_mem_offset[y][x]= ((y*324) + x);
		};
	};

	/* Compares Test image with correct image arrays*/
	for(y = 0; y < IMAGE_SIZE_Y; y++){
		for(x = 0; x < IMAGE_SIZE_X; x++){
			if ( correct_image[y][x] == output_image[y][x]){
				printf("Pixel[%d][%d] is correct.\n", y,x);
				correct++;
			} else {
				printf("*** ERROR *** : Pixel[%d][%d] is incorrect.\n", y,x);
			};
		};
	};

	/* Compares Test image with correct image arrays*/
	for(y = 0; y < IMAGE_SIZE_Y; y++){
		for(x = 0; x < IMAGE_SIZE_X; x++){
			if ( mem_offset_table[y][x] == correct_mem_offset[y][x]){
				printf("Offset[%d][%d] is correct.\n", y,x);
				correct++;
			} else {
				printf("*** ERROR *** : Offset[%d][%d] is incorrect.\n", y,x);
			};
		};
	};

	if( correct == (2*IMAGE_SIZE_Y*IMAGE_SIZE_X)){
		printf("Test complete. Subject passes!\n");
	} else {
		printf("*** ERROR *** : Test failed. Go jump in a lake.\n");
	}

	while(1){
		*LEDs = *Switches;
	};


	return 0;
}


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

int x,y;
int temp;


int main()
{
	x = 0;
	y = 0;

	printf("Starting...\n");

	while(1){
		*LEDs = *Switches;

		/* Loads input image array */

		printf("Input image\n");

		for(y = 0; y < IMAGE_SIZE_Y; y++){
			for(x = 0; x < IMAGE_SIZE_X; x++){
				printf("Pixel %d, %d\n",y,x);
				*CALIBRATE_DATA			= input_image[y][x];
				temp					= *CALIBRATE_DATA;
				printf("Data in     : %d\n", temp);
				*CALIBRATE_X			= x;
				temp					= *CALIBRATE_X;
				printf("X_coord     : %d\n", temp);
				*CALIBRATE_Y			= y;
				temp					= *CALIBRATE_Y;
				printf("Y_coord     : %d\n", temp);
				usleep(1);
				temp					= *CALIBRATE_MEM_OFF;
				printf("Mem_offset  : %d\n", temp);
				*CALIBRATE_GAIN			= gain_table[y][x];
				temp					= *CALIBRATE_GAIN;
				printf("Gain        : %d\n", temp);
				*CALIBRATE_OFFSET		= offset_table[y][x];
				temp					= *CALIBRATE_OFFSET;
				printf("Offset      : %d\n", temp);
				usleep(1);
				temp					= *CALIBRATE_DATA_CAL;
				printf("Data_cal    : %d\n", temp);
				temp					= *CALIBRATE_MEM_PRODUCT;
				printf("Mem_product : %d\n", temp);
				temp					= *CALIBRATE_GAIN_PRODUCT;
				printf("Gain_product: %d\n\n", temp);
			};
			printf("\n");
		};
		printf("\n");


		usleep(1000000);
	};


	return 0;
}


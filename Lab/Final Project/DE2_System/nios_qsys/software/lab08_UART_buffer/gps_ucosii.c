/*************************************************************************
* Copyright (c) 2004 Altera Corporation, San Jose, California, USA.      *
* All rights reserved. All use of this software and documentation is     *
* subject to the License Agreement located at the end of this file below.*
**************************************************************************
* Description:                                                           *
* The following is a simple hello world program running MicroC/OS-II.The * 
* purpose of the design is to be a very simple application that just     *
* demonstrates MicroC/OS-II running on NIOS II.The design doesn't account*
* for issues such as checking system call return codes. etc.             *
*                                                                        *
* Requirements:                                                          *
*   -Supported Example Hardware Platforms                                *
*     Standard                                                           *
*     Full Featured                                                      *
*     Low Cost                                                           *
*   -Supported Development Boards                                        *
*     Nios II Development Board, Stratix II Edition                      *
*     Nios Development Board, Stratix Professional Edition               *
*     Nios Development Board, Stratix Edition                            *
*     Nios Development Board, Cyclone Edition                            *
*   -System Library Settings                                             *
*     RTOS Type - MicroC/OS-II                                           *
*     Periodic System Timer                                              *
*   -Know Issues                                                         *
*     If this design is run on the ISS, terminal output will take several*
*     minutes per iteration.                                             *
**************************************************************************/


#include <stdio.h>
#include <string.h>
#include "alt_ucosii_simple_error_check.c"
#include "includes.h"
#include "gpsparse.h"
#include "lcdwrite.h"

/* Definition of Task Stacks */
#define   TASK_STACKSIZE       2048
OS_STK    task1_stk[TASK_STACKSIZE];

/* Definition of Task Priorities */

#define TASK1_PRIORITY      6
#define TASK2_PRIORITY      7
#define TASK3_PRIORITY      8
#define TASK4_PRIORITY      9
#define TASK5_PRIORITY     10

/* Definition of Semaphore */
 OS_EVENT *data_packet_sem;
 char sem_owner_task_name[20];

/* uC OS II Error Code*/
 INT8U return_code;

/* Defines switch, LED, and PWM locations in registry */
#define Switches (volatile int *) 0x01001090
#define LEDs 	 (int *) 		  0x01001080
#define UART_RX  (int *) 		  UART_RS232_BASE

/* Variables for GPS Parsing */
char test;
char cs;
char uart[500];
char pkt[83];
char print[] = "Sixteen LCD char";
char aorp;
double height;
struct packet packet_GGA;
int j,k;

/* ISR for UART Interrupt */

static void handle_UART_interrupts(void* context, alt_u32 id)
{
    test = (char)((*UART_RX) & 0xff);
    if (j < 499){
    	uart[j] = test;
    	j++;
    } else {
        uart[j] = '\0';
        j = 0;
        uart[j] = test;
    	OSSemPost(data_packet_sem);
    }
}

/* Initialize the uart_ISR. */

static void init_UART_ISR()
{
    /* Register the interrupt handler. */
    alt_irq_register( UART_RS232_IRQ, NULL, handle_UART_interrupts );
}

/* Populates pkt string with GPS data */
void task1(void* pdata)
{
  while (1)
  {
	  OSSemPend(data_packet_sem, 0, &return_code);
	  alt_ucosii_check_return_code(return_code);
	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	/* Gets first character from serial stream              */
	  j = 0;

	  printf("Task 1!\n");

	  while(checksum(test,cs,pkt,uart) != 1){													/* Runs checksum function over until good packet found  */
		  test = uart[j];																	/* Gets new character from checksum    					*/
		  j++;
	  }

	  parse_GGA(pkt, &packet_GGA);

	  OSSemPost(data_packet_sem);															/* Loop exits once packet is found; semaphore signal    */
  }
}

/* The main function creates all tasks and starts multi-tasking */
int main(void)
{
	return_code = OS_NO_ERR;								/* Initializes error return code 	*/
	alt_ucosii_check_return_code(return_code);
	data_packet_sem = OSSemCreate(1);						/* Initializes GPS packet semaphore */

	init_UART_ISR();

	j = 0;

	printf("Starting...\n");

	return_code = OSTaskCreateExt(task1,
								  NULL,
								  (void *)&task1_stk[TASK_STACKSIZE-1],
								  TASK1_PRIORITY,
								  TASK1_PRIORITY,
								  task1_stk,
								  TASK_STACKSIZE,
								  NULL,
								  0);
	alt_ucosii_check_return_code(return_code);

	OSStart();
	return 0;
}

/******************************************************************************
*                                                                             *
* License Agreement                                                           *
*                                                                             *
* Copyright (c) 2004 Altera Corporation, San Jose, California, USA.           *
* All rights reserved.                                                        *
*                                                                             *
* Permission is hereby granted, free of charge, to any person obtaining a     *
* copy of this software and associated documentation files (the "Software"),  *
* to deal in the Software without restriction, including without limitation   *
* the rights to use, copy, modify, merge, publish, distribute, sublicense,    *
* and/or sell copies of the Software, and to permit persons to whom the       *
* Software is furnished to do so, subject to the following conditions:        *
*                                                                             *
* The above copyright notice and this permission notice shall be included in  *
* all copies or substantial portions of the Software.                         *
*                                                                             *
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  *
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,    *
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE *
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER      *
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING     *
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER         *
* DEALINGS IN THE SOFTWARE.                                                   *
*                                                                             *
* This agreement shall be governed in all respects by the laws of the State   *
* of California and by the laws of the United States of America.              *
* Altera does not recommend, suggest or require that this reference design    *
* file be used in conjunction or combination with any other product.          *
******************************************************************************/
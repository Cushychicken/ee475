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
OS_STK    task2_stk[TASK_STACKSIZE];
OS_STK    task3_stk[TASK_STACKSIZE];
OS_STK    task4_stk[TASK_STACKSIZE];
OS_STK    task5_stk[TASK_STACKSIZE];


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

#define PWM1_BASE_ADDRESS		  0x01001040
#define PWM1_CTRL				  ((int *)PWM1_BASE_ADDRESS)
#define PWM1_PERIOD				  ((int *)(PWM1_BASE_ADDRESS + 4))
#define PWM1_NEUTRAL			  ((int *)(PWM1_BASE_ADDRESS + 8))
#define PWM1_LARGEST			  ((int *)(PWM1_BASE_ADDRESS + 12))
#define PWM1_SMALLEST			  ((int *)(PWM1_BASE_ADDRESS + 16))
#define PWM1_ENABLE				  ((int *)(PWM1_BASE_ADDRESS + 20))

#define PWM2_BASE_ADDRESS		  0x01001060
#define PWM2_CTRL				  ((int *)PWM2_BASE_ADDRESS)
#define PWM2_PERIOD				  ((int *)(PWM2_BASE_ADDRESS + 4))
#define PWM2_NEUTRAL			  ((int *)(PWM2_BASE_ADDRESS + 8))
#define PWM2_LARGEST			  ((int *)(PWM2_BASE_ADDRESS + 12))
#define PWM2_SMALLEST			  ((int *)(PWM2_BASE_ADDRESS + 16))
#define PWM2_ENABLE				  ((int *)(PWM2_BASE_ADDRESS + 20))


/* Variables for GPS Parsing */
char test;
char cs;
char pkt[83];
char print[] = "Sixteen LCD char";
char aorp;
double height;
struct packet packet_GGA;
int temp, temp_inc1, temp_inc2, pwm1, pwm2;
int time[3]      = {0, 0, 0};
int latitude[3]  = {0, 0, 0};
int longitude[3] = {0, 0, 0};
int j;

/* Populates pkt string with GPS data, sleeps for 750 ms */
void task1(void* pdata)
{
  while (1)
  {
	  OSSemPend(data_packet_sem, 0, &return_code);
	  alt_ucosii_check_return_code(return_code);
	  test=getchar();																		/* Gets first character from serial stream              */

	  while(checksum(test,cs,pkt) != 1){													/* Runs checksum function over until good packet found  */
		  test = getchar();																	/* Gets new character from checksum    					*/
	  }

	  parse_GGA(pkt, &packet_GGA);

	  OSSemPost(data_packet_sem);															/* Loop exits once packet is found; semaphore signal    */
	  OSTimeDlyHMSM(0, 0, 0, 500);
  }
}

/* Parses GPS Packet, prints to LCD, sleeps for 500ms */
void task2(void* pdata)
{
  while (1)
  {
	  OSSemPend(data_packet_sem, 0, &return_code);
	  alt_ucosii_check_return_code(return_code);

	  /*
	  switch(temp){
	  case 1:
		  sprintf(print, "Lat:%s%c", packet_GGA.latitude, packet_GGA.ns[0]);
		  WriteLCD(print);
		  sprintf(print, "Lon:%s%c", packet_GGA.longitude, packet_GGA.ew[0]);
		  WriteLCD(print); break;
	  case 0:
		  aorp = GMT_to_MST(time, packet_GGA.time);
		  sprintf(print, "Time: %d:%02d:%02d%cM", time[0], time[1], time[2], aorp);
		  WriteLCD(print);
		  height = m_to_ft(packet_GGA.ant_ht);
		  sprintf(print, "Elev: %5.2f ft", height);
		  WriteLCD(print); break;
	  default:
		  break;
	  };
	  */

	  if (temp == 4){
		  sprintf(print, "PWM1: %d", pwm1);
		  WriteLCD(print);
		  sprintf(print, "PWM2: %d", pwm2);
		  WriteLCD(print);
	  };

	  if (temp == 2){
		  sprintf(print, "Lat:%s%c", packet_GGA.latitude, packet_GGA.ns[0]);
		  WriteLCD(print);
		  sprintf(print, "Lon:%s%c", packet_GGA.longitude, packet_GGA.ew[0]);
		  WriteLCD(print);
	  };

	  if (temp == 1){
		  aorp = GMT_to_MST(time, packet_GGA.time);
		  sprintf(print, "Time: %d:%02d:%02d%cM", time[0], time[1], time[2], aorp);
		  WriteLCD(print);
		  height = m_to_ft(packet_GGA.ant_ht);
		  sprintf(print, "Elev: %5.2f ft", height);
		  WriteLCD(print);
	  };

	  OSSemPost(data_packet_sem);
	  OSTimeDlyHMSM(0, 0, 0, 500);
  }
}

/* Updates PWM1 value every 1/2 second */
void task3(void* pdata)
{
  while (1)
  {
	  return_code = OS_NO_ERR;
	  alt_ucosii_check_return_code(return_code);

	  if(pwm1 == 120){
		  temp_inc1 = -10;
	  }
	  if(pwm1 == -120){
		  temp_inc1 = 10;
	  }

	  *PWM1_CTRL = pwm1 + temp_inc1;
	  pwm1 = pwm1 + temp_inc1;

	  OSTimeDlyHMSM(0, 0, 0, 500);
  }
}

/* Updates PWM2 value every 1/3 second */
void task4(void* pdata)
{
  while (1)
  {
	  return_code = OS_NO_ERR;
	  alt_ucosii_check_return_code(return_code);

	  if(pwm2 == 120){
		  temp_inc2 = -10;
	  }
	  if(pwm2 == -120){
		  temp_inc2 = 10;
	  }

	  *PWM2_CTRL = pwm2 + temp_inc2;
	  pwm2 = pwm2 + temp_inc2;

	  OSTimeDlyHMSM(0, 0, 0, 330);
  }
}

/* Tests state of switches; updates switch and LED values*/
void task5(void* pdata)
{
  while (1)
  {
	  *LEDs = *Switches;
	  temp  = *LEDs;
	  temp  = (temp & 0x07);
	  OSTimeDlyHMSM(0, 0, 0, 20);
  }
}


/* The main function creates all tasks and starts multi-tasking */
int main(void)
{
	return_code = OS_NO_ERR;								/* Initializes error return code 	*/
	alt_ucosii_check_return_code(return_code);
	data_packet_sem = OSSemCreate(1);						/* Initializes GPS packet semaphore */

	pwm1 		   = 0;
	*PWM1_CTRL 	   = pwm1;
	*PWM1_PERIOD   = 1000000;
	*PWM1_NEUTRAL  = 75000;
	*PWM1_LARGEST  = 100000;
	*PWM1_SMALLEST = 50000;
	*PWM1_ENABLE   = 1;
	temp_inc1 = 10;


	pwm2		   = 0;
	*PWM2_CTRL 	   = pwm2;
	*PWM2_PERIOD   = 1000000;
	*PWM2_NEUTRAL  = 75000;
	*PWM2_LARGEST  = 100000;
	*PWM2_SMALLEST = 50000;
	*PWM2_ENABLE   = 1;
	temp_inc2 	   = 10;


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


	return_code = OSTaskCreateExt(task2,
							      NULL,
							      (void *)&task2_stk[TASK_STACKSIZE-1],
							      TASK2_PRIORITY,
							      TASK2_PRIORITY,
							      task2_stk,
							      TASK_STACKSIZE,
							      NULL,
							      0);
	alt_ucosii_check_return_code(return_code);

	return_code = OSTaskCreateExt(task3,
								  NULL,
								  (void *)&task3_stk[TASK_STACKSIZE-1],
								  TASK3_PRIORITY,
								  TASK3_PRIORITY,
								  task3_stk,
								  TASK_STACKSIZE,
								  NULL,
								  0);
	alt_ucosii_check_return_code(return_code);


	return_code = OSTaskCreateExt(task4,
								  NULL,
								  (void *)&task4_stk[TASK_STACKSIZE-1],
								  TASK4_PRIORITY,
								  TASK4_PRIORITY,
								  task4_stk,
								  TASK_STACKSIZE,
								  NULL,
								  0);
	alt_ucosii_check_return_code(return_code);


	return_code = OSTaskCreateExt(task5,
								  NULL,
								  (void *)&task5_stk[TASK_STACKSIZE-1],
								  TASK5_PRIORITY,
								  TASK5_PRIORITY,
								  task5_stk,
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

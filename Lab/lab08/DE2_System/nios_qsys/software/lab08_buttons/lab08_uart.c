#include "count_binary.h"
#include "lcdwrite.h"
#include <stdio.h>

#define UART_RX  (int *) UART_RS232_BASE
#define LEDs 	 (int *) 0x01001080

int j;
char pkt[500];
/* LCD Write string */
char print[40];
/* New RS232 Char   */
char new;
/* A "loop counter" variable. */
static alt_u8 count;
/* A variable to hold the value of the button pio edge capture register. */
volatile int edge_capture;


/* Button pio functions */

/*
  Some simple functions to:
  1.  Define an interrupt handler function.
  2.  Register this handler in the system.
*/

/*******************************************************************
 * static void handle_button_interrupts( void* context, alt_u32 id)*
 *                                                                 *
 * Handle interrupts from the buttons.                             *
 * This interrupt event is triggered by a button/switch press.     *
 * This handler sets *context to the value read from the button    *
 * edge capture register.  The button edge capture register        *
 * is then cleared and normal program execution resumes.           *
 * The value stored in *context is used to control program flow    *
 * in the rest of this program's routines.                         *
 ******************************************************************/

/* Initialize the uart_ISR. */

static void handle_UART_interrupts(void* context, alt_u32 id)
{
    new = ((*UART_RX) & 0xff);

    if (j < 499){
    	pkt[j] = new;
    	j++;
    } else {
    	pkt[j] = '\0';
    	printf("Hey! Look! A packet!\n");
    	printf("%s\n\n", pkt);
    	j = 0;
    	pkt[j] = new;
    }

}

static void init_UART_ISR()
{
    /* Register the interrupt handler. */
    alt_irq_register( UART_RS232_IRQ, NULL, handle_UART_interrupts );
}

/*
 * * Functions used in main loop
 * lcd_init() -- Writes a simple message to the top line of the LCD.
 * initial_message() -- Writes a message to stdout (usually JTAG_UART).
 * count_<device>() -- Implements the counting on the respective device.
 * handle_button_press() -- Determines what to do when one of the buttons
 * is pressed.
 */



/*******************************************************************************
 * int main()                                                                  *
 *                                                                             *
 * Implements a continuous loop counting from 00 to FF.  'count' is the loop   *
 * counter.                                                                    *
 * The value of 'count' will be displayed on one or more of the following 3    *
 * devices, based upon hardware availability:  LEDs    *
 * and the LCD Display.                                                        *
 *                                                                             *
 * During the counting loop, a switch press of SW0-SW3 will affect the         *
 * behavior of the counting in the following way:                              *
 *                                                                             *
 * SW0 - Only the LED will be "counting".                                      *
 * SW1 - Only the LCD Display will be "counting".                              *
 * SW2 - All devices "counting".                                               *
 *                                                                             *
 * There is also a 7 second "wait", following the count loop,                 *
 * during which button presses are still                                       *
 * detected.                                                                   *
 *                                                                             *
 * The result of the button press is displayed on STDOUT.                      *
 *                                                                             *
 * NOTE:  These buttons are not de-bounced, so you may get multiple            *
 * messages for what you thought was a single button press!                    *
 *                                                                             *
 * NOTE:  References to Buttons 1-4 correspond to SW0-SW3 on the Development   *
 * Board.                                                                      *
 ******************************************************************************/

int main(void)
{
    count = 0;
    j	  = 0;
    /* Initialize the UART ISR. */

    init_UART_ISR();

    /* Continue 0-ff counting loop. */

    while( 1 )
    {
    	count = count + 1;
    	*LEDs = count;
    	usleep(100000);
    }

    return 0;
}
/******************************************************************************
 *                                                                             *
 * License Agreement                                                           *
 *                                                                             *
 * Copyright (c) 2006 Altera Corporation, San Jose, California, USA.           *
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


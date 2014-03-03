/*
 * lcdwrite.h
 *
 *  Created on: Sep 28, 2011
 *      Author: nash.reilly
 */

#ifndef LCDWRITE_H_
#define LCDWRITE_H_

#define ESC 27
#define CLEAR_LCD_STRING "[2J"

/*******************************************************************************
 *
 * static void WriteLCD(char *msg)
 *
 * Prints a string to the LCD.
 *
 * Note: ensure the fopen command is accessing the proper lcd driver name!
 *
 ******************************************************************************/

static void WriteLCD(char *msg)
{
  FILE *lcd;

  lcd = fopen("/dev/lcd_0", "w");

  /* Write some simple text to the LCD. */
  if (lcd != NULL )
  {
    fprintf(lcd, "%s\n", msg);
  }

  fclose( lcd );

  return;
}



#endif /* LCDWRITE_H_ */

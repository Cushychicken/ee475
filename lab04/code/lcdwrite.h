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
 * static void TestLCD( void )
 *
 * Tests the LCD by printing some simple output to each line.
 *
 ******************************************************************************/

static void WriteLCD(char msg)
{
  FILE *lcd;
  static char ch;
  static char entry[4];

  lcd = fopen("/dev/lcd_display", "w");

  /* Write some simple text to the LCD. */
  if (lcd != NULL )
  {
    fprintf(lcd, "\n%s", msg);
  }

  printf("The LCD should be displaying \"%s\".\n", msg);

  fclose( lcd );

  return;
}

/******************************************************************
*  Function: GetInputString
*
*  Purpose: Parses an input string for the character '\n'.  Then
*           returns the string, minus any '\r' characters it
*           encounters.
*
******************************************************************/
void GetInputString( char* entry, int size, FILE * stream )
{
  int i;
  int ch = 0;

  for(i = 0; (ch != '\n') && (i < size); )
  {
    if( (ch = getc(stream)) != '\r')
    {
      entry[i] = ch;
      i++;
    }
  }
}

#endif /* LCDWRITE_H_ */
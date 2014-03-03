/*
 * rs232test.c
 *
 *  Created on: Nov 29, 2011
 *      Author: nash.reilly
 */

#include <stdio.h>
int main()
{
	printf("Starting...\n");
	char c;
	while(1){
		c=getchar();
		printf("%c",c);
	}
	return 0;
}

/*
 * gps.c
 *
 *  Created on: Oct 3, 2011
 *      Author: nash.reilly
 */

#include <stdio.h>
#include "lcdwrite.h"
#include "gpsparse.h"

#define Switches (volatile int *) 0x01001090
#define LEDs 	 (int *) 		  0x01001080

int main()
{
	char test;
	char cs;
	char pkt[83];
	char print[] = "Sixteen LCD char";
	char aorp;
	double height;
	struct packet packet_GGA;
	int temp;
	int time[3]      = {0, 0, 0};
	int latitude[3]  = {0, 0, 0};
	int longitude[3] = {0, 0, 0};

	while(1){
		test=getchar();																/*Gets first character from serial stream             */

		*LEDs = *Switches;
		temp  = *LEDs;

		if(checksum(test,cs,pkt)){													/*Pipes all the fun stuff to checksum and parse f'ns  */
			parse_GGA(pkt, &packet_GGA);												/*See gpsparse.h library for full view of functions   */
			temp = (temp & 0x01);
			if (temp == 1){
				sprintf(print, "Lat:%s%c", packet_GGA.latitude, packet_GGA.ns[0]);
				WriteLCD(print);
				sprintf(print, "Lon:%s%c", packet_GGA.longitude, packet_GGA.ew[0]);
				WriteLCD(print);
			};
			if (temp == 0){
				aorp = GMT_to_MST(time, packet_GGA.time);
				sprintf(print, "Time: %d:%02d:%02d%cM", time[0], time[1], time[2], aorp);
				WriteLCD(print);
				height = m_to_ft(packet_GGA.ant_ht);
				sprintf(print, "Elev: %5.2f ft", height);
				WriteLCD(print);
			};
			lat_to_deg(packet_GGA.latitude, latitude);
			long_to_deg(packet_GGA.longitude, longitude);
			printf("Latitude :  %d deg, %d.%05d min\n", latitude[0], latitude[1], latitude[2]);
			printf("Longitude: %d deg, %d.%05d min\n", longitude[0], longitude[1], longitude[2]);
		}
	};
	return 0;
}




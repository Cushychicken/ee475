/*
 * gpsparse.h
 *
 *  Created on: Oct 4, 2011
 *      Author: nash.reilly
 */

#ifndef GPSPARSE_H_
#define GPSPARSE_H_

#include <math.h>

struct packet{																	/*Data structure to store GGA packet fields             */
	char ident[6];																/*GPGGA field											*/
	char time[10];																/*Time field											*/
	char latitude[12];															/*Latitude field										*/
	char ns[2];																	/*North or south character field						*/
	char longitude[12];															/*Longitude field										*/
	char ew[2];																	/*East or west character field							*/
	char qual[2];																/*Quality field											*/
	char satnum[3];																/*Number of satellites									*/
	char hdop[5];																/*Horizontal dilution of precision						*/
	char ant_ht[7];																/*Antenna height										*/
	char ant_unt[2];															/*Units of antenna height								*/
	char geoid_diff[7];															/*Geoid differential									*/
	char geoid_unt[2];															/*Units of geoid differential							*/
	char cs[3];																	/*Checksum												*/
 };

int checksum(char test, char cs, char pkt[], char uart[]);									/*Function for verifying checksum					   	*/
char check_upd(char test, char cs);												/*Function for updating checksum character			  	*/
int atoh(char test);															/*Function for converting ASCII character to int value 	*/
void parse_GGA(char pkt[83], struct packet *packet_GGA);						/*Function to parse GGA packet into data structure     	*/
char GMT_to_MST(int *time, char *pkt_time);										/*Function to convert to Mt Standard time from GMT		*/
void lat_to_deg(char *pkt_lat, int *lat);										/*Function to convert packet latitude to integers		*/
void long_to_deg(char *pkt_lat, int *lon);										/*Function to convert packet longitude to integers		*/

int checksum(char test, char cs, char pkt[], char uart[]){
  int j,k,temp,check;

  j = 0;																		/*Sets checksum flag to 0                              	*/
  k = 0;

  if(test == 'G'){
	  cs  		= test;
	  pkt[j] 	= test;
	  j++;
	  k++;
	  test		= uart[k];
	  if(test == 'P'){
		  cs = check_upd(test,cs);
		  pkt[j] = test;
		  j++;
		  k++;
		  test		= uart[k];
		  if(test == 'G'){
			  cs = check_upd(test,cs);
			  pkt[j] 	= test;
			  j++;
			  k++;
			  test		= uart[k];
			  if(test == 'G'){
				  cs   	= check_upd(test,cs);
				  pkt[j] 	= test;
				  j++;
				  k++;
				  test		= uart[k];
				  if(test == 'A'){								/*If it makes it this far, GPGGA has been found       */
					  cs = check_upd(test,cs);
					  pkt[j] 	= test;
					  j++;
					  k++;
					  test		= uart[k];
					  while(test != '$'){						/*Loop reads in new character from serial and 		  */
						  pkt[j] = test;						/*populates an array of characters with the serial 	  */
						  j++;									/*characters										  */
						  k++;
						  test	 = uart[k];
					  };

					  for(j=0; (pkt[j]!= '*'); j++){			/*Calculates the checksum by looping through array	  */
						  if(j == 0){							/*Xors each successive ascii character with the stored*/
							  cs = pkt[j];						/*value of cs with the check_upd f'n				  */
						  } else {
							  cs = check_upd(pkt[j], cs);
						  }
					  };

					  temp  = (atoh(pkt[(j+1)]));
					  temp  = temp << 4;
					  check = (atoh(pkt[(j+2)]) + temp);

					  if (cs == check) {
						  return(1);
					  } else {
						  printf("GPS not available.\n");
					  }

				  };
			  };
		  };
	  };
  };
  return(0);
};

void parse_GGA(char pkt[83], struct packet *packet_GGA){
	int j,k;

	j = 0;
	k = 0;

	/****** Parses Identifier String ******/
	while(pkt[j] != ','){
		packet_GGA->ident[k] = pkt[j];
		j++;
		k++;
	}
	j++;
	packet_GGA->ident[k] = '\0';

	printf("\n");
	printf("Identifier                       = %s\n", packet_GGA->ident);

	k = 0;

	/****** Parses Time String ******/
	while(pkt[j] != ','){
		packet_GGA->time[k] = pkt[j];
		j++;
		k++;
	}
	j++;
	//k++;
	packet_GGA->time[k] = '\0';

	printf("Time                             = %s\n", packet_GGA->time);

	k = 0;

	/****** Parses Latitude String ******/
	while(pkt[j] != ','){
		packet_GGA->latitude[k] = pkt[j];
		j++;
		k++;
	}
	j++;
	packet_GGA->latitude[k] = '\0';

	printf("Latitude                         = %s", packet_GGA->latitude);

	k = 0;

	/****** Parses North/South String ******/
	while(pkt[j] != ','){
		packet_GGA->ns[k] = pkt[j];
		j++;
		k++;
	}
	j++;
	k++;
	packet_GGA->ns[k] = '\0';

	printf(" %c\n", packet_GGA->ns[0]);

	k = 0;

	/****** Parses Longitude String ******/
	while(pkt[j] != ','){
		packet_GGA->longitude[k] = pkt[j];
		j++;
		k++;
	}
	j++;
	/*k++;*/
	packet_GGA->longitude[k] = '\0';

	printf("Longitude                        = %s", packet_GGA->longitude);

	k = 0;

	/****** Parses East/West String ******/
	while(pkt[j] != ','){
		packet_GGA->ew[k] = pkt[j];
		j++;
		k++;
	}
	j++;
	k++;
	packet_GGA->ew[k] = '\0';

	printf(" %c\n", packet_GGA->ew[0]);

	k = 0;

	/****** Parses Quality String ******/
	while(pkt[j] != ','){
		packet_GGA->qual[k] = pkt[j];
		j++;
		k++;
	}
	j++;
	k++;
	packet_GGA->qual[k] = '\0';

	printf("Quality                          = %c\n", packet_GGA->qual[0]);

	k = 0;

	/****** Parses Satellite Number String ******/
	while(pkt[j] != ','){
		packet_GGA->satnum[k] = pkt[j];
		j++;
		k++;
	}
	j++;
	//k++;
	packet_GGA->satnum[k] = '\0';

	printf("Number of satellites             = %s\n", packet_GGA->satnum);

	k = 0;

	/****** Parses HDOP String ******/
	while(pkt[j] != ','){
		packet_GGA->hdop[k] = pkt[j];
		j++;
		k++;
	}
	j++;
	//k++;
	packet_GGA->hdop[k] = '\0';

	printf("Horizontal Dilution of Precision = %s\n", packet_GGA->hdop);

	k = 0;

	/****** Parses Antenna Height String ******/
	while(pkt[j] != ','){
		packet_GGA->ant_ht[k] = pkt[j];
		j++;
		k++;
	}
	j++;
	//k++;
	packet_GGA->ant_ht[k] = '\0';

	printf("Antenna Height                   = %s", packet_GGA->ant_ht);

	k = 0;

	/****** Parses Antenna Units String ******/
	while(pkt[j] != ','){
		packet_GGA->ant_unt[k] = pkt[j];
		j++;
		k++;
	}
	j++;
	//k++;
	packet_GGA->ant_unt[k] = '\0';

	printf(" %s\n", packet_GGA->ant_unt);

	k = 0;

	/****** Parses Geoid Differential String ******/
	while(pkt[j] != ','){
		packet_GGA->geoid_diff[k] = pkt[j];
		j++;
		k++;
	}
	j++;
	//k++;
	packet_GGA->geoid_diff[k] = '\0';

	printf("Geoid Differential               = %s", packet_GGA->geoid_diff);

	k = 0;

	/****** Parses Geoid Differential Units String ******/
	while(pkt[j] != ','){
		packet_GGA->geoid_unt[k] = pkt[j];
		j++;
		k++;
	}
	j++;
	//k++;
	packet_GGA->geoid_unt[k] = '\0';

	printf(" %s\n", packet_GGA->geoid_unt);

	k = 0;

	while((pkt[j] == ',')||(pkt[j] == '*')){
		j++;
	};

	/****** Parses Checksum String ******/
	while(pkt[j] != '\n'){
		packet_GGA->cs[k] = pkt[j];
		j++;
		k++;
	}
	j++;
	//k++;
	packet_GGA->cs[k] = '\0';

	printf("Checksum                         = %s\n", packet_GGA->cs);
	printf("\n");

	k = 0;
};

char check_upd(char test, char cs){
  cs = (cs ^ test);
  return(cs);
};

int atoh(char test){
	int temp;
	switch(test){
	case '0':
		temp = 0; break;
	case '1':
		temp = 1; break;
	case '2':
		temp = 2; break;
	case '3':
		temp = 3; break;
	case '4':
		temp = 4; break;
	case '5':
		temp = 5; break;
	case '6':
		temp = 6; break;
	case '7':
		temp = 7; break;
	case '8':
		temp = 8; break;
	case '9':
		temp = 9; break;
	case 'A':
		temp = 10; break;
	case 'B':
		temp = 11; break;
	case 'C':
		temp = 12; break;
	case 'D':
		temp = 13; break;
	case 'E':
		temp = 14; break;
	case 'F':
		temp = 15; break;
	default:
		temp = 0;
	};
	return(temp);
};

char GMT_to_MST(int *time, char *pkt_time){
	int j,t1;
	char aorp;
	aorp = 'A';
	for(j = 0; j < 6; j++){										/*Switch statement does all the fun stuff to convert to MST		*/
		switch(j){												/*Uses AtoH function in this library to properly parse time 	*/
		case 0:
			t1 = atoh(pkt_time[j])*10; break;
		case 1:													/*First IF converts to MST, second converts to nonmilitary time	*/
			t1 = t1 + atoh(pkt_time[j]);
			if (t1 > 6){
				t1 = t1 - 6;
			} else {
				t1 = t1 + 18;
			}
			if (t1 > 12){
				t1 = t1 - 12;
				aorp = 'P';
			};
			time[0] = t1; break;
		case 2:
			t1 = atoh(pkt_time[j])*10; break;
		case 3:
			t1 = t1 + atoh(pkt_time[j]);
			time[1] = t1; break;
		case 4:
			t1 = (atoh(pkt_time[j])*10);
		case 5:
			t1 = t1 + atoh(pkt_time[j]);
			time[2] = t1; break;
		default:
			t1 = 0; break;
		};
	};
	return(aorp);
};

double m_to_ft(char *pkt_ht){
	int j,temp;
	double tmp;
	temp = 0;
	for(j=0;j<4;j++){													/*Converts meters to feet through for loop*/
		temp = temp + atoh(pkt_ht[j])*pow(10,(3-j));					/*Reduces power of ten each time through loop*/
	}
	tmp = (((double)temp) * 3.28);										/*Multiplies meters into feet*/
	return(tmp);
};

void lat_to_deg(char *pkt_lat, int *lat){
	int j,k;
	int temp;
	temp = 0;
	k = 0;
	for(j=0;j<2;j++){													/*Converts latitude to double value*/
		temp = temp + (atoh(pkt_lat[j])*pow(10,(1-j)));			/*Reduces power of ten each time through loop*/
	};
	lat[k] = temp;
	k++;
	temp = 0;
	for(j=0;j<2;j++){
		temp = temp + atoh(pkt_lat[j+2])*pow(10,(1-j));
	};
	lat[k] = temp;
	k++;
	temp = 0;
	for(j=0;j<5;j++){
		temp = temp + atoh(pkt_lat[j+5])*pow(10,(4-j));
	};
	lat[k] = temp;
	k++;
	return;
}

void long_to_deg(char *pkt_long, int *lon){
	int j,k;
	int temp;
	temp = 0;
	k = 0;
	for(j=0;j<3;j++){													/*Converts latitude to double value*/
		temp = temp + (atoh(pkt_long[j])*pow(10,(2-j)));			/*Reduces power of ten each time through loop*/
	};
	lon[k] = temp;
	k++;
	temp = 0;
	for(j=0;j<2;j++){
		temp = temp + atoh(pkt_long[j+3])*pow(10,(1-j));
	};
	lon[k] = temp;
	k++;
	temp = 0;
	for(j=0;j<5;j++){
		temp = temp + atoh(pkt_long[j+6])*pow(10,(4-j));
	};
	lon[k] = temp;
	k++;
	return;
}

#endif /* GPSPARSE_H_ */

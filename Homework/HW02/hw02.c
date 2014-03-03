
#include <stdio.h>
#include <ctype.h>

FILE *pfile;			//File Pointer
char c;					//Character for evaluation
int VERBOSE;			//Troubleshooting flow enable integer
int debugme;			//debugme test integer

void main(){
	VERBOSE = 0;

	pfile = fopen("Gettysburg_Address.txt", "rt");
    
	c = 'a';

	while (c != EOF) {
		c = fgetc(pfile);				// Character slurp from file
		
		if (VERBOSE != 0){				// Troubleshooting statement; prints character, runs ctype f'ns.
			printf("%c\n");				// 
			debugme = ispunct(c);
			if (debugme != 0){
				printf("The character is a punctuation mark.");
			};
			debugme = isupper(c);
			if (debugme != 0){
				printf("The character is uppercase.");
			};
			debugme = islower(c);
			if (debugme != 0){
				printf("The character is lowercase.");
			};
		};

		if (ispunct(c)){				// Requisite switch statement for the character being punctuation
			switch(c){
				case ',':
					printf("%c is a comma."); break;
				case '-':
					printf("%c is a hyphen."); break;
				case '.':
					printf("%c is a period."); break;
				case ' ':
					printf("%c is whitespace."); break;
			};
		};

		if (isupper(c)){
			printf("%c is an uppercase character.\n");
		}
		
		if (islower(c)){
			printf("%c is a lowercase character.\n");
		}

	};
	
	fclose(pfile);

}
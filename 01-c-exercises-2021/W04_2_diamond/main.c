#include <stdio.h>
int main() {
	for(int i=0; i<9; i++) {
		printf("\n");
		int number_of_blanks = 5 - i;
		if(number_of_blanks <= 0) {
			number_of_blanks = number_of_blanks * (-1) + 2;
		}
		for(int j=0; j<number_of_blanks; j++) {
			printf(" ");
		}
		for(int j=0; j<2*(5-number_of_blanks)+1; j++) {
			printf("*");
		}
	}
return 0;
}

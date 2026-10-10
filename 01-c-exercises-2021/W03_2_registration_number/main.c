#include <stdio.h>
int main() {
	int num;
	printf("Enter first seven digit of your resident registration number : ");
	scanf("%d", &num);

	int year = num / 100000;
	int month = num / 1000 % 100;
	int day = num / 10 % 100;
	int gender = num % 10;

	if(gender <= 2)
		year += 1900;
	else
		year += 2000;

	printf("You born on %d / %d / %d.\n", year, month, day);
	switch(gender){
		case 1:
			printf("Your Gender is male (born 1900-1999)\n");
			break;
		case 2:
			printf("Your Gender is female (born 1900-1999)\n");
			break;
		case 3:
			printf("Your Gender is male (born 2000-present)\n");
			break;
		case 4:
			printf("Your Gender is female (born 2000-present)\n");
			break;
	}

}

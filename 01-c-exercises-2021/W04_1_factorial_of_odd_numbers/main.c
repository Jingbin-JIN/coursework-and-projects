#include <stdio.h>
int main() {
	int input;
	scanf("%d",&input);
	printf("i     !\n");

	for(int i = 1; i <= input; i++) {
		if(i % 2 != 0) {
			// input is odd
			int fact = 1;
			for(int j=1; j<=i; j++) {
				fact = fact * j;
			}
			if(i >= 10) {
				printf("%d", i);
				for(int j=0; j<4; j++) {
					printf(" ");
				}
			} else
				printf("%d     ", i);
			printf("%d\n", fact);
		}
	}

	return 0;
}

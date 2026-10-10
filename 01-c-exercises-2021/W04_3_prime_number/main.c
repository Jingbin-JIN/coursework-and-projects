#include <stdio.h>
int main() {
	int num = 0;
	scanf("%d", &num);

	int i = 0;
	for(i = 2; i < num; i++) {
		if(num % i == 0) {
			printf("It is not a Prime Number. \n");
			break;
		}
	}
	if(i == num)
		printf("It is a Prime Number.\n");

	return 0;
}

#include <stdio.h>
void reversePrint(int number){
	int reversed_num = 0;
	while (1) {
		int digit = number % 10;
		reversed_num += digit;
		number /= 10;
		if(number == 0)
			break;
		reversed_num *= 10;

	}
	printf("%d\n", reversed_num);
	return;
}

int main() {
	int num;
	scanf("%d",&num);
	reversePrint(num);

	return 0;
}

#include <stdio.h>
int checkPrime(int a){
	for(int i = 2; i <= a/2; i++)
		if(a % i == 0)
			return 0;
	return 1;
}

int main() {
	int input, flag = 0;
	scanf("%d",&input);

	for(int i = 2; i <= input/2; i ++)
		if(checkPrime(i) == 1)
			if(checkPrime(input-i) == 1){
				flag = 1;
				printf("%d = %d + %d\n", input, i, input-i);
			}

	if(!flag)
		printf("Not possible\n");

	return 0;
}

#include <stdio.h>
int addNumbers(int a){
	int result = 0;
	for(int i = 1; i <= a; i++){
		result += i;
	}
	return result;
}

int main() {
	int input;
	scanf("%d",&input);
	int output = addNumbers(input);
	printf("Sum = %d",output);
	return 0;
}

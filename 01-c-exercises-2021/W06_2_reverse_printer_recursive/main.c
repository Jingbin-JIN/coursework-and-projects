#include <stdio.h>
void reversePrint(int number){
	if(!number) {
		printf("\n");
		return;
	}
	printf("%d",number%10);
	reversePrint(number/10);
	return;
}
int main() {
	int num;
	scanf("%d",&num);
	reversePrint(num);

	return 0;
}

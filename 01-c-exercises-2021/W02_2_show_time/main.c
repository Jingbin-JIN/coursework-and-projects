#include <stdio.h>
int main() {
	int input = 0;
	scanf("%d", &input);

	int hour = input / 3600;
	int min = input % 3600 / 60;
	int sec = input % 60;

	printf("%d:%d:%d\n", hour, min, sec);


	return 0;
}

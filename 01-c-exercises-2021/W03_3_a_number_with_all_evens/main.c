#include <stdio.h>

int main()
{
	int num;
	scanf("%d", &num);

	if(num % 2 == 0 &&
		 num / 10 % 2 == 0 &&
		 num / 100 % 2 == 0 &&
		 num / 1000 % 2 == 0 &&
		 num / 10000 % 2 == 0) {
		printf("%d is our target.", num);
	} else {
		printf("%d is NOT our target.", num);
	}

  return 0;
}

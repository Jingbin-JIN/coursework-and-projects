	#include <stdio.h>

int main()
{
	char ch1, ch2;
	scanf("%c %c", &ch1, &ch2);

	printf("The distance between %c(%d) and %c(%d) is %d.\n", ch1, ch1, ch2, ch2, (ch1-ch2)>0?ch1-ch2:ch2-ch1);

	return 0;
}

#include <stdio.h>

int main()
{
  char ch;
  ch = getchar();

	if (ch >= 'a' && ch <= 'z') {
		printf("%c\n", ch - 'a' + 'A');
	} else {
		printf("%c\n", ch - 'A' + 'a');
	}

	return 0;
}

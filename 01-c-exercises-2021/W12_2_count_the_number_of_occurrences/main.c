#include <stdio.h>
#include <string.h>

int main()
{
	char str1[100] = {0}, str2[100] = {0};

	fgets(str1, 100, stdin);
	fgets(str2, 100, stdin);

	str1[strlen(str1)-1] = 0;
	str2[strlen(str2)-1] = 0;

	int count = 0;
	for(int i=0; i<strlen(str1); i++) {
		if(strncmp(str1+i, str2, strlen(str2)) == 0)
			count++;
	}


	printf("First string: \"%s\"\nSecond string: \"%s\"\n", str1, str2);
	printf("The number of occurrences is %d.\n", count);

	return 0;
}

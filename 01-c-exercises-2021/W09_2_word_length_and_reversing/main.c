#include <stdio.h>
/* string.h must not be used in this exercise */
int main()
{
	char a[105];
	scanf("%s", a);

	int cnt = 0;
	for(int i=0; i<105; i++) {
		if(a[i] == '\0'){
			break;
		}
		cnt++;
	}

	printf("Word Length: %d\n",  cnt);
	printf("Reversed word: ");

	for(int i=cnt-1; i>=0; i--){
		printf("%c",a[i]);
	}
	printf("\n");

	return 0;
}

#include <stdio.h>
int main() {
	int a,b,c;
	scanf("%d %d %d", &a, &b, &c);

	if( a >= b+c )
		printf("Impossible");
	else if( b >= a+c )
		printf("Impossible");
	else if( c >= a+b )
		printf("Impossible");
	else
		printf("Possible");


	return 0;
}

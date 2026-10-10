#include <stdio.h>
int count = -1;
void solve(int num)
{
	count++;
	if(num == 1) {
	printf("%d",count);
	}
	else if(num%2 == 0) {
		solve(num/2);
	}
	else {
		solve(3*num + 1);
	}
	return;
}
int main() {
	int num;
	scanf("%d",&num);
	solve(num);
	return 0;
}

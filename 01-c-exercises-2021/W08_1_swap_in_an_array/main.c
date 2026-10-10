#include <stdio.h>
#define SIZE 10

int main() {
	int x,y;
	scanf("%d %d", &x, &y);

	int data[SIZE] = {};
	for(int i=0; i<SIZE; i++) {
		data[i] = i;
	}

	for (int i=0; i<SIZE; i++) {
		printf("%d", data[i]);
		printf(" ");
	}
	puts("");

	int tmp = data[x];
	data[x] = data[y];
	data[y] = tmp;

	for(int i=0; i<SIZE; i++) {
		printf("%d", data[i]);
		printf(" ");
	}
	puts("");

	return 0;
}

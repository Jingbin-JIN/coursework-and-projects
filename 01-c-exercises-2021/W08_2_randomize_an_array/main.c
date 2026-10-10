#include <stdio.h>
#include <stdlib.h>

#define SIZE 10

int main() {
	srand(511);
	int suffling;
	scanf("%d", &suffling);

	int data[SIZE] = {};
	for(int i=0; i<SIZE; i++) {
		data[i] = i;
	}

	for(int i=0; i<SIZE; i++) {
		printf("%d ", data[i]);
	}
	puts("");

	for(int i=0; i<suffling; i++) {
		int a = rand() % 10;
		int b = rand() % 10;

		int tmp = data[a];
		data[a] = data[b];
		data[b] = tmp;
	}
	for(int i=0; i<SIZE; i++) {
		printf("%d ", data[i]);
	}
	puts("");

	return 0;
}

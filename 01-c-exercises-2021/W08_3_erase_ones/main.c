#include <stdio.h>
#include <stdlib.h>

int main() {
	int seed;
	scanf("%d", &seed);
	srand(seed);

	int data[30] = {};
	for(int i=0; i<30; i++) {
		data[i] = 1+rand()%10;
	}

	for(int i=0; i<30; i++) {
		printf("%d ", data[i]);
	}
	puts("");

	int dst = 0;
	for(int src=0; src<30; src++) {
		data[dst] = data[src];
		if(data[src] != 1)
			dst++;
	}

	for(int i=0; i<dst; i++) {
		printf("%d ", data[i]);
	}

	puts("");

	return 0;
}

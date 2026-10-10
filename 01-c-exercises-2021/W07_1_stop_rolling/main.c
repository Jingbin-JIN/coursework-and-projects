#include <stdio.h>
#include <stdlib.h>

int main() {
  int seed;
  scanf("%d", &seed);
  srand(seed);

	int prev = -1, curr = -2;

	while (prev != curr) {
		prev = curr;
		curr = 1 + rand()%6;
		printf("%d", curr);
		printf(" ");
	}

return 0;
}

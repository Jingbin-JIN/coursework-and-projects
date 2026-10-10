#include <stdio.h>

int main()
{
	int nums[10] = {};

	for(int i=0; i<10; i++) {
		scanf("%d", &nums[i]);
	}

	int max = nums[0];
	int max_idx = 0;
	for(int i=0; i<10; i++) {
		if(max < nums[i]) {
			max = nums[i];
			max_idx = i;
		}
	}

	printf("Array[%d] = %d\n", max_idx, max);

	return 0;
}

#include <stdio.h>

void sum_arrays(int array1[][2], int array2[][2]){
	for(int i=0; i<2; i++){
		for(int j=0; j<2; j++){
			int sum = array1[i][j] + array2[i][j];
			int sub = array1[i][j] - array2[i][j];
			array1[i][j] = sum;
			array2[i][j] = sub;
		}
	}

	return;
}

int main()
{
	int nums1[2][2], nums2[2][2];

	for(int i=0; i<2; i++)
		for(int j=0; j<2; j++)
			scanf("%d", &nums1[i][j]);
	for(int i=0; i<2; i++)
		for(int j=0; j<2; j++)
			scanf("%d", &nums2[i][j]);

	printf("Original Arrays:\n");
	for(int i=0; i<2; i++) {
		for(int j=0; j<2; j++){
			printf("%d ", nums1[i][j]);
		}
		puts("");
	}
	puts("");

	for(int i=0; i<2; i++) {
		for(int j=0; j<2; j++)
			printf("%d ", nums2[i][j]);
		puts("");
	}
	puts("");

	sum_arrays(nums1, nums2);

	printf("Returned Arrays:\n");
	for(int i=0; i<2; i++) {
		for(int j=0; j<2; j++)
			printf("%d ", nums1[i][j]);
		puts("");
	}
	puts("");

	for(int i=0; i<2; i++) {
		for(int j=0; j<2; j++)
			printf("%d ", nums2[i][j]);
		puts("");
	}
	puts("");

	return 0;
}

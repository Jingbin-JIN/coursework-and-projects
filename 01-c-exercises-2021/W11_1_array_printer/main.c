#include <stdio.h>

void Print(int* source)
{
	printf("Input array: ");
	for(int i=0; i<5; i++)
		printf("%d ", *(source+i));

}
int main() {
	int arr[5];

	for (int i=0; i<5; i++)
		scanf ("%d", arr+i);

	Print(arr);

	return 0;
}

#include <stdio.h>

void Swap(int* source, int* dest)
{
	int temp;
	for (int i=0; i<5; i++) {
		temp = *(source+i);
		*(source+i) = *(dest+i);
		*(dest+i) = temp;
	}

	printf("Source array after swapping: ");
	for (int i=0; i<5; i++)
		printf("%d ", *(source+i));
	printf("\n");

	printf("Dest array after swapping: ");
	for (int i=0; i<5; i++)
		printf("%d ", *(dest+i));
}
int main() {
	int src[5];
	int dst[5];

	printf("\nEnter 5 elements in source array: ");
	for (int i=0; i<5; i++)
		scanf ("%d", src+i);

	printf("Enter 5 elements in dest array: ");
	for (int i=0; i<5; i++)
		scanf ("%d", dst+i);

	Swap(src, dst);
}

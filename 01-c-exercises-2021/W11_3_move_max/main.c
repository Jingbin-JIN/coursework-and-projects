#include <stdio.h>
#define SIZE 10

void move_max(int* array){
	for( int i = 0; i < SIZE - 1; i++ ){
		if (array[i] > array[i+1]) {
			int temp = array[i];
			array[i] = array[i+1];
			array[i+1] = temp;
		}

		printf("[%d] ", i+1);
		for( int j = 0; j < SIZE; j++ )
			printf("%d ", array[j]);
		puts("");
	}
}

int main(){
	int array[SIZE];

	for( int i = 0; i < SIZE; i++ )
		scanf("%d", &array[i]);

	move_max( array );
	printf("Result:\n");
	for( int i = 0; i < SIZE; i++ )
		printf("%d ", array[i]);
	puts("");

	return 0;
}

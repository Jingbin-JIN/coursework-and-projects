#include <stdio.h>

int main() {
	// Make the pointer p1 point to x1
	// Use p1 to print the value of x1
	int x1, *p1;
	x1 = 10;
	p1 = &x1;
	printf("%d\n", *p1);

	// Assign 10 to x2 using p2
	// Print the value with x2
	int x2, *p2;
	p2 = &x2;
	*p2 = 10;
	printf("%d\n", x2);

	// Set p3 to point x3 by assigning the address of x3 to p3
	// Assign p3 to p4 to make p3 and p4 point to the same variable, x3
	// Assign 10 to x3 using p4 and print the value with x3
	int x3, *p3, *p4;
	p3 = &x3;
	p4 = p3;
	*p4 = 10;
	printf("%d\n", x3);

	return 0;
}

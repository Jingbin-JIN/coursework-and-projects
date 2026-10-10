#include <stdio.h>
int main() {
	float PI = 3.14159;
	float r = 0;

	printf("Enter the radius: ");
	scanf("%f", &r);

	printf("Diameter of a circle: %f\n", 2*r);
	printf("Circumference of a circle: %f\n", 2*PI*r);
	printf("Area of a circle: %f\n", PI*r*r);
	return 0;
}

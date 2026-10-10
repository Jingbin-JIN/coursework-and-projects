//
//  main.c
//  EEE2022_2021313185_05
//
//  Created by Jingbin JIN on 2022/03/28.
//

#include <stdio.h>

int year, month;
int array[] = { 31, 28, 31,30,31,30,31,31,30,31,30,31 };
int a, b, c, d, e;
int main() {
    scanf("%d %d", &year, &month);
    printf(" Sun Mon Tue Wed Thu Fri Sat\n");
    if (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0))
        array[1] = 29;
    a = year - 1;
    b = (a + a / 4 - a / 100 + a / 400 + 1);
    for (c = 1; c < month; c++) {
        b += array[c - 1];
    }
    b = b % 7;
    for (d = 0; d < b; d++) {
        printf("    ");
        
    }
    
    for (e = 1; e <= array[month - 1]; e++) {
        printf("%4d", e);
        if ((e + b) % 7 == 0)
            printf("\n");
        }
    return 0;

}


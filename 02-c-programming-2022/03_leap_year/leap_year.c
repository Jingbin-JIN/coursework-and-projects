//
//  main.c
//  EEE2022_2021313185
//
//  Created by Jingbin JIN on 2022/03/14.
//

#include <stdio.h>

int main() {
    int year, result;
    scanf("%d", &year);
    result = ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) ? 1:0;
    printf("%d", result);
    return 0;
}


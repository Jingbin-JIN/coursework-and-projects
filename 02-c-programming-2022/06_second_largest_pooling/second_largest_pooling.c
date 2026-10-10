//
//  main.c
//  2022_2021313185_06
//
//  Created by Jingbin JIN on 2022/04/04.
//

#include <stdio.h>

int input[1024][1024];
int get_2nd_largest_array[4];

int get_2nd_largest(){
    int largest_num;
    int second_largest_num;
    largest_num = get_2nd_largest_array[0];
    second_largest_num = get_2nd_largest_array[0];
    for(int i =1; i < 4; i++){
        if( get_2nd_largest_array[i]>largest_num){
            second_largest_num = largest_num;
            largest_num = get_2nd_largest_array[i];
        }
        else if(get_2nd_largest_array[i]>second_largest_num){
            second_largest_num=get_2nd_largest_array[i];
        }
    }
    return second_largest_num;
}

void pool_matrix(int n){
    for (int x=0; x<n/2; x++){
        for (int y=0; y<n/2; y++){
            get_2nd_largest_array[0]=input[2*x][2*y];
            get_2nd_largest_array[1]=input[2*x][2*y+1];
            get_2nd_largest_array[2]=input[2*x+1][2*y];
            get_2nd_largest_array[3]=input[2*x+1][2*y+1];
            input[x][y]=get_2nd_largest();
        }
    }
}

int main()
    {
    FILE*ifp;
    int n;
    ifp = fopen("input.txt", "r");
    fscanf(ifp, "%d", &n);
    for (int x = 0; x < n; x++)
        {
        for (int y = 0; y < n; y++)
            {
            fscanf(ifp, "%d", &input[x][y]);
            }
        }
    fclose(ifp);
    for (; n > 1; n = n / 2)
        {
        pool_matrix(n);
        }
    printf("%d", input[0][0]);
    return 0;
    }

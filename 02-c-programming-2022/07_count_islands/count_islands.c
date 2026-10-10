//
//  main.c
//  EEE2022_2021313185_07
//
//  Created by Jingbin JIN on 2022/04/18.
//

#include <stdio.h>
FILE* ifp;
int width, height;
int map[1024][1024];
void land(int i, int j) {
    if (map[i][j] == 0) {
        return;
    }
    
    map[i][j] = 0;
    if (i != 0)
    {
        land(i - 1, j);
    }
    if (i != height - 1)
    {
        land(i + 1, j);
    }
    if (j != 0)
    {
        land(i, j - 1);
    }
    if (j != width - 1)
    {
        land(i, j + 1);
    }
}
int main() {
    ifp = fopen("input.txt", "r");
    fscanf(ifp, "%d %d", &width, &height);
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            fscanf(ifp, "%d", &map[i][j]);
        }
    }
    
    int count = 0;
    
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
           
            if (map[i][j] == 1) {
                
                land(i, j);
                 
                count += 1;
            }
            
        }
    }

    printf("%d", count);
    fclose(ifp);
    return 0;
}

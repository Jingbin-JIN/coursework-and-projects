//
//  main.c
//  EEE2022_2021313185_08
//
//  Created by Jingbin JIN on 2022/04/25.
//

#include <stdio.h>

char* front, * rear, * begin, * end;

void enqueue(char in, int* full, int* empty)
{
    *empty = 0;
    rear = (rear == end) ? begin : rear + 1;
    *rear = in;
    if (((rear == end) && (front == begin)) || (front == rear + 1))
        * full = 1;
    printf("PUT %c:", in);
}

char dequeue(int* full, int* empty)
{
    *full = 0;
    char out_char = *front;
    front = (front == end) ? begin : front + 1;
    if (front == rear + 1)
        *empty = 1;
    return out_char;
}

void prunt_Q(int full, int empty)
{
    
    if (empty == 1)
        printf("\n");
    else
    {
        char* print_char = front;
        if (print_char == rear)
            printf(" %c\n", *print_char);
        else
        {
            while (print_char != rear)
            {
                printf(" %c", *print_char);
                print_char = (print_char == end) ? begin : print_char + 1;
            }
            printf(" %c\n", *print_char);
        }
    }
}
int main()
{
    char Q[8];
    front = &Q[1];
    rear = &Q[0];
    begin = &Q[0];
    end = &Q[7];

    int N = 0;
    char put_out_char[4];
    int full = 0;
    int empty = 1;

    FILE* ifp;
    ifp = fopen("input.txt", "r");
    fscanf(ifp, "%d", &N);
    fgets(put_out_char, 4, ifp);

    for (int i = 0; i < N; i++)
    {
        printf("%d: ", i + 1);
        fgets(put_out_char, 4, ifp);

        if (put_out_char[0] == 'E')
        {
            if (full == 1)
            {
                printf("FULL:");
                char* full_char = front;
                while (full_char != rear)
                {
                    printf("%c ", *full_char);
                    full_char = (full_char == end) ? begin : full_char + 1;
                }
                printf("%c\n", *full_char);
                continue;
            }
            else
                enqueue(put_out_char[1], &full, &empty);
        }
        if (put_out_char[0] == 'D')
        {
            if (empty == 1)
            {
                printf("EMPTY:\n");
                continue;
            }
            else
                printf("OUT %c:", dequeue(&full, &empty));
        }
        prunt_Q(full, empty);
    }
    fclose(ifp);
    return 0;
}

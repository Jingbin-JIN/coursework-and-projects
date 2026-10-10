//
//  main.c
//  EEE2022_2021313185_10
//
//  Created by Jingbin JIN on 2022/05/09.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct
{
    int ID;
    int f_height;
    int i_height;
    int weight;
    int t_height;
} Student;

int main(int argc, char* argv[])
{
    int num, tie_num = 0, average_height = 0, average_weight = 0;
    Student student[100], temp;
    FILE* input;
    FILE* output;
    char f1[100] = "output_";
    char f2[100];
    char f3[100] = ".txt";

    input = fopen(argv[1], "r");
    fscanf(input, "%d", &num);
    for (int i = 0; i < num; i++)
    {
        fscanf(input, "%d %d %d %d", &student[i].ID, &student[i].f_height, &student[i].i_height, &student[i].weight);
        student[i].t_height = (student[i].f_height * 12 + student[i].i_height);
    }
    fclose(input);
    for (int i = 0; i < num - 1; i++)
    {
        for (int j = 0; j < num - 1; j++)
        {
            if (student[j].t_height < student[j + 1].t_height)
            {
                temp = student[j];
                student[j] = student[j + 1];
                student[j + 1] = temp;
            }
        }
    }
    for (int i = 0; i < 100; i++)
    {
        if (student[0].t_height == student[i].t_height)
            tie_num++;
        else
            break;
    }
    snprintf(f2, sizeof(f2), "%d", num);
    strcat(f1, f2);
    strcat(f1, f3);
    output = fopen(f1, "w");
    if (tie_num == 1)
        fprintf(output, "%d' %d'': %d\n", student[0].f_height, student[0].i_height, student[0].ID);
    else
    {
        fprintf(output, "%d' %d'': %d", student[0].f_height, student[0].i_height, student[0].ID);
        for (int i = 1; i < tie_num; i++)
        {
            fprintf(output, " %d", student[i].ID);
        }
        fprintf(output, "\n");
    }
    tie_num = 0;
    for (int i = num - 1; i > 0; i--)
    {
        if (student[num-1].t_height == student[i].t_height)
            tie_num++;
        else
            break;
    }
    if (tie_num == 1)
        fprintf(output, "%d' %d'': %d\n", student[num - 1].f_height, student[num - 1].i_height, student[num - 1].ID);
    else
    {
        fprintf(output, "%d' %d'': %d", student[num - 1].f_height, student[num - 1].i_height, student[num - 1].ID);
        for (int i = 1; i < tie_num; i++)
        {
            fprintf(output, " %d", student[num - 1 - i].ID);
        }
        fprintf(output, "\n");
    }
    tie_num = 0;
    for (int i = 0; i < num; i++)
    {
        average_height += student[i].t_height;
    }
    average_height = average_height / num;
    fprintf(output, "%d' %d''\n", average_height / 12, average_height % 12);
    for (int i = 0; i < num - 1; i++)
    {
        for (int j = 0; j < num - 1; j++)
        {
            if (student[j].weight < student[j + 1].weight)
            {
                temp = student[j];
                student[j] = student[j + 1];
                student[j + 1] = temp;
            }
        }
    }
    for (int i = 0; i < 100; i++)
    {
        if (student[0].weight == student[i].weight)
            tie_num++;
        else
            break;
    }
    if (tie_num == 1)
        fprintf(output, "%dkg: %d\n", student[0].weight, student[0].ID);
    else
    {
        fprintf(output, "%dkg: %d", student[0].weight, student[0].ID);
        for (int i = 1; i < tie_num; i++)
        {
            fprintf(output, " %d", student[i].ID);
        }
        fprintf(output, "\n");
    }
    tie_num = 0;
    for (int i = num - 1; i > 0; i--)
    {
        if (student[num - 1].weight == student[i].weight)
            tie_num++;
        else
            break;
    }
    if (tie_num == 1)
        fprintf(output, "%dkg %d\n", student[num - 1].weight, student[num - 1].ID);
    else
    {
        fprintf(output, "%dkg %d", student[num - 1].weight, student[num - 1].ID);
        for (int i = 1; i < tie_num; i++)
        {
            fprintf(output, " %d", student[num - 1 - i].ID);
        }
        fprintf(output, "\n");
    }
    tie_num = 0;
    for (int i = 0; i < num; i++)
    {
        average_weight += student[i].weight;
    }
    average_weight = average_weight / num;
    fprintf(output, "%dkg", average_weight);
    fclose(output);
    return 0;
}


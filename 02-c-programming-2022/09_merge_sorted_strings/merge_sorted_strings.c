//
//  main.c
//  EEE2022_2021313185_09
//
//  Created by Jingbin JIN on 2022/05/02.
//

#include <stdio.h>
#include <string.h>
FILE* ifp;
char a[128];
char b[1024];
char c[1024];
int N;

int main(int argc, char*argv[])
{
    ifp = fopen(argv[1], "r");
    fscanf(ifp, "%d", &N);
    fgets(a, 128, ifp);
    fgets(a, 128, ifp);
    int len = strlen(a);
    a[len - 1] = '\0';

    for (int i = 0; i < len; i++)
        b[i] = a[i];

    for (int o = 0; o < N - 1; o++)
    {
        fgets(a, 128, ifp);
        int len = strlen(a);
        a[len - 1] = (a[len - 1] == '\n') ? '\0' : a[len - 1];
        int a_count = 0;
        int b_count = 0;
        int c_count = 0;

        for (c_count = 0; c_count < 1024; c_count++)
        {
            if (a[a_count] == '\0')
            {
                c[c_count] = b[b_count];
                b_count++;
                continue;
            }

            else if (b[b_count] == '\0')
            {
                c[c_count] = a[a_count];
                a_count++;
                continue;
            }

            if (a[a_count] < 91)
            {
                if (b[b_count] < 91)
                {
                    if (a[a_count] == b[b_count] && (b[b_count + 1] < 91) && (a[a_count] <= b[b_count + 1]))
                    {
                        c[c_count] = a[a_count];
                        a_count++;
                        c_count++;
                        c[c_count] = b[b_count];
                        b_count++;
                        continue;
                    }

                    else if (a[a_count] == b[b_count] && (b[b_count + 1] > 91) && (a[a_count] <= b[b_count + 1] - 32))
                    {
                        c[c_count] = a[a_count];
                        a_count++;
                        c_count++;
                        c[c_count] = b[b_count];
                        b_count++;
                        continue;
                    }

                    else if (a[a_count] > b[b_count])
                    {
                        c[c_count] = b[b_count];
                        b_count++;
                    }

                    else
                    {
                        c[c_count] = a[a_count];
                        a_count++;
                    }
                }
                else
                {
                    if ((a[a_count] == b[b_count] - 32) && (b[b_count + 1] < 91) && (a[a_count] <= b[b_count + 1]))
                    {
                        c[c_count] = a[a_count];
                        a_count++;
                        c_count++;
                        c[c_count] = b[b_count];
                        b_count++;
                        continue;
                    }

                    else if ((a[a_count] == b[b_count] - 32) && (b[b_count + 1] > 91) && (a[a_count] <= b[b_count + 1] - 32))
                    {
                        c[c_count] = a[a_count];
                        a_count++;
                        c_count++;
                        c[c_count] = b[b_count];
                        b_count++;
                        continue;
                    }

                    else if (a[a_count] > b[b_count] - 32)
                    {
                        c[c_count] = b[b_count];
                        b_count++;
                    }
                    else
                    {
                        c[c_count] = a[a_count];
                        a_count++;
                    }
                }
            }
            else if (a[a_count] > 91)
            {
                if (b[b_count] < 91)
                {
                    if ((a[a_count] - 32 == b[b_count]) && (b[b_count + 1] < 91) && (a[a_count] - 32 <= b[b_count + 1]))
                    {
                        c[c_count] = a[a_count];
                        a_count++;
                        c_count++;
                        c[c_count] = b[b_count];
                        b_count++;
                        continue;
                    }

                    else if ((a[a_count] - 32 == b[b_count]) && (b[b_count + 1] > 91) && (a[a_count] <= b[b_count + 1]))
                    {
                        c[c_count] = a[a_count];
                        a_count++;
                        c_count++;
                        c[c_count] = b[b_count];
                        b_count++;
                        continue;
                    }
                    else if (a[a_count] - 32 > b[b_count])
                    {
                        c[c_count] = b[b_count];
                        b_count++;
                    }
                    else
                    {
                        c[c_count] = a[a_count];
                        a_count++;
                    }
                }
                else
                {
                    if ((a[a_count] == b[b_count]) && (b[b_count + 1] < 91) && (a[a_count] - 32 <= b[b_count + 1]))
                    {
                        c[c_count] = a[a_count];
                        a_count++;
                        c_count++;
                        c[c_count] = b[b_count];
                        b_count++;
                        continue;
                    }

                    else if ((a[a_count] == b[b_count]) && (b[b_count + 1] > 91) && (a[a_count] <= b[b_count + 1] - 32))
                    {
                        c[c_count] = a[a_count];
                        a_count++;
                        c_count++;
                        c[c_count] = b[b_count];
                        b_count++;
                        continue;
                    }

                    else if (a[a_count] > b[b_count])
                    {
                        c[c_count] = b[b_count];
                        b_count++;
                    }

                    else
                    {
                        c[c_count] = a[a_count];
                        a_count++;
                    }
                }
            }
        }
        for (int p = 0; p < 1024; p++)
            b[p] = c[p];
    }
    printf("%s\n", c);
    fclose(ifp);
    return 0;
}


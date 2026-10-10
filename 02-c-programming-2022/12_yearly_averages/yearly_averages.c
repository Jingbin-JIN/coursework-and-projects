//
//  EEE2022 assignment 12 (part 2), May 2022
//  Created by Jingbin JIN
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#ifdef _WIN32
#include <direct.h>
#define getcwd _getcwd
#else
#include <unistd.h>
#endif


char* strsep(char** stringp, const char* delim)
{
	char* rv = *stringp;
	if (rv)
	{
		*stringp += strcspn(*stringp, delim);
		if (**stringp)
			*(*stringp)++ = '\0';
		else
			*stringp = 0;
	}
	return rv;
}

int main(int argc, char* argv[])
{
	char* index;
	char* file_name;
	if (argc < 3)
	{
		fprintf(stderr, "usage: %s <csv file> <SP|DIV|EARN|CPI|LIR|RP|RDIV|REARN|PE> [-p]\n", argv[0]);
		return 1;
	}
	file_name = argv[1];
	index = argv[2];
	char f1[200];
	char f2[200];
	snprintf(f1, sizeof(f1), "%s_%s", index, file_name);
	snprintf(f2, sizeof(f2), "%s_%s.dat", index, file_name);
	int plot = 0;
	int index_counter = 3;
	if ((strcmp(index, "SP") == 0))
		index_counter = 2;
	else if ((strcmp(index, "DIV") == 0))
		index_counter = 3;
	else if ((strcmp(index, "EARN") == 0))
		index_counter = 4;
	else if ((strcmp(index, "CPI") == 0))
		index_counter = 5;
	else if ((strcmp(index, "LIR") == 0))
		index_counter = 6;
	else if ((strcmp(index, "RP") == 0))
		index_counter = 7;
	else if ((strcmp(index, "RDIV") == 0))
		index_counter = 8;
	else if ((strcmp(index, "REARN") == 0))
		index_counter = 9;
	else if ((strcmp(index, "PE") == 0))
		index_counter = 10;
	if (argc > 3 && strcmp(argv[3], "-p") == 0)
		plot = 1;

	FILE* ifp, * ofp;
	ifp = fopen(file_name, "r");
	ofp = fopen(f2, "w");

	char c1[1000] = { 0 };
	char c2[1000] = { 0 };
	fgets(c1, sizeof(c1), ifp);
	char* tmp;

	float data;
	float sum = 0;
	int data_counter = 0;

	fgets(c2, sizeof(c2), ifp);
	tmp = c2;
	char* y1;
	y1 = strsep(&tmp, "-");
	int y1_i;
	int y2_i;
	y2_i = atoi(y1);
	y1_i = y2_i;
	int i = 0;
	while (y1_i == y2_i)
	{
		while (i != index_counter)
		{
			data = atof(strsep(&tmp, ","));
			i++;
		}
		i = 0;
		if (data != 0)
		{
			sum += data;
			data_counter++;
		}
		if ((fgets(c2, sizeof(c2), ifp)) == NULL)
		{
			fprintf(ofp, "%d ", y1_i);
			fprintf(ofp, "%f\n", sum / data_counter);
			break;
		}
		else
		{
			tmp = c2;
			y2_i = atoi(strsep(&tmp, "-"));
			if (y2_i != y1_i)
			{
				fprintf(ofp, "%d ", y1_i);
				fprintf(ofp, "%f\n", sum / data_counter);
				y1_i++;
				sum = 0;
				data_counter = 0;
			}
		}
	}
	fclose(ifp);
	fclose(ofp);

	if (plot == 1) {
		char cur_path[1000];
		char cmd[1500];
		getcwd(cur_path, sizeof(cur_path));
		snprintf(cmd, sizeof(cmd), "%s/bin/xgraph.exe -pdf -out_file %s.pdf %s", cur_path, f1, f2);
		system(cmd);
	}

	return 0;
}

//
//  main.c
//  EEE2022_2021313185_11
//
//  Created by Jingbin JIN on 2022/05/16.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct _nlist {
    int val;
    struct _nlist* next;
} nlist;

nlist* insert(nlist* p, int i);
nlist* delete(nlist* p, int i);
void print_list(nlist* p);


nlist* insert(nlist* p, int i) {
    nlist* newNode;
    newNode = (nlist*)malloc(sizeof(nlist));
    newNode->val = i;
    newNode->next = NULL;

    nlist* cur = p->next;
    while (cur != NULL) {
        if (cur->val > i) {
            newNode->next = cur;
            return newNode;
        }
        else cur = cur->next;
    }
    return newNode;
}


nlist* delete(nlist* p, int i) {
    nlist* cur = p->next;
    while (cur != NULL) {
        if (cur->val == i) {
            return cur->next;
        }
        else cur = cur->next;
    }
    return NULL;
}
void print_list(nlist* p) {
    nlist* cur = p->next;
    while (cur != NULL) {
        printf("%d ", cur->val);
        cur = cur->next;
    }
}

int findPos(nlist* p, int i) {
    nlist* temp = p->next;
    int cnt = 0;
    while (temp != NULL) {
        if (temp->val > i) return cnt;
        else {
            temp = temp->next;
            cnt++;
        }
    }
    return cnt;
}

int finddelPos(nlist* p, int i) {
    nlist* cur = p->next;
    int cnt = 0;
    while (cur != NULL) {
        if (cur->val == i) return cnt;
        else {
            cur = cur->next;
            cnt++;
        }
    }
    return -1;
}

int main() {
    char input[80];
    FILE* ifp;
    printf("input file: ");
    fgets(input, sizeof(input), stdin);
    input[strcspn(input, "\r\n")] = '\0';
    ifp = fopen(input, "r");


    nlist* head;
    head = (nlist*)malloc(sizeof(nlist));
    head->next = NULL;

    int num_cmds;
    char arrays[10];
    fscanf(ifp, "%d", &num_cmds);
    fgets(arrays, 10, ifp);

    for (int i = 0; i < num_cmds; i++) {
        fgets(arrays, 10, ifp);
        int val = arrays[2] - 48;
        printf("%c %d : ", arrays[0], val);
        if (arrays[0] == 'I') {
            nlist* newNode = insert(head, val);
            nlist* temp = head;

            int pos = findPos(head, val);
            for (int j = 0; j < pos; j++) temp = temp->next;
            temp->next = newNode;

            print_list(head);
            printf("\n");

        }
        else {
            int pos = finddelPos(head, val);
            if (pos == -1) {
                printf("NOT FOUND ");
                print_list(head);
                printf("\n");
            }
            else {
                delete(head, val);
                nlist* temp = head;
                if (pos == 0) {
                    nlist* tmp = head->next->next;
                    head->next = tmp;
                    print_list(head);
                    printf("\n");
                }
                else {
                    for (int j = 0; j < pos; j++) temp = temp->next;
                    temp->next = temp->next->next;
                    print_list(head);
                    printf("\n");
                }
            }
        }
    }
    fclose(ifp);
    return 0;
}


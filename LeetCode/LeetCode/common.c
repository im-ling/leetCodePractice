//
//  common.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "common.h"
#include <stdio.h>

int compareIntFunction(const void *a, const void *b){
    int aValue = *((int*)a);
    int bVaule = *((int*)b);
    if (aValue > bVaule) {
        return 1;
    }else if (aValue < bVaule){
        return -1;
    }else{
        return 0;
    }
}
/**
int compareIntFunction(const void *a, const void *b){
    return *(int *)a - *(int *)b;
}
*/


int printListWithThreshold(struct ListNode* list, int threshold){
    printf("\n printLists:");
    int count = 0;
    while (list != NULL) {
        if (count++ % threshold == 0) {
            printf("\n");
        }
        printf(" %d",list->val);
        list = list->next;
    }
    return 0;
}

int printList(struct ListNode* list){
    printListWithThreshold(list, 5);
    return 0;
}

int printTwoDimensionLists(struct ListNode** lists, int listsSize){
    printf("\n printTwoDimensionLists:");
    for (int i = 0; i < listsSize; i++) {
        printf("\n i(%d)",i);
        struct ListNode* p = lists[i];
        while (p != NULL) {
            printf(" %d",p->val);
            p = p->next;
        }
    }
    return 0;
}

struct ListNode* intArrayToList(int *array, int number){
    struct ListNode* result = calloc(1, sizeof(struct ListNode));
    struct ListNode* p = result;
    for (int i = 0; i < number; i++) {
        p->next = calloc(1, sizeof(struct ListNode));
        p->next->val = array[i];
        p = p->next;
    }
    p = result;
    result = result->next;
    free(p);
    return result;
}



struct ListNode* initAListNodeWithLength(int listLen){
    struct ListNode headNode = {0, NULL};
    struct ListNode *head =  &headNode;
    for (int i = listLen; i > 0; i--) {
        struct ListNode *newNode = calloc(1, sizeof(struct ListNode));
        newNode->val = i;
        newNode->next = head->next;
        head->next = newNode;
    }
    return head->next;
}

struct ListNode* initANodeListWithLenAndThreshold(int listLen, int threshold){
    struct ListNode headNode = {0, NULL};
    struct ListNode *head =  &headNode;
    for (int i = listLen; i > 0; i--) {
        struct ListNode *newNode = calloc(1, sizeof(struct ListNode));
        newNode->val = arc4random() % threshold;
        newNode->next = head->next;
        head->next = newNode;
    }
    return head->next;
}


int maxValue(int x, int y) {
    return x > y ? x : y;
}

//
//  q0023.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0023.h"
#include "../common.h"
#include "q0021.h"


//23. Merge k Sorted Lists
//Hard
//1746
//114
//
//
//Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.
//
//Example:
//
//Input:
//[
// 1->4->5,
// 1->3->4,
// 2->6
// ]
//Output: 1->1->2->3->4->4->5->6

/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */


//// 68 ms, faster than 63.11%
//struct ListNode* mergeKLists(struct ListNode** lists, int listsSize) {
//    struct ListNode *result = calloc(1, sizeof(struct ListNode));
//    struct ListNode *p = result;
////    struct ListNode *pTmp = NULL;
//    int indexMin = 0;
//    int min = INT32_MAX;
//    int secondMin = INT32_MAX;
//    while (listsSize > 0) {
//        bool findFlag = false;
//        for (int i = 0; i < listsSize; i++) {
//            if (lists[i] == NULL) {
//                if (listsSize <= 1) {
//                    listsSize--;
//                }else{
//                    lists[i] = lists[--listsSize];
//                }
//                i--;
//            }else if (min > lists[i]->val){
//                    findFlag = true;
//                    indexMin = i;
//                    secondMin = min;
//                    min = lists[i]->val;
//            }else if(secondMin > lists[i]->val){
//                secondMin = lists[i]->val;
//            }
//        }
//        if (findFlag) {
//            p->next = lists[indexMin];
////            printf("\n i(%d) val(%d) ", indexMin, p->val);
//            p = p->next;
//            lists[indexMin] = lists[indexMin]->next;
//            while (lists[indexMin] && secondMin != INT32_MAX && lists[indexMin]->val < secondMin) {
//                p = lists[indexMin];
//                lists[indexMin] = lists[indexMin]->next;
//            }
//            min = INT32_MAX;
//            secondMin = INT32_MAX;
//            findFlag = false;
//        }
////        printTwoDimensionLists(lists, listsSize);
////        printList(result->next);
//    }
//    p = result;
//    result = result->next;
//    free(p);
//    return result;
//}

// 148 ms why it takes so long ?
//struct ListNode *mergeKLists(struct ListNode **lists, int listsSize) {
//    if (listsSize == 0)  {
//        return NULL;
//    }
//    if (listsSize == 1)   {
//        return lists[0];
//    }
//    for (int i = listsSize - 1; i > 0; i--) {
//        lists[0] = mergeTwoLists(lists[0], lists[i]);
//    }
//    return lists[0];
//}

////8 ms !!!
struct ListNode *mergeKLists(struct ListNode **lists, int listsSize) {
    if (listsSize == 0)  {
        return NULL;
    }
    if (listsSize == 1)   {
        return lists[0];
    }
    for (int i = 0,j = listsSize - 1; i < j; i++, j--) {
        lists[i] = mergeTwoLists(lists[i], lists[j]);
        listsSize--;
    }
    return mergeKLists(lists, listsSize);
}

int question23(){
    int listSize = 3;
    struct ListNode** lists = calloc(listSize, sizeof(struct ListNode*));
    int array[3][4] = {{3,1,4,5},{3,1,3,4},{2,2,6}};;
    for (int i = 0; i < 3; i++) {
        lists[i] = intArrayToList(array[i] + 1, array[i][0]);
//        printList(lists[i]);
    }
    printTwoDimensionLists(lists,listSize);
//    for (int i = 0; i < listSize; i++) {
//        lists[i] = calloc(1, sizeof(struct ListNode));
//        struct ListNode *p = lists[i];
//        printf("\n");
//        printf(" %d ",p->val);
//        for (int j = 0; j < listSize - 1; j++) {
//            p->next = calloc(1, sizeof(struct ListNode));
//            p->next->val = j * listSize + i;
//            printf(" %d ",p->next->val);
//            p = p->next;
//        }
//    }
//
//    printf("\n result:");
//    for (int i = 0; i < listSize; i++) {
//        struct ListNode *p = lists[i];
//        printf("\n i(%d) ",i);
//        while (p != NULL) {
//            printf(" %d ", p->val);
//            p = p->next;
//        }
//    }

    struct ListNode* result = mergeKLists(lists, listSize);
    printf("\nresult:\n");
    printList(result);
    
    return 0;
}

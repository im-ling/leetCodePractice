//
//  q0024.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0024.h"
#include "../common.h"

//24. Swap Nodes in Pairs
//Medium
//789
//65
//
//
//Given a linked list, swap every two adjacent nodes and return its head.
//
//Example:
//
//Given 1->2->3->4, you should return the list as 2->1->4->3.
//Note:
//
//Your algorithm should use only constant extra space.
//You may not modify the values in the list's nodes, only nodes itself may be changed.
struct ListNode* swapPairs(struct ListNode* head) {
    if (head == NULL || head->next == NULL) {
        return head;
    }
    struct ListNode *result = head->next;
    struct ListNode *p = head;
    struct ListNode *tmpNode = NULL;
    struct ListNode *pLast = NULL;
    while (p != NULL && p->next != NULL) {
//        printList(p);
        if (pLast) {
            pLast->next = p->next;
        }
        tmpNode = p->next->next;
        p->next->next = p;
        p->next = tmpNode;
        pLast = p;
        p = p->next;
    }
    return result;
}

int question24(){
    int testArray[] = {1,2,3,4,5,6,7};
    struct ListNode *test = intArrayToList(testArray, 7);
    struct ListNode *result = swapPairs(test);
    printList(result);
    return 0;
}

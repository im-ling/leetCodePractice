//
//  q0019.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0019.h"
#include "../common.h"


//19. Remove Nth Node From End of List
//Medium
//1337
//105
//
//
//Given a linked list, remove the n-th node from the end of list and return its head.
//
//Example:
//
//Given linked list: 1->2->3->4->5, and n = 2.
//
//After removing the second node from the end, the linked list becomes 1->2->3->5.
//Note:
//
//Given n will always be valid.
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */

struct ListNode* removeNthFromEnd(struct ListNode* head, int n) {
    struct ListNode *p = head;
    struct ListNode headNode = {0, NULL};
    headNode.next = head;
    struct ListNode *pOperateNode = &headNode;
    int threshold = n - 1;
    int count = 0;
    while (p->next != NULL) {
        p = p->next;
        if (++count > threshold) {
            pOperateNode = pOperateNode->next;
        }
        if (count == threshold) {
            pOperateNode->next = head;
        }
    }
//    printf("\noperationNodeValue %d",pOperateNode->val);
    struct ListNode *pRecycleNode = pOperateNode->next;
//    printf("recycleNode value %d",pRecycleNode->val);
    if (pOperateNode->next == head) {
        //        printf("\n pOperateNode->next->value %d",pOperateNode->next->val);
        head = head->next;
    }
    pOperateNode->next = pOperateNode->next->next;
    free(pRecycleNode);
    return head;
}

int question19(){
    int listLen = 5;
    struct ListNode headNode = {0, NULL};
    struct ListNode *head =  &headNode;
    for (int i = listLen; i > 0; i--) {
        struct ListNode *newNode = calloc(1, sizeof(struct ListNode));
        newNode->val = i;
        newNode->next = head->next;
        head->next = newNode;
    }
    head = head->next;
    struct ListNode *pHead = head;
    for (int i = 0; i < listLen; i++) {
        printf(" %d ",pHead->val);
        pHead = pHead->next;
    }
    head = removeNthFromEnd(head, 5);
    printf("\n");
    for (int i = 0; i < listLen - 1; i++) {
        printf(" %d ",head->val);
        head = head->next;
    }
    return 0;
}

//
//  q0025.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0025.h"
#include "../common.h"

//25. Reverse Nodes in k-Group
//Hard
//808
//182
//
//
//Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.
//
//k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes in the end should remain as it is.
//
//Example:
//
//Given this linked list: 1->2->3->4->5
//
//For k = 2, you should return: 2->1->4->3->5
//
//For k = 3, you should return: 3->2->1->4->5
//
//Note:
//
//Only constant extra memory is allowed.
//You may not alter the values in the list's nodes, only nodes itself may be changed.
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* reverseKGroup(struct ListNode* head, int k) {
    if (head == NULL) {
        return head;
    }
    struct ListNode **lists = calloc(k, sizeof(struct ListNode *));
    struct ListNode *p = head;
    struct ListNode *lastTail = NULL;
    struct ListNode *result = NULL;
    int count = 0;
    while (p != NULL) {
        lists[count++] = p;
        p = p->next;
        if (count == k) {
            
            if (lastTail) {
                lastTail->next = lists[k-1];
            }else if (result == NULL){
                result = lists[count - 1];
            }
            for (int i = k - 1; i > 0 ; i--) {
                lists[i]->next = lists[i - 1];
            }
            lastTail = lists[0];
            count = 0;
//            printList(result);
        }
    }
    if (count) {
        if (lastTail) {
            lastTail->next = lists[0];
        }
        if (result == NULL) {
            result = lists[0];
        }
    }else{
        lists[0]->next = NULL;
    }
    return result;
}
int question25(){
    int size = 1;
    int testArray[size];
    for (int i = 0; i < size; i++) {
        testArray[i] = i + 1;
    }
    struct ListNode *result = intArrayToList(testArray, size);
    printList(result);
    result = reverseKGroup(result, 2);
    printList(result);
    return 0;
}


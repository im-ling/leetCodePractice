//
//  q0142.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0142.h"
#include "../common.h"

//142. Linked List Cycle II
//Medium
//1618
//128
//Favorite
//Share
//Given a linked list, return the node where the cycle begins. If there is no cycle, return null.
//
//To represent a cycle in the given linked list, we use an integer pos which represents the position (0-indexed) in the linked list where tail connects to. If pos is -1, then there is no cycle in the linked list.
//
//Note: Do not modify the linked list.
//
//Example 1:
//
//Input: head = [3,2,0,-4], pos = 1
//Output: tail connects to node index 1
//Explanation: There is a cycle in the linked list, where tail connects to the second node.
//
//
//Example 2:
//
//Input: head = [1,2], pos = 0
//Output: tail connects to node index 0
//Explanation: There is a cycle in the linked list, where tail connects to the first node.
//
//
//Example 3:
//
//Input: head = [1], pos = -1
//Output: no cycle
//Explanation: There is no cycle in the linked list.
//
//
//
//
//Follow-up:
//Can you solve it without using extra space?
struct ListNode *detectCycle(struct ListNode *head) {
    if (head == NULL) {
        return head;
    }
    struct ListNode *pSlow = head;
    struct ListNode *pFast = head;
    bool isCycle = false;
    while (pSlow->next != NULL && pFast->next != NULL && pFast->next->next != NULL) {
        pSlow = pSlow->next;
        pFast = pFast->next->next;
        if (pSlow == pFast) {
            isCycle = true;
            break;
        }
    }
    if (isCycle) {
        pFast = head;
        while (pFast != pSlow) {
            pFast = pFast->next;
            pSlow = pSlow->next;
        }
        return pFast;
    }
    return NULL;
}
int question142(){
    struct ListNode s11 = {11, NULL};
    struct ListNode s12 = {12, &s11};
    struct ListNode s13 = {13, &s12};
    struct ListNode s14 = {14, &s13};
//    s11.next = &s11;
//    s14.next = &s14;
//    s13.next = &s14;
    s12.next = &s14;

    struct ListNode * result = detectCycle(&s14);
    printf("result %d \n",result->val);
    return 0;
}

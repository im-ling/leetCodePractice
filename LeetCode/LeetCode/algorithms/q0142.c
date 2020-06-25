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


//Algorithm Description:
//Step 1: Determine whether there is a cycle
//
//1.1) Using a slow pointer that move forward 1 step each time
//
//1.2) Using a fast pointer that move forward 2 steps each time
//
//1.3) If the slow pointer and fast pointer both point to the same location after several moving steps, there is a cycle;
//
//1.4) Otherwise, if (fast->next == NULL || fast->next->next == NULL), there has no cycle.
//
//Step 2: If there is a cycle, return the entry location of the cycle
//
//2.1) L1 is defined as the distance between the head point and entry point
//
//2.2) L2 is defined as the distance between the entry point and the meeting point
//
//2.3) C is defined as the length of the cycle
//
//2.4) n is defined as the travel times of the fast pointer around the cycle When the first encounter of the slow pointer and the fast pointer
//
//According to the definition of L1, L2 and C, we can obtain:
//
//the total distance of the slow pointer traveled when encounter is L1 + L2
//
//the total distance of the fast pointer traveled when encounter is L1 + L2 + n * C
//
//Because the total distance the fast pointer traveled is twice as the slow pointer, Thus:
//
//2 * (L1+L2) = L1 + L2 + n * C => L1 + L2 = n * C => L1 = (n - 1) C + (C - L2)*
//
//It can be concluded that the distance between the head location and entry location is equal to the distance between the meeting location and the entry location along the direction of forward movement.
//
//So, when the slow pointer and the fast pointer encounter in the cycle, we can define a pointer "entry" that point to the head, this "entry" pointer moves one step each time so as the slow pointer. When this "entry" pointer and the slow pointer both point to the same location, this location is the node where the cycle begins.

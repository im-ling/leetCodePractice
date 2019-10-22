//
//  q0141.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0141.h"
#include "../common.h"

//141. Linked List Cycle
//Easy
//1725
//207
//Favorite
//
//Share
//Given a linked list, determine if it has a cycle in it.
//
//To represent a cycle in the given linked list, we use an integer pos which represents the position (0-indexed) in the linked list where tail connects to. If pos is -1, then there is no cycle in the linked list.
//
//Example 1:
//
//Input: head = [3,2,0,-4], pos = 1
//Output: true
//Explanation: There is a cycle in the linked list, where tail connects to the second node.
//
//
//Example 2:
//
//Input: head = [1,2], pos = 0
//Output: true
//Explanation: There is a cycle in the linked list, where tail connects to the first node.
//
//Example 3:
//
//Input: head = [1], pos = -1
//Output: false
//Explanation: There is no cycle in the linked list.
//
//Follow up:
//
//Can you solve it using O(1) (i.e. constant) memory?
//
//Accepted
//440,155
//Submissions
//1,165,924
bool hasCycle(struct ListNode *head) {
    if (head == NULL) {
        return false;
    }
    struct ListNode *pSlow = head;
    struct ListNode *pFast = head;
    while (pSlow->next != NULL && pFast->next != NULL && pFast->next->next != NULL) {
        pSlow = pSlow->next;
        pFast = pFast->next->next;
        if (pSlow == pFast) {
            return true;
        }
    }
    return false;
}


//bool hasCycle(struct ListNode *head) {
//    int impossibleNum = INT_MIN + 55467;
//    while (head != NULL) {
//        if (head->val == impossibleNum) {
//            return true;
//        }
//        head->val = impossibleNum;
//        head = head->next;
//    }
//    return false;
//}
int question141(){
    struct ListNode s11 = {3, NULL};
    struct ListNode s12 = {8, &s11};
    struct ListNode s13 = {1, &s12};
    struct ListNode s14 = {1, &s13};
//    s11.next = &s13;

    bool result = hasCycle(&s14);
    printf("result %d \n",result);
    return 0;
}

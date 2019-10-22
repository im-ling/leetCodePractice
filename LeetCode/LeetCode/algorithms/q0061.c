//
//  q0061.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0061.h"
#include "../common.h"

//61. Rotate List
//Medium
//
//671
//
//856
//
//Favorite
//
//Share
//Given a linked list, rotate the list to the right by k places, where k is non-negative.
//
//Example 1:
//
//Input: 1->2->3->4->5->NULL, k = 2
//Output: 4->5->1->2->3->NULL
//Explanation:
//rotate 1 steps to the right: 5->1->2->3->4->NULL
//rotate 2 steps to the right: 4->5->1->2->3->NULL
//Example 2:
//
//Input: 0->1->2->NULL, k = 4
//Output: 2->0->1->NULL
//Explanation:
//rotate 1 steps to the right: 2->0->1->NULL
//rotate 2 steps to the right: 1->2->0->NULL
//rotate 3 steps to the right: 0->1->2->NULL
//rotate 4 steps to the right: 2->0->1->NULL
//Accepted
//206,063
//Submissions
//743,550



struct ListNode* rotateRight(struct ListNode* head, int k){
    if (head == NULL || k < 1) {
        return head;
    }
    int listLen = 1;
    struct ListNode* pFast = head;
    while (pFast->next != NULL) {
        pFast = pFast->next;
        listLen++;
    }
    if (listLen == 1 || k % listLen == 0) {
        return head;
    }
    struct ListNode* pSlow = head;
    int times = listLen - k % listLen - 1;
    for (int i = 0; i < times; i++) {
        pSlow = pSlow->next;
    }
    struct ListNode* result = pSlow->next;
    pFast->next = head;
    pSlow->next = NULL;
    return result;
}

//struct ListNode* rotateRight(struct ListNode* head, int k){
//    if (head == NULL || k < 1) {
//        return head;
//    }
//    int listLen = 0;
//    struct ListNode preHead = {INT_MIN, head};
//    struct ListNode* pHead = &preHead;
//    struct ListNode* temp = pHead;
//    while (pHead->next != NULL) {
//        if (k) {
//            k--;
//        }else{
//            temp = temp->next;
//        }
//        pHead = pHead->next;
//        listLen++;
//    }
//    if (listLen == 1) {
//        return head;
//    }
//    struct ListNode* result = NULL;
//    if (k) {
//        temp = pHead;
//        pHead = head;
//        int times = listLen - k % listLen - 1;
//        for (int i = 0; i < times; i++) {
//            pHead = pHead->next;
//        }
//        result = pHead->next;
//        pHead->next = NULL;
//        temp->next = head;
//    }else{
//        if (temp == &preHead) {
//            return head;
//        }
//        result = temp->next;
//        pHead->next = head;
//        temp->next = NULL;
//    }
//    return result;
//}

//struct ListNode* rotateRight(struct ListNode* head, int k){
//    if (head == NULL || k < 1) {
//        return head;
//    }
//    int listLen = 1;
//    struct ListNode* pHead = head;
//    struct ListNode* temp = head;
//    while (pHead->next != NULL) {
//        if (k > 0) {
//            k--;
//        }else{
//            temp = temp->next;
//        }
//        listLen++;
//        pHead = pHead->next;
//    }
//    struct ListNode* result = NULL;
//    if (k > 0) {
//        result = rotateRight(head, (k - 1) % listLen);
//    }else{
//        result = temp->next;
//        pHead->next = head;
//        temp->next = NULL;
//    }
//    return result;
//}



int question61(){
    int listLen = 3;
    int rotateLen = 4;
    struct ListNode *list1 = initAListNodeWithLength(listLen);
    printList(list1);
    list1 = rotateRight(list1, rotateLen);
    printList(list1);
    return 0;
}

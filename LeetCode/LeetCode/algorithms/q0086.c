//
//  q0086.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0086.h"
#include "../common.h"

//86. Partition List
//Medium
//760
//204
//Favorite
//
//Share
//Given a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.
//
//You should preserve the original relative order of the nodes in each of the two partitions.
//
//Example:
//
//Input: head = 1->4->3->2->5->2, x = 3
//Output: 1->2->2->4->3->5
//Accepted
//173,663
//Submissions
//456,206

//struct ListNode* partition(struct ListNode* head, int x){
//    struct ListNode preHead = {INT_MIN,head};
//    struct ListNode* pFast = &preHead;
//    struct ListNode* pSlow = &preHead;
//    struct ListNode* temp = &preHead;
//    bool isFirstGreater = false;
//    while (pFast->next != NULL) {
//        if (pFast->next->val < x) {
//            if (isFirstGreater) {
//                temp = pFast->next;
//                pFast->next = temp->next;
//                temp->next = pSlow->next;
//                pSlow->next = temp;
//            }else{
//                pFast = pFast->next;
//            }
//            pSlow = pSlow->next;
//        }else{
//            isFirstGreater = true;
//            pFast = pFast->next;
//        }
//    }
//    return preHead.next;
//}


struct ListNode* partition(struct ListNode* head, int x){
    struct ListNode nodeMin = {INT_MIN,NULL};
    struct ListNode nodeMax = {INT_MAX,NULL};
    struct ListNode* pNodeMin = &nodeMin;
    struct ListNode* pNodeMax = &nodeMax;

    struct ListNode* p = head;
    while (p) {
        if (p->val < x) {
            pNodeMin->next = p;
            pNodeMin = pNodeMin->next;
        }else{
            pNodeMax->next = p;
            pNodeMax = pNodeMax->next;
        }
        p = p->next;
    }
    pNodeMin->next = nodeMax.next;
    pNodeMax->next = NULL;
    return nodeMin.next;
}



int question86(){
    int listLen = 10;
    int threshold = listLen / 2;
    struct ListNode *list1 = initANodeListWithLenAndThreshold(listLen, listLen);
    printListWithThreshold(list1, listLen);
    list1 = partition(list1, threshold);
    printListWithThreshold(list1, listLen);
    return 0;
}

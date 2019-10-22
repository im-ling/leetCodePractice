//
//  q0021.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0021.h"
#include "../common.h"

//21. Merge Two Sorted Lists
//Easy
//1649
//225
//
//
//Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
//
//Example:
//
//Input: 1->2->4, 1->3->4
//Output: 1->1->2->3->4->4


//struct ListNode* mergeTwoLists(struct ListNode* l1, struct ListNode* l2) {
//    struct ListNode *p1 = l1;
//    struct ListNode *p2 = l2;
//    struct ListNode *result = calloc(1, sizeof(struct ListNode));
//    struct ListNode *pResult = result;
//
//    while (p1 != NULL && p2 != NULL) {
//        struct ListNode *newNode = calloc(1, sizeof(struct ListNode));
//        if (p1->val < p2->val) {
//            newNode->val = p1->val;
//            pResult->next = p1;
//            p1 = p1->next;
//        }else{
//            newNode->val = p2->val;
//            pResult->next = p2;
//            p2 = p2->next;
//        }
//        pResult = pResult->next;
//    }
//
//    if (p1 == NULL) {
//        p1 = p2;
//    }
//    while (p1 != NULL) {
//        struct ListNode *newNode = calloc(1, sizeof(struct ListNode));
//        newNode->val = p1->val;
//        pResult->next = p1;
//        pResult = pResult->next;
//        p1 = p1->next;
//    }
//
//    pResult = result;
//    result = result->next;
//    free(pResult);
//    return result;
//}


//struct ListNode {
//    int val;
//    struct ListNode *next;
//};
struct ListNode* mergeTwoLists(struct ListNode* l1, struct ListNode* l2) {
    if (l1 == NULL) {
        return l2;
    }else if (l2 == NULL){
        return l1;
    }else if (l1->val < l2->val){
        l1->next = mergeTwoLists(l1->next, l2);
        return l1;
    }else{
        l2->next = mergeTwoLists(l1, l2->next);
        return l2;
    }
}



int question21(){
    int listSize = 4;
    struct ListNode *p1;
    struct ListNode *p2;
    struct ListNode head1 = {0 ,NULL};
    struct ListNode head2 = {0, NULL};
    p1 = &head1;
    p2 = &head2;
//    printf("\n %d  p1(%p) p1->next(%p)",p1->val, p1, p1->next);
    for (int i = 0; i < listSize; i++) {
//        error 栈空间非动态分配内存，会释放
//        struct ListNode newNode1 = {i , NULL};
//        struct ListNode newNode2 = {i * 2, NULL};
        p1->next = calloc(1, sizeof(struct ListNode));
        p1->next->val = i;
        p1 = p1->next;
//        printf("\n %d  p1(%p) p1->next(%p)",p1->val, p1, p1->next);
        
        p2->next = calloc(1, sizeof(struct ListNode));
        p2->next->val = i * 2;
        p2 = p2->next;
    }
//    p1 = head1.next;
//    while (p1 != NULL) {
//        printf(" %d ", p1->val);
//        p1 = p1->next;
//    }
    struct ListNode* result = mergeTwoLists(head1.next, head2.next);
    while (result->next != NULL) {
        printf(" %d ", result->val);
        result = result->next;
    }
    return 0;
}

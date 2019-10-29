//
//  q0083.c
//  LeetCode
//
//  Created by NowOrNever on 30/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0083.h"
#include "../common.h"


//83. Remove Duplicates from Sorted List
//Easy
//
//961
//
//88
//
//Favorite
//
//Share
//Given a sorted linked list, delete all duplicates such that each element appear only once.
//
//Example 1:
//
//Input: 1->1->2
//Output: 1->2
//Example 2:
//
//Input: 1->1->2->3->3
//Output: 1->2->3
//Accepted
//375,945
//Submissions
//862,029

/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* deleteDuplicates(struct ListNode* head){
    struct ListNode *result = head;
    struct ListNode *temp = NULL;
    while (head && head->next) {
        if (head->val == head->next->val) {
            temp = head->next;
            head->next = head->next->next;
            free(temp);
        }else{
            head = head->next;
        }
    }
    return result;
}

int question83(void){
    struct ListNode *s11 = malloc(sizeof(struct ListNode));
    struct ListNode *s12 = malloc(sizeof(struct ListNode));
    struct ListNode *s13 = malloc(sizeof(struct ListNode));
    s11->val = 1;
    s11->next = NULL;
    s12->val = 1;
    s12->next = s11;
    s13->val = 1;
    s13->next = s12;
    struct ListNode *result = deleteDuplicates(s13);
    printList(result);
    printf("\n");
    return 0;
}

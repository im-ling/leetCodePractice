//
//  q0203.c
//  LeetCode
//
//  Created by NowOrNever on 08/11/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0203.h"
#include "../common.h"

//203. Remove Linked List Elements
//Easy
//
//1033
//
//59
//
//Favorite
//
//Share
//Remove all elements from a linked list of integers that have value val.
//
//Example:
//
//Input:  1->2->6->3->4->5->6, val = 6
//Output: 1->2->3->4->5
//Accepted
//260,964
//Submissions
//711,930

struct ListNode* removeElements(struct ListNode* head, int val){
    struct ListNode node = {0, head};
    struct ListNode *p = &node;
    struct ListNode *temp = NULL;
    while (p->next) {
        if (p->next->val == val) {
            temp = p->next;
            p->next = p->next->next;
            free(temp);
        }else{
            p = p->next;
        }
    }
    return node.next;
}
int question203(){
    printf("esay listNode question, no example\n");
    return 0;
}

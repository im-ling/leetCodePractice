//
//  q0206.c
//  LeetCode
//
//  Created by NowOrNever on 08/11/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0206.h"
#include "../common.h"

//206. Reverse Linked List
//Easy
//
//3019
//
//75
//
//Favorite
//
//Share
//Reverse a singly linked list.
//
//Example:
//
//Input: 1->2->3->4->5->NULL
//Output: 5->4->3->2->1->NULL
//Follow up:
//
//A linked list can be reversed either iteratively or recursively. Could you implement both?
//
//Accepted
//732,052
//Submissions
//1,266,876

struct ListNode* reverseList(struct ListNode* head){
    struct ListNode node = {0, NULL};
    struct ListNode *p_node = &node;
    struct ListNode *temp = &node;
    while (head) {
        temp = head->next;
        head->next = p_node->next;
        p_node->next = head;
        head = temp;
    }
    return node.next;
}
int question206(){
    printf("esay listNode question, no example\n");
    return 0;
}


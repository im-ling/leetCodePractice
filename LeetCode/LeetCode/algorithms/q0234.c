//
//  q0234.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0234.h"
#include "../common.h"

//234. Palindrome Linked List
//Easy
//1865
//269
//Favorite
//Share
//Given a singly linked list, determine if it is a palindrome.
//
//Example 1:
//
//Input: 1->2
//Output: false
//Example 2:
//
//Input: 1->2->2->1
//Output: true
//Follow up:
//Could you do it in O(n) time and O(1) space?
//
//Accepted
//288,126
//Submissions
//782,724

bool q234isPalindrome(struct ListNode* head){
    int len = 0;
    struct ListNode *pHead = head;
    while (pHead != NULL) {
        pHead = pHead->next;
        len++;
    }
    if (len < 2) {
        return true;
    }
    pHead = head;
    int stackLen = len / 2;
    int temp[stackLen];
    int len2 = 0;
    while (len2 < stackLen) {
        temp[len2++] = pHead->val;
        pHead = pHead->next;
    }
    if (len % 2) {
        pHead = pHead->next;
    }
    while (--len2 >= 0) {
        if (temp[len2] != pHead->val) {
            return false;
        }
        pHead = pHead->next;
    }
    return true;
}
int question234(){
    int nums[] = {1,1,2,1,1};
    struct ListNode *head = intArrayToList(nums, sizeof(nums) / sizeof(int));
    bool result = q234isPalindrome(head);
    printf(" %d \n",result);
    return 0;
}

//
//  main.m
//  LeetCode
//
//  Created by DoubleL on 2018/11/22.
//  Copyright © 2018 DoubleL. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
//        int question1(void);
//        question1();
//        int question2(void);
//        question2();
//        int question70(void);
//        question70();
    }
    return 0;
}

//Q1:Two Sum
//Given an array of integers, return indices of the two numbers such that they add up to a specific target.
//You may assume that each input would have exactly one solution, and you may not use the same element twice.
//Example:
//Given nums = [2, 7, 11, 15], target = 9,
//Because nums[0] + nums[1] = 2 + 7 = 9,
//return [0, 1].

int question1(){
    printf("question1\n");
    int nums[] = {2, 7, 11, 15};
    int target = 9;
    //    int *result = NULL;
    int* twoSum(int* nums, int numsSize, int target);
    int *result = twoSum(nums, 4, target);
    printf("result = {%d , %d}",*result , * (result+1));
    return 0;
}
/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
int* twoSum(int* nums, int numsSize, int target) {
    int *resultArray = malloc(sizeof(int) * 2);
    for(int i = 0; i < numsSize; i++){
        for (int j = i+1; j < numsSize; j++) {
            if (nums[i] == target - nums[j]) {
                *resultArray = i;
                *(resultArray+1) = j;
                return resultArray;
            }
        }
    }
    return resultArray;
}

//2. Add Two Numbers
//You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
//You may assume the two numbers do not contain any leading zero, except the number 0 itself.
//Example:
//Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
//Output: 7 -> 0 -> 8
//Explanation: 342 + 465 = 807.
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */

struct ListNode {
    int val;
    struct ListNode *next;
};

struct ListNode* newNodeWith(struct ListNode* l1, struct ListNode* l2, int *carryFlag){
    struct ListNode *result = calloc(1, sizeof(struct ListNode));
    if (l1 && l2) {
        result->val = l1->val + l2->val + *carryFlag;
    }else if(l1){
        result->val = l1->val + *carryFlag;
    }else if (l2){
        result->val = l2->val + *carryFlag;
    }else{
        result->val = *carryFlag;
    }
    *carryFlag = result->val / 10;
    result->val = result->val % 10;
    return result;
}
struct ListNode* addTwoNumbers(struct ListNode* l1, struct ListNode* l2) {
    struct ListNode *p1 = l1;
    struct ListNode *p2 = l2;
    struct ListNode *result = calloc(1, sizeof(struct ListNode));
    struct ListNode *tempResult = result;
    int carryFlag = 0;
    while (p1 != NULL || p2 != NULL || carryFlag != 0) {
        tempResult->next = newNodeWith(p1, p2, &carryFlag);
        tempResult = tempResult->next;
        if (p1) {
            p1 = p1->next;
        }
        if (p2) {
            p2 = p2->next;
        }
    }
    tempResult = result->next;
    free(result);
    return tempResult;
}
int question2(void){
    struct ListNode s11 = {3, NULL};
    struct ListNode s12 = {8, &s11};
    struct ListNode s13 = {1, &s12};
    
    struct ListNode s21 = {4, NULL};
    struct ListNode s22 = {6, &s21};
    struct ListNode s23 = {2, &s22};
    struct ListNode *result = addTwoNumbers(&s13, &s23);
    while (result) {
        printf(" %d ",result->val);
        result = result->next;
    }
    return 0;
}

//70. Climbing Stairs
//You are climbing a stair case. It takes n steps to reach to the top.
//Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
//Note: Given n will be a positive integer.
//Example 1:
//Input: 2
//Output: 2
//Explanation: There are two ways to climb to the top.
//1. 1 step + 1 step
//2. 2 steps
//Example 2:
//Input: 3
//Output: 3
//Explanation: There are three ways to climb to the top.
//1. 1 step + 1 step + 1 step
//2. 1 step + 2 steps
//3. 2 steps + 1 step
int question70(){
    int step = 4;
    int climbStairs(int n);
    int result = climbStairs(step);
    printf("climb %d,has %d way",step,result);
    return 0;
}

int climbStairs(int n) {
    int temp = 0;
    int result = 1;
    int lastResult = 0;
    for (int i = 1; i <= n; i++) {
        temp = lastResult;
        lastResult = result;
        result += temp;
    }
    return result;
}


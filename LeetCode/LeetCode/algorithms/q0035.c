//
//  q0035.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0035.h"
#include "../common.h"
#include "q0034.h"

//35. Search Insert Position
//Easy
//
//1014
//
//148
//
//Favorite
//
//Share
//Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
//
//You may assume no duplicates in the array.
//
//Example 1:
//
//Input: [1,3,5,6], 5
//Output: 2
//Example 2:
//
//Input: [1,3,5,6], 2
//Output: 1
//Example 3:
//
//Input: [1,3,5,6], 7
//Output: 4
//Example 4:
//
//Input: [1,3,5,6], 0
//Output: 0
//Accepted
//331,155
//Submissions
//825,733


int searchInsert(int* nums, int numsSize, int target) {
    int result = 0;
    int *lastLeft = searchLastLeft(nums, numsSize, target);
    result = (int)(lastLeft - nums + 1);
    if (*lastLeft >= target) {
        result--;
    }
    return result;
}

int question35(){
    int nums[4] = {1,3,5,6};
    for (int i = 0; i < sizeof(nums) / sizeof(int); i++) {
        printf(" %d",nums[i]);
    }
    int result = searchInsert(nums, sizeof(nums) / sizeof(int), 4);
    printf("\n result(%d)",result);
    return 0;
}

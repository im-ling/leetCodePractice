//
//  q0136.c
//  LeetCode
//
//  Created by NowOrNever on 31/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0136.h"
#include "../common.h"

//136. Single Number
//Easy
//
//2973
//
//115
//
//Favorite
//
//Share
//Given a non-empty array of integers, every element appears twice except for one. Find that single one.
//
//Note:
//
//Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
//
//Example 1:
//
//Input: [2,2,1]
//Output: 1
//Example 2:
//
//Input: [4,1,2,1,2]
//Output: 4
//Accepted
//555,471
//Submissions
//897,980

int singleNumber(int* nums, int numsSize){
    int result = 0;
    int *p = nums + numsSize - 1;
    while (p >= nums) {
        result ^= *p--;
    }
    return result;
//    int result = 0;
//    for (int i = 0; i < numsSize; i++) {
//        result ^= nums[i];
//    }
//    return result;
}
int question136(){
    int nums[] = {4,1,2,1,2};
    int result = singleNumber(nums, sizeof(nums) / sizeof(int));
    printf("question136 result: %d\n", result);
    return 0;
}


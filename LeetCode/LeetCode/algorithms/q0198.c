//
//  q0198.c
//  LeetCode
//
//  Created by NowOrNever on 04/11/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0198.h"
#include "../common.h"

//198. House Robber
//Easy
//
//3191
//
//103
//
//Favorite
//
//Share
//You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security system connected and it will automatically contact the police if two adjacent houses were broken into on the same night.
//
//Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.
//
//Example 1:
//
//Input: [1,2,3,1]
//Output: 4
//Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
//             Total amount you can rob = 1 + 3 = 4.
//Example 2:
//
//Input: [2,7,9,3,1]
//Output: 12
//Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
//             Total amount you can rob = 2 + 9 + 1 = 12.
//Accepted
//388,641
//Submissions
//938,391

// fn = d(d) + max(fn + fn-1)
int rob(int* nums, int numsSize){
    if (numsSize < 1) {
        return 0;
    }else if (numsSize < 2) {
        return nums[0];
    }else if (numsSize < 3){
        return nums[0] > nums[1] ? nums[0] : nums[1];
    }
    int stack[numsSize];
    memcpy(stack, nums, sizeof(int) * numsSize);
    stack[2] += stack[0];
    for (int i = 3; i < numsSize; i++) {
        stack[i] += stack[i - 3] > stack[i - 2] ? stack[i - 3] : stack[i - 2];
    }
    return stack[numsSize - 2] > stack[numsSize - 1] ? stack[numsSize - 2] : stack[numsSize - 1];
}

//int rob(int* nums, int numsSize){
//    if (numsSize < 1) {
//        return 0;
//    }else if (numsSize < 2){
//        return nums[0];
//    }else if (numsSize < 3){
//        return maxValue(nums[0], nums[1]);
//    }
//    return maxValue(nums[0] + rob(nums + 2, numsSize - 2), nums[1] + rob(nums + 3, numsSize - 3));
//}

//[1,2,3,4,5,6,7]
//[1,2,3,1]
//[2,7,9,3,1]
//[]
//[0]

int question198(){
    int nums[] = {1,2,3,4,5,6,7};
    int result = rob(nums, sizeof(nums) / sizeof(int));
    printf("question 198 result: %d\n", result);
    return 0;
}


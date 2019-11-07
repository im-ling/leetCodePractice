//
//  q0189.c
//  LeetCode
//
//  Created by NowOrNever on 01/11/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0189.h"
#include "../common.h"

//189. Rotate Array
//Easy
//
//1762
//
//675
//
//Favorite
//
//Share
//Given an array, rotate the array to the right by k steps, where k is non-negative.
//
//Example 1:
//
//Input: [1,2,3,4,5,6,7] and k = 3
//Output: [5,6,7,1,2,3,4]
//Explanation:
//rotate 1 steps to the right: [7,1,2,3,4,5,6]
//rotate 2 steps to the right: [6,7,1,2,3,4,5]
//rotate 3 steps to the right: [5,6,7,1,2,3,4]
//Example 2:
//
//Input: [-1,-100,3,99] and k = 2
//Output: [3,99,-1,-100]
//Explanation:
//rotate 1 steps to the right: [99,-1,-100,3]
//rotate 2 steps to the right: [3,99,-1,-100]
//Note:
//
//Try to come up as many solutions as you can, there are at least 3 different ways to solve this problem.
//Could you do it in-place with O(1) extra space?
//Accepted
//362,440
//Submissions
//1,135,699

void rotate(int* nums, int numsSize, int k){
    if (numsSize < 1) {
        return;
    }
    k %= numsSize;
    if (k) {
        int stack[k];
        for (int i = 0; i < k; i++) {
            stack[i] = nums[numsSize - k + i];
        }
        for (int i = numsSize - 1; i >= k; i--) {
            nums[i] = nums[i - k];
        }
        for (int i = 0 ; i < k; i++) {
            nums[i] = stack[i];
        }
    }
    return;
}

int question189(){
    printf("question 189:\n");
    int nums[] = {1,2,3,4,5,6,7};
    int k = 3;
    rotate(nums, sizeof(nums) / sizeof(int), k);
    for (int i = 0; i < sizeof(nums) / sizeof(int); i++) {
        printf(" %d", nums[i]);
    }
    printf("\n");
    return 0;
}

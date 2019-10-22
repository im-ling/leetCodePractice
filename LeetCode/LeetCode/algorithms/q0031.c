//
//  q0031.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0031.h"
#include "../common.h"

//31. Next Permutation
//Medium
//1243
//349
//
//
//Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.
//
//If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).
//
//The replacement must be in-place and use only constant extra memory.
//
//Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.
//
//1,2,3 → 1,3,2
//3,2,1 → 1,2,3
//1,1,5 → 1,5,1
//
//Accepted
//193,632
//Submissions
//655,621

void nextPermutation(int* nums, int numsSize) {
    int swapIndex = -1;
    int max = INT32_MIN;
    for (int i = numsSize - 1; i >= 0 && swapIndex < 0; i--) {
        if (max > nums[i]) {
            swapIndex = i;
        }else{
            max = nums[i];
        }
    }
    if (swapIndex >= 0) {
        for (int i = numsSize - 1; i >= 0 ; i--) {
            if (nums[i] > nums[swapIndex]) {
                nums[i] += nums[swapIndex];
                nums[swapIndex] = nums[i] - nums[swapIndex];
                nums[i] -= nums[swapIndex];
                i = 0;
            }
        }
    }
    qsort(nums + swapIndex + 1, numsSize - swapIndex - 1, sizeof(int), compareIntFunction);
}

int question31(){
    int nums[4] = {1,2,3,4};
    nextPermutation(nums, 4);
    for (int i = 0; i < 4; i++) {
        printf(" %d",nums[i]);
    }
    return 0;
}

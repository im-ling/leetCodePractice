//
//  q0283.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0283.h"
#include "../common.h"

//283. Move Zeroes
//Easy
//
//2312
//83
//Favorite
//
//Share
//Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
//
//Example:
//
//Input: [0,1,0,3,12]
//Output: [1,3,12,0,0]
//Note:
//
//You must do this in-place without making a copy of the array.
//Minimize the total number of operations.
//Accepted
//515,477
//Submissions
//936,861
void moveZeroes(int* nums, int numsSize){
    int i = 0;
    int j = 0;
    while (i < numsSize) {
        if (nums[i] != 0) {
            nums[j++] = nums[i];
        }
        i++;
    }
    while (j < numsSize) {
        nums[j++] = 0;
    }
}
int question283(){
    int nums[] = {0};
    int size = sizeof(nums) / sizeof(int);
    moveZeroes(nums, size);
    for (int i = 0; i < size; i++) {
        printf(" %d",nums[i]);
    }
    return 0;
}

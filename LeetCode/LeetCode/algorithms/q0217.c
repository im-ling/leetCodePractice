//
//  q0217.c
//  LeetCode
//
//  Created by NowOrNever on 08/11/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0217.h"
#include "../common.h"

//217. Contains Duplicate
//Easy
//
//508
//
//584
//
//Favorite
//
//Share
//Given an array of integers, find if the array contains any duplicates.
//
//Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.
//
//Example 1:
//
//Input: [1,2,3,1]
//Output: true
//Example 2:
//
//Input: [1,2,3,4]
//Output: false
//Example 3:
//
//Input: [1,1,1,3,3,4,3,2,4,2]
//Output: true
//Accepted
//414,868
//Submissions
//770,783

bool containsDuplicate(int* nums, int numsSize){
    qsort(nums, numsSize, sizeof(int), compareIntFunction);
    for (int i = 1; i < numsSize; i++) {
        if (nums[i] == nums[i - 1]) {
            return 1;
        }
    }
    return 0;
}

int question217(){
    int nums[] = {1,2,3,1};
    printf("result of question 217 is : %d\n",containsDuplicate(nums, sizeof(nums) / sizeof(int)));
    return 0;
}

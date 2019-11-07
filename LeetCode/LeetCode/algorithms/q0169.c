//
//  q0169.c
//  LeetCode
//
//  Created by NowOrNever on 31/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0169.h"
#include "../common.h"

//169. Majority Element
//Easy
//
//2077
//
//182
//
//Favorite
//
//Share
//Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.
//
//You may assume that the array is non-empty and the majority element always exist in the array.
//
//Example 1:
//
//Input: [3,2,3]
//Output: 3
//Example 2:
//
//Input: [2,2,1,1,1,2,2]
//Output: 2
//Accepted
//454,470
//Submissions
//831,764

int majorityElement(int* nums, int numsSize){
    qsort(nums, numsSize, sizeof(int), compareIntFunction);
    return nums[numsSize / 2];
}

int question169(){
    return 0;
}


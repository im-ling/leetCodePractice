//
//  q0041.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0041.h"
#include "../common.h"

//41. First Missing Positive
//Share
//Given an unsorted integer array, find the smallest missing positive integer.
//
//Example 1:
//
//Input: [1,2,0]
//Output: 3
//Example 2:
//
//Input: [3,4,-1,1]
//Output: 2
//Example 3:
//
//Input: [7,8,9,11,12]
//Output: 1
//Note:
//
//Your algorithm should run in O(n) time and uses constant extra space.
//
//Accepted
//187,760
//Submissions
//668,756

int firstMissingPositive(int* nums, int numsSize) {
    /**
    qsort(nums, numsSize, sizeof(int), compareIntFunction);
    int result = 1;
    bool flag = true;
    for (int i = 0; i < numsSize && flag; i++) {
        if (nums[i] >= result) {
            if (nums[i] == result) {
                result++;
            }else{
                flag = false;
            }
        }
    }
    return result;
     */
    int newNumsSize = numsSize + 3;
    char *newNums = malloc(newNumsSize * sizeof(char));
    memset(newNums, 1, sizeof(char) * newNumsSize);
    newNums[0] = 0;
    for (int i = 0; i < numsSize; i++) {
        if (nums[i] > 0 && nums[i] < newNumsSize) {
            newNums[nums[i]] = 0;
        }
    }
    for (int i = 0; i < newNumsSize; i ++) {
        if (newNums[i]) {
            return i;
        }
    }
    return -1;
}
int question41(){
    int nums[] =
    {7,8,9,11,12};
    //    {3,4,-1,1};
    //    {0 , 1 , 2};
    int result = firstMissingPositive(nums, sizeof(nums) / sizeof(nums[0]));
    printf("first missing positive number is %d",result);
    return 0;
}

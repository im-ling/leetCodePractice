//
//  q0034.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0034.h"
#include "../common.h"

//34. Find First and Last Position of Element in Sorted Array
//Medium
//1138
//62
//Favorite
//Share
//Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.
//
//Your algorithm's runtime complexity must be in the order of O(log n).
//
//If the target is not found in the array, return [-1, -1].
//
//Example 1:
//
//Input: nums = [5,7,7,8,8,10], target = 8
//Output: [3,4]
//Example 2:
//
//Input: nums = [5,7,7,8,8,10], target = 6
//Output: [-1,-1]
//Accepted
//243,421
//Submissions
//750,914
int *searchLastLeft(int* nums, int numsSize, int target){
    if (numsSize <= 1) {
        return nums;
    }
    int middle = numsSize / 2;
    if (nums[middle] < target) {
        return searchLastLeft(nums + middle, numsSize - middle, target);
    }else{
        return searchLastLeft(nums, middle, target);
    }
}

int *searchLastRight(int* nums, int numsSize, int target){
//    printf("\nnums(%d), numsize(%d)",*nums , numsSize);
    if (numsSize <= 1) {
        return nums;
    }
    int middle = numsSize / 2 - 1;
    if (nums[middle] > target) {
        return searchLastRight(nums , middle + 1, target);
    }else{
        return searchLastRight(nums + middle + 1, numsSize - middle - 1, target);
    }
}


int* searchRange(int* nums, int numsSize, int target, int* returnSize) {
    int *result = calloc(2 , sizeof(int));
    memset(result, -1, 2 * sizeof(int));
    *returnSize = 2;
    if (numsSize < 1) {
        return result;
    }
    int *left = searchLastLeft(nums, numsSize, target);
    int *right= searchLastRight(nums, numsSize, target);
    
    if (*left == target) {
        result[0] = (int) (left - nums);
    }else if (left - nums + 1 < numsSize && *(left + 1) == target){
        result[0] = (int) (left - nums + 1);
    }
    
    if (*right == target) {
        result[1] = (int) (right - nums);
    }else if (numsSize > 1 && *(right - 1) == target){
        result[1] = (int) (right - nums - 1);
    }
//    printf("\n left(%p) right(%p)",left-nums, right-nums);
    return result;
}

int question34(){
//    int nums[6] = {5,7,7,8,8,10};
    int nums[1] = {1};
    for (int i = 0; i < sizeof(nums) / sizeof(int); i++) {
        printf(" %d",nums[i]);
    }
    int resultCount = 0;
    int *result = searchRange(nums, sizeof(nums) / sizeof(int), 0, &resultCount);
    printf("\n");
    for (int i = 0; i < resultCount; i++) {
        printf(" %d",result[i]);
    }
    printf("\n");
    return 0;
}

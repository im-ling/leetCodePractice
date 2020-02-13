//
//  q0704.c
//  LeetCode
//
//  Created by NowOrNever on 11/02/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#include "q0704.h"
#include "../common.h"


//704. Binary Search
//Easy
//
//455
//
//41
//
//Add to List
//
//Share
//Given a sorted (in ascending order) integer array nums of n elements and a target value, write a function to search target in nums. If target exists, then return its index, otherwise return -1.
//
//
//Example 1:
//
//Input: nums = [-1,0,3,5,9,12], target = 9
//Output: 4
//Explanation: 9 exists in nums and its index is 4
//
//Example 2:
//
//Input: nums = [-1,0,3,5,9,12], target = 2
//Output: -1
//Explanation: 2 does not exist in nums so return -1
//
//
//Note:
//
//You may assume that all elements in nums are unique.
//n will be in the range [1, 10000].
//The value of each element in nums will be in the range [-9999, 9999].

int* innerSearch(int* nums, int numsSize, int target){
    if (nums[0] == target) {
        return nums;
    }
    if (numsSize <= 1){
        return NULL;
    }
    int middle = numsSize / 2;
    if (nums[middle] > target){
        return innerSearch(nums, middle, target);
    }else{
        return innerSearch(nums + middle, numsSize - middle, target);
    }
}

int q704search(int* nums, int numsSize, int target){
    int *return_value = innerSearch(nums, numsSize, target);
    if (return_value) {
        return (int)(return_value - nums);
    }
    return -1;
}


int q704searchNonRecursive(int* nums, int numsSize, int target){
    int low = 0;
    int high = numsSize - 1;
    while (low <= high) {
        int middle = (low + high) / 2;
        if (nums[middle] == target) {
            return middle;
        }else if (nums[middle] < target){
            low = middle + 1;
        }else{
            high = middle - 1;
        }
    }
    return -1;
}
int question704(){
    int array[] = {-1,0,3,5,9,12};
    printf("result %d\n", q704search(array, sizeof(array)/sizeof(int), 3));
    return 0;
}

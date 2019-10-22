//
//  q0209.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0209.h"
#include "../common.h"

//209. Minimum Size Subarray Sum
//Medium
//1275
//78
//Favorite
//
//Share
//Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.
//
//Example:
//
//Input: s = 7, nums = [2,3,1,2,4,3]
//Output: 2
//Explanation: the subarray [4,3] has the minimal length under the problem constraint.
//Follow up:
//If you have figured out the O(n) solution, try coding another solution of which the time complexity is O(n log n).
//Accepted
//190,893
//Submissions
//538,628

int minSubArrayLen(int s, int* nums, int numsSize){
    int len = numsSize;
    int pLeft = 0;
    int sum = 0;
    for (int i = 0; i < numsSize; i++) {
        sum += nums[i];
        if (sum >= s) {
            while (sum - nums[pLeft] >= s) {
                sum -= nums[pLeft++];
            }
            if (len > i - pLeft) {
                len = i - pLeft;
            }
        }
    }
    if (numsSize == len) {
        return 0;
    }
    return len + 1;
}
int question209(){
    int nums[] = {2,3,1,2,4,3};
    int result = minSubArrayLen(7, nums, sizeof(nums) / sizeof(int));
    printf(" %d \n",result);
    return 0;
}

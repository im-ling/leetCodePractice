//
//  q0045.c
//  LeetCode
//
//  Created by NowOrNever on 06/05/2021.
//  Copyright © 2021 DoubleL. All rights reserved.
//

#include "q0045.h"
#include "../common.h"

//45. Jump Game II
//Medium
//
//4267
//
//184
//
//Add to List
//
//Share
//Given an array of non-negative integers nums, you are initially positioned at the first index of the array.
//
//Each element in the array represents your maximum jump length at that position.
//
//Your goal is to reach the last index in the minimum number of jumps.
//
//You can assume that you can always reach the last index.
//
//
//
//Example 1:
//
//Input: nums = [2,3,1,1,4]
//Output: 2
//Explanation: The minimum number of jumps to reach the last index is 2. Jump 1 step from index 0 to 1, then 3 steps to the last index.
//Example 2:
//
//Input: nums = [2,3,0,1,4]
//Output: 2
//
//
//Constraints:
//
//1 <= nums.length <= 1000
//0 <= nums[i] <= 105
//Accepted
//350,387
//Submissions
//1,080,843


int jump(int* nums, int numsSize){
    int steps = 0;
    int curEnd = 0;
    int max = 0;
    
    for (int i = 0; i < numsSize - 1; i++) {
        if (max < i + nums[i]) {
            max = i + nums[i];
        }
        
        if (max >= numsSize - 1) {
            steps++;
            break;
        }
        
        if (i == curEnd) {
            steps++;
            curEnd = max;
        }
    }
    
    return steps;
}

//
//  q0015.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0015.h"
#include "../common.h"

//15. 3Sum
//Medium
//2739
//310
//
//
//Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
//
//Note:
//
//The solution set must not contain duplicate triplets.
//
//Example:
//
//Given array nums = [-1, 0, 1, 2, -1, -4],
//
//A solution set is:
//[
// [-1, 0, 1],
// [-1, -1, 2]
//]

/**
 * Return an array of arrays of size *returnSize.
 * Note: The returned array must be malloced, assume caller calls free().
 */

int** threeSum(int* nums, int numsSize, int* returnSize) {
    int bufferSize = 100;
    int **result = calloc(bufferSize, sizeof(int *));
    int resultCount = 0;

    if (numsSize < 3) {
        *returnSize = 0;
        return result;
    }
    
    qsort(nums, numsSize, sizeof(int), compareIntFunction);
    
    for (int i = 0; i < numsSize ; i++) {
        // handle duplicates i
        if (nums[i] > 0) {
            break;
        }
        while (i > 0 && nums[i] == nums[i - 1]) {
            i++;
        }
        int pStart = i + 1;
        int pEnd = numsSize - 1;
        int sum = INT32_MAX;
        
        while (pStart < pEnd) {
            sum = nums[i] + nums[pStart] + nums[pEnd];
            if (sum > 0) {
                pEnd--;
//                while (nums[pEnd] == nums[pEnd + 1]) {
//                    pEnd--;
//                }
            }else if(sum < 0){
                pStart++;
//                while (nums[pStart] == nums[pStart - 1]) {
//                    pStart++;
//                }
            }else{
//                printf("\n rescount(%d) i(%d) start(%d) end(%d)", resultCount, i, pStart, pEnd);
                if (resultCount >= bufferSize) {
                    bufferSize += bufferSize;
                    result = realloc(result, sizeof(int *) * bufferSize);
                }
                int *newNode = calloc(1, sizeof(int) * 3);
                newNode[0] = nums[i];
                newNode[1] = nums[pStart];
                newNode[2] = nums[pEnd];
                result[resultCount++] = newNode;
                pStart++;
                while (pStart < pEnd && nums[pStart] == nums[pStart - 1]) {
                    pStart++;
                }
                pEnd--;
                while (pStart < pEnd && nums[pEnd] == nums[pEnd + 1]) {
                    pEnd--;
                }
            }
        }
        
    }
    *returnSize = resultCount;
    return result;
}

int question15(){
    int numbers[] =
//    {0,0,0,0};
//    {-1, 0, 1, 2, -1, -4};
//    {-4,-2,1,-5,-4,-4,4,-2,0,4,0,-2,3,1,-5,0};
    {-4,-2,-2,-2,0,1,2,2,2,3,3,4,4,6,6};
    int resultSize = 0;
    int **result = threeSum(numbers, sizeof(numbers) / sizeof(int), &resultSize);
    for (int i = 0; i < resultSize; i++) {
        printf("\n i(%d) %d %d %d",i,result[i][0],result[i][1],result[i][2]);
    }
//    [[-5,1,4],[-4,0,4],[-4,1,3],[-2,-2,4],[-2,1,1],[0,0,0]]
    printf("\n");
    return 0;
}

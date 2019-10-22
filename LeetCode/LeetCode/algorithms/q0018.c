//
//  q0018.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0018.h"
#include "../common.h"

//18. 4Sum
//Medium
//754
//146
//
//
//Given an array nums of n integers and an integer target, are there elements a, b, c, and d in nums such that a + b + c + d = target? Find all unique quadruplets in the array which gives the sum of target.
//
//Note:
//
//The solution set must not contain duplicate quadruplets.
//
//Example:
//
//Given array nums = [1, 0, -1, 0, -2, 2], and target = 0.
//
//A solution set is:
//[
// [-1,  0, 0, 1],
// [-2, -1, 1, 2],
// [-2,  0, 0, 2]
// ]

int** fourSum(int* nums, int numsSize, int target, int* returnSize) {

    int bufferSize = 100;
    int **result = calloc(bufferSize, sizeof(int *));
    int resultCount = 0;
    
    if (numsSize < 4) {
        *returnSize = 0;
        return result;
    }
    
    qsort(nums, numsSize, sizeof(int), compareIntFunction);
    
//    for (int i = 0; i < numsSize; i++) {
//        printf(" %d ",nums[i]);
//    }
    
    for (int i = 0; i < numsSize ; i++) {
        // handle duplicates i
        while (i > 0 && nums[i] == nums[i - 1]) {
            i++;
        }
        
        for (int j = i + 1; j < numsSize; j++) {
            while (j > i + 1 && nums[j] == nums[j - 1]) {
                j++;
            }
            int pStart = j + 1;
            int pEnd = numsSize - 1;
            int sum = INT32_MAX;
            
            while (pStart < pEnd) {
                sum = nums[i] + nums[j] + nums[pStart] + nums[pEnd];
                if (sum > target) {
                    pEnd--;
                    //                while (nums[pEnd] == nums[pEnd + 1]) {
                    //                    pEnd--;
                    //                }
                }else if(sum < target){
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
                    int *newNode = calloc(1, sizeof(int) * 4);
                    newNode[0] = nums[i];
                    newNode[1] = nums[j];
                    newNode[2] = nums[pStart];
                    newNode[3] = nums[pEnd];
                    
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
    }
    *returnSize = resultCount;
    return result;
}
int question18(){
    int numbers[] =
    //    {0,0,0,0};
    //    {-1, 0, 1, 2, -1, -4};
    //    {-4,-2,1,-5,-4,-4,4,-2,0,4,0,-2,3,1,-5,0};
//    {1, 0, -1, 0, -2, 2};
//    {0,4,-5,2,-2,4,2,-1,4};
    {1,-2,-5,-4,-3,3,3,5};
    int resultSize = 0;
    int **result = fourSum(numbers, sizeof(numbers) / sizeof(int), -11, &resultSize);
    for (int i = 0; i < resultSize; i++) {
        printf("\n i(%d) %d %d %d %d",i,result[i][0],result[i][1],result[i][2], result[i][3]);
    }
    printf("\n");
    return 0;
}

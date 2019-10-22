//
//  q0167.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0167.h"
#include "../common.h"

//167. Two Sum II - Input array is sorted
//Easy
//1023
//424
//Favorite
//
//Share
//Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.
//
//The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2.
//
//Note:
//
//Your returned answers (both index1 and index2) are not zero-based.
//You may assume that each input would have exactly one solution and you may not use the same element twice.
//Example:
//
//Input: numbers = [2,7,11,15], target = 9
//Output: [1,2]
//Explanation: The sum of 2 and 7 is 9. Therefore index1 = 1, index2 = 2.
//Accepted
//277,543
//Submissions
//543,101

/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
int* q167twoSum(int* numbers, int numbersSize, int target, int* returnSize){
    int *result = calloc(2, sizeof(int));
    bool foundFlag = false;
    for (int i = 0; i < numbersSize; i++) {
        int tempTarget = target - numbers[i];
        int j = i + 1;
        int k = numbersSize - 1;
        if (tempTarget == numbers[j]) {
            k = j;
            foundFlag = true;
        }else if(tempTarget == numbers[k]){
            foundFlag = true;
            j = k;
        }
        while (j < k) {
            int half = (j + k) / 2;
            if (half == j) {
                break;
            }
            if (numbers[half] < tempTarget) {
                j = half;
            }else if(numbers[half] > tempTarget){
                k = half;
            }else{
                j = half;
                foundFlag = true;
                break;
            }
        }
        if (foundFlag) {
            result[0] = i + 1;
            result[1] = j + 1;
            *returnSize = 2;
            break;
        }
    }
    return result;
}

int question167(){
    int nums[] =
//        {3,24,50,79,88,150,345};
    {12,83,104,129,140,184,199,300,306,312,321,325,341,344,349,356,370,405,423,444,446,465,471,491,500,506,508,530,539,543,569,591,606,607,612,614,623,627,645,662,670,685,689,726,731,737,744,747,764,773,778,787,802,805,811,819,829,841,879,905,918,918,929,955,997};
    int size = sizeof(nums) / sizeof(int);
    for (int i = 0; i < size; i++) {
//        nums[i] = i * i;
        if (i % 10 == 0) {
            printf("\n");
        }
        printf(" %d",nums[i]);
    }
    printf("\n");
    int returnSize = 0;
    int *result = q167twoSum(nums, size, 789, &returnSize);
    for (int i = 0; i < returnSize; i++) {
        printf(" %d",result[i]);
    }
    printf("\n");
    return 0;
}

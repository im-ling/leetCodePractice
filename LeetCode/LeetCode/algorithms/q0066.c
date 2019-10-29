//
//  q0066.c
//  LeetCode
//
//  Created by NowOrNever on 29/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0066.h"
#include "../common.h"

//66. Plus One
//Easy
//
//1043
//
//1817
//
//Favorite
//
//Share
//Given a non-empty array of digits representing a non-negative integer, plus one to the integer.
//
//The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.
//
//You may assume the integer does not contain any leading zero, except the number 0 itself.
//
//Example 1:
//
//Input: [1,2,3]
//Output: [1,2,4]
//Explanation: The array represents the integer 123.
//Example 2:
//
//Input: [4,3,2,1]
//Output: [4,3,2,2]
//Explanation: The array represents the integer 4321.
//Accepted
//462,566
//Submissions
//1,108,259

/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
int* plusOne(int* digits, int digitsSize, int* returnSize){
    int carry_bit = 1;
    int index = digitsSize - 1;
    int *result = digits;
    *returnSize = digitsSize;

    while (carry_bit && index >= 0) {
        digits[index] += carry_bit;
        carry_bit = digits[index] / 10;
        if (carry_bit) {
            digits[index--] = 0;
        }
    }
    
    if (carry_bit) {
        result = calloc(digitsSize + 1, sizeof(int));
        result[0] = 1;
        *returnSize = digitsSize + 1;
    }
    return result;
}

int question66(){
    int result_len = 0;
    int digits[] = {9, 9, 9};
    int *result = plusOne(digits, sizeof(digits) / sizeof(int), &result_len);
    for (int i = 0; i < result_len; i++) {
        printf("%d",result[i]);
    }
    printf("\n");
    return 0;
}

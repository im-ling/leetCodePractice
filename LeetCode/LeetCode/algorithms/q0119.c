//
//  q0119.c
//  LeetCode
//
//  Created by NowOrNever on 18/02/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#include "q0119.h"
#include "../common.h"
//119. Pascal's Triangle II
//Easy
//
//636
//
//188
//
//Add to List
//
//Share
//Given a non-negative index k where k ≤ 33, return the kth index row of the Pascal's triangle.
//
//Note that the row index starts from 0.
//
//
//In Pascal's triangle, each number is the sum of the two numbers directly above it.
//
//Example:
//
//Input: 3
//Output: [1,3,3,1]
//Follow up:
//
//Could you optimize your algorithm to use only O(k) extra space?
//
//Accepted
//250,430
//Submissions
//534,052

/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
int* getRow(int rowIndex, int* returnSize){
    if (rowIndex < 0) {
        return NULL;
    }
    int size = rowIndex + 1;
    *returnSize = size;
    int *array1 = calloc(size, sizeof(int));
    int *array2 = calloc(size, sizeof(int));
    array1[0] = 1;
    array2[0] = 1;
    for (int i = 1; i < size; i++) {
        int *temp = array1;
        array1 = array2;
        array2 = temp;
        for (int j = 1; j <= i; j++) {
            array2[j] = array1[j] + array1[j - 1];
        }
    }
    free(array1);
    int *result = array2;
    return result;
}
int question119(){
    int size = 0;
    int *result = getRow(4, &size);
    for (int i = 0; i < size; i++) {
        printf("%4d", result[i]);
    }
    printf("\n");
    return 0;
};

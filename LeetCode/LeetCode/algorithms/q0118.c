//
//  q0118.c
//  LeetCode
//
//  Created by NowOrNever on 31/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0118.h"
#include "../common.h"

//118. Pascal's Triangle
//Easy
//
//896
//
//84
//
//Favorite
//
//Share
//Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.
//
//
//In Pascal's triangle, each number is the sum of the two numbers directly above it.
//
//Example:
//
//Input: 5
//Output:
//[
//     [1],
//    [1,1],
//   [1,2,1],
//  [1,3,3,1],
// [1,4,6,4,1]
//]
//Accepted
//299,853
//Submissions
//617,927

/**
 * Return an array of arrays of size *returnSize.
 * The sizes of the arrays are returned as *returnColumnSizes array.
 * Note: Both returned array and *columnSizes array must be malloced, assume caller calls free().
 */
int** generate(int numRows, int* returnSize, int** returnColumnSizes){
    *returnSize = numRows;
    *returnColumnSizes = calloc(numRows , sizeof(int));
    int **result = calloc(numRows , sizeof(int *));
    if (numRows <= 0)
        return result;
    for (int i = 0; i < numRows; i++) {
        result[i] = calloc(i + 1, sizeof(int));
        (*returnColumnSizes)[i] = i + 1;
        result[i][0] = 1;
        for (int j = 1; j < i; j++) {
            result[i][j] = result[i - 1][j - 1] + result[i - 1][j];
        }
        result[i][i] = 1;
    }
    return result;
}

int question118(){
    int *returnColumnSizes = NULL;
    int returnSize = 0;
    int input_num = 16;
    int **result = generate(input_num, &returnSize, &returnColumnSizes);
    
    for (int i = 0; i < returnSize; i++) {
        for (int j = 0; j < returnColumnSizes[i]; j++) {
            printf("%-4d ", result[i][j]);
        }
        printf("\n");
    }
    
    return 0;
};

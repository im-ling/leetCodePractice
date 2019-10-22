//
//  q0046.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0046.h"
#include "../common.h"

//46. Permutations
//Medium
//
//1657
//
//48
//
//Favorite
//
//Share
//Given a collection of distinct integers, return all possible permutations.
//
//Example:
//
//Input: [1,2,3]
//Output:
//[
// [1,2,3],
// [1,3,2],
// [2,1,3],
// [2,3,1],
// [3,1,2],
// [3,2,1]
// ]
//Accepted
//335,360
//Submissions
//631,019


void fillQ46Blank(int ***result,int *blanks,int numsSize, int currentPosition, int *originalNumber,int* availableNumber,int *count,int *bufferSize){
    if (currentPosition == numsSize) {
        //        expand resultSize
        if (*count >= *bufferSize) {
            *bufferSize += *bufferSize;
            *result = realloc(*result, sizeof(int *) * (*bufferSize));
        }
        //        add a result to result
        (*result)[*count] = calloc(numsSize, sizeof(int));
        memcpy((*result)[*count], blanks, numsSize * sizeof(int));
        (*count)++;
        return;
    }else{
        for (int i = 0; i < numsSize ; i++) {
            // if number available
            if (availableNumber[i]) {
                blanks[currentPosition] = originalNumber[i];
                availableNumber[i] = 0;
                fillQ46Blank(result, blanks, numsSize, currentPosition + 1, originalNumber, availableNumber, count, bufferSize);
                availableNumber[i] = 1;
            }
        }
    }
}

int** permute(int *nums, int numsSize, int *returnSize) {
    int bufferLen = 100;
    int **result = calloc(bufferLen, sizeof(int *));
    int ***pResult = &result;
    int *blanks = calloc(numsSize, sizeof(int));
    //    for (int i = 0; i < numsSize; i++) {
    //        printf("\nblank[%d] %d",i,blanks[i]);
    //    }
    int *availableNumber = calloc(numsSize, sizeof(int));
    for (int i = 0; i < numsSize; i++) {
        availableNumber[i] = 1;
    }
    fillQ46Blank(pResult, blanks, numsSize, 0, nums ,availableNumber, returnSize, &bufferLen);
    return result;
}

int question46(){
    int numbs[] =
    //    {1,2,3};
    {6,3,2,7,4,-1};
    int returnSize = 0;
    int numberSize = sizeof(numbs) / sizeof(int);
    int **result = permute(numbs, numberSize , &returnSize);
    for (int i = 0; i < returnSize; i++) {
        for (int j = 0; j < numberSize; j++) {
            printf("%d ",result[i][j]);
        }
        printf("\n");
    }
    return 0;
}

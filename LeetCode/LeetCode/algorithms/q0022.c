//
//  q0022.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0022.h"
#include "../common.h"

//22. Generate Parentheses
//Medium
//1994
//128
//
//
//Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
//
//For example, given n = 3, a solution set is:
//
//[
// "((()))",
// "(()())",
// "(())()",
// "()(())",
// "()()()"
// ]

/**
 * Return an array of size *returnSize.
 * Note: The returned array must be malloced, assume caller calls free().
 */

int q22FillABlank(char ***result, int *bufferSize, int *resultCount, int balance, int lack, char *answer, char *pAnswer, int copyLen){
    if (lack == 0) {
        if (balance) {
            return -1;
        }else{
            if (*resultCount >= *bufferSize) {
                *bufferSize += *bufferSize;
                *result = realloc(*result, sizeof(char *) * (*bufferSize));
            }
            (*result)[*resultCount] = calloc(copyLen, sizeof(char));
            memcpy((*result)[*resultCount], answer, copyLen);
            (*resultCount)++;
            return 0;
        }
    }else{
        *pAnswer = '(';
        q22FillABlank(result, bufferSize, resultCount, balance - 1, lack - 1, answer, pAnswer + 1, copyLen);
        if (balance < 0) {
            *pAnswer = ')';
            q22FillABlank(result, bufferSize, resultCount, balance + 1, lack - 1, answer, pAnswer + 1, copyLen);
        }
    }
    return 0;
}

char** generateParenthesis(int n, int* returnSize) {
    int bufferSize = 100;
    char **result = calloc(bufferSize, sizeof(char *));
    if (n <= 0) {
        *result = calloc(2, sizeof(char));
        *returnSize = 1;
        return result;
    }
    char *answer = calloc(n * 2 + 1, sizeof(char));
    q22FillABlank(&result, &bufferSize, returnSize, 0, n * 2, answer, answer, n * 2);
    return result;
}
int question22(){
    int n = 3;
    int returnSize = 0;
    char **result = generateParenthesis(n, &returnSize);
    for (int i = 0; i < returnSize; i++) {
        printf("\n %s ",result[i]);
    }
    printf("\n");
    return 0;
}

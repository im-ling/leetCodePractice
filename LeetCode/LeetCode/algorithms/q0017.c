//
//  q0017.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0017.h"
#include "../common.h"

//17. Letter Combinations of a Phone Number
//Medium
//1625
//229
//
//
//Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent.
//
//A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
//
//
//
//Example:
//
//Input: "23"
//Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
//Note:
//
//Although the above answer is in lexicographical order, your answer could be in any order you want.
/**
 * Return an array of size *returnSize.
 * Note: The returned array must be malloced, assume caller calls free().
 */

int findAResult(char *** result, int *resultCount, int *bufferSize, char *currentChar,char *oneAnswer, char *answerPosition){
    int loopCount = 3;
    char firstChar = '\0';
    switch (*currentChar) {
        case '\0':{
            if (*resultCount >= *bufferSize) {
                *bufferSize += *bufferSize;
//                printf("\n expandBuffer %lu", sizeof(char *) * (*bufferSize));
                *result = realloc(*result,(*bufferSize) * sizeof(char *));
            }
            long len = answerPosition - oneAnswer;
            char *oneNode = calloc(len + 1, sizeof(char));
            memcpy(oneNode, oneAnswer,len);
            (*result)[*resultCount] = oneNode;
            (*resultCount)++;
            return 0;
        }
        case '1':{
            loopCount = 0;
        }
            break;
        case '2':{
            firstChar = 'a';
        }
            break;
        case '3':{
            firstChar = 'd';
        }
            break;
        case '4':{
            firstChar = 'g';
        }
            break;
        case '5':{
            firstChar = 'j';
        }
            break;
        case '6':{
            firstChar = 'm';
        }
            break;
        case '7':{
            firstChar = 'p';
            loopCount++;
        }
            break;
        case '8':{
            firstChar = 't';
        }
            break;
        case '9':{
            loopCount++;
            firstChar = 'w';
        }
            break;
        default:
            break;
    }
    currentChar++;
    for (int i = 0; i < loopCount; i++) {
        *answerPosition = firstChar + i;
        findAResult(result, resultCount, bufferSize, currentChar, oneAnswer, answerPosition + 1);
    }
    return 0;
}

char** letterCombinations(char* digits, int* returnSize) {
    int bufferSize = 100;
    size_t strLen = strlen(digits) + 1;
    
    char *digitsAfterOptimize = calloc(strLen, sizeof(char));
    char *p = digitsAfterOptimize;
    while (*digits != '\0') {
        *p++ = *digits++;
    }
    strLen = strlen(digitsAfterOptimize) + 1;
    if (strLen <= 1) {
        return NULL;
    }
    
    char **result = calloc(bufferSize, sizeof(char *));
    char *oneAnswer = calloc(strLen, sizeof(char));
    findAResult(&result, returnSize, &bufferSize, digitsAfterOptimize, oneAnswer, oneAnswer);
    return result;
}

int question17(){
    char *digits =
//    "23";
    "5678";
    int resultCount = 0;
    char **result = letterCombinations(digits, &resultCount);
    for (int i = 0; i < resultCount; i++) {
        printf("\n i(%d) %s", i, result[i]);
    }
    printf("\n");
    return 0;
}

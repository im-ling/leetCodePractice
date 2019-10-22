//
//  q0043.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0043.h"
#include "../common.h"

//43. Multiply Strings
//Medium
//
//840
//
//368
//
//Favorite
//
//Share
//Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.
//
//Example 1:
//
//Input: num1 = "2", num2 = "3"
//Output: "6"
//Example 2:
//
//Input: num1 = "123", num2 = "456"
//Output: "56088"
//Note:
//
//The length of both num1 and num2 is < 110.
//Both num1 and num2 contain only digits 0-9.
//Both num1 and num2 do not contain any leading zero, except the number 0 itself.
//You must not use any built-in BigInteger library or convert the inputs to integer directly.
//Accepted
//181,730
//Submissions
//608,813
char* multiply(char* num1, char* num2) {
    if ((strlen(num2) == 1 && num2[0] == '0') || (strlen(num1) == 1 && num1[0] == '0')) {
        char *result = calloc(2, sizeof(char));
        result[0] = '0';
        return result;
    }
#define Question43Len 110
    char *result = calloc(Question43Len * 2, sizeof(char));
    int resultReverse[Question43Len * 2];
    memset(resultReverse, 0, sizeof(int) * Question43Len * 2);
    long resultLen = 0;
    for (long i = strlen(num2) - 1; i >= 0; i--) {
        int extra = 0;
        long offset = strlen(num2) - 1 - i;
        int currentNumber = num2[i] - '0';
        //        printf("%c",num2[i]);
        for (long j = strlen(num1) - 1; j >= 0; j--) {
            resultReverse[offset] += (num1[j] - '0') * currentNumber + extra;
            extra = resultReverse[offset] / 10;
            resultReverse[offset] %= 10;
            offset++;
        }
        if (extra) {
            resultReverse[offset] = extra;
            offset++;
        }
        if (resultLen < offset) {
            resultLen = offset;
        }
    }
    char *p = result;
    for (long i = resultLen - 1; i >= 0 ; i--) {
        *p++ = resultReverse[i] + '0';
    }
    return result;
}

int question43(){
    char *num1 = "111111111";
    char *num2 = "111111111";
    //    "9133","0"
    char *result = multiply(num1, num2);
    printf("\n the result of %s multiply %s is %s\n", num1, num2, result);
    return 0;
}

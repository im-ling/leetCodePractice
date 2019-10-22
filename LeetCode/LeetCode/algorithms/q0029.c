//
//  q0029.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0029.h"
#include "../common.h"

//29. Divide Two Integers
//Medium
//493
//2326
//
//
//Given two integers dividend and divisor, divide two integers without using multiplication, division and mod operator.
//
//Return the quotient after dividing dividend by divisor.
//
//The integer division should truncate toward zero.
//
//Example 1:
//
//Input: dividend = 10, divisor = 3
//Output: 3
//Example 2:
//
//Input: dividend = 7, divisor = -3
//Output: -2
//Note:
//
//Both dividend and divisor will be 32-bit signed integers.
//The divisor will never be 0.
//Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 231 − 1 when the division result overflows.
int divideOnce(uint *dividend, int divisor){
    if (*dividend < divisor) {
        return 0;
    }
    bool continueFlag = true;
    int i = 0;
    for (; continueFlag && i < 32; i++) {
        if (*dividend < (divisor << i)) {
            continueFlag = false;
            i--;
            i--;
        }
    }
    *dividend -= divisor << i;
    return 1 << i;
}
int divide(int dividend, int divisor) {
    if (divisor == 1) {
        return dividend;
    }
    uint result = 0;
    int flagDividend = dividend > 0 ? 1 : 0;
    int flagDivisor  = divisor  > 0 ? 1 : 0;
    uint newDividend = flagDividend ? dividend : -dividend;
    uint newDivisor  = flagDivisor  ? divisor  : -divisor;
    int tempResult = 0;
    do {
        //        printf("\ntempReult(%d) result(%d) newDividend(%d) divisor(%d)",tempResult,result, newDividend, newDivisor);
        tempResult = divideOnce(&newDividend, newDivisor);
        result += tempResult;
    } while (tempResult);
    if (result > INT32_MAX) {
        result = INT32_MAX;
    }
    if (flagDivisor ^ flagDividend) {
        result = -result;
    }
    return (int)result;
}
int question29(){
    printf("result : %d",divide(-2147483648, -1));
    return 0;
}

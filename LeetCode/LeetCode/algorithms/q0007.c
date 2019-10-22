//
//  q0007.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0007.h"
#include "../common.h"

//7. Reverse Integer
//Easy
//1726
//2442
//Given a 32-bit signed integer, reverse digits of an integer.
//Example 1:
//Input: 123
//Output: 321
//Example 2:
//Input: -123
//Output: -321
//Example 3:
//Input: 120
//Output: 21
//Note:
//Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
int reverse(int x) {
    bool negativeFlag = x < 0 ? true : false;
    int64_t x_extension = x;
    if (negativeFlag) {
        x_extension = -x_extension;
    }
    int64_t result = 0;
    int cursor;
    while (x_extension != 0) {
        cursor = x_extension % 10;
        x_extension /= 10;
        result = result * 10 + cursor;
    }
    if (result > 2147483648 || (result > 2147483647 && negativeFlag)) {
        return 0;
    }
    if (negativeFlag) {
        result = -result;
    }
    return (int)result;
}
int question7(){
    int testNumber = -2147483648;
    printf("reverse number %d",reverse(testNumber));
    return 0;
};

//
//  q0008.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0008.h"
#include "../common.h"


//8. String to Integer (atoi)
//Medium
//679
//4530
//Implement atoi which converts a string to an integer.
//The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character, takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.
//The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.
//If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.
//If no valid conversion could be performed, a zero value is returned.
//Note:
//Only the space character ' ' is considered as whitespace character.
//Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. If the numerical value is out of the range of representable values, INT_MAX (231 − 1) or INT_MIN (−231) is returned.
//Example 1:
//Input: "42"
//Output: 42
//Example 2:
//Input: "   -42"
//Output: -42
//Explanation: The first non-whitespace character is '-', which is the minus sign.
//Then take as many numerical digits as possible, which gets 42.
//Example 3:
//Input: "4193 with words"
//Output: 4193
//Explanation: Conversion stops at digit '3' as the next character is not a numerical digit.
//Example 4:
//Input: "words and 987"
//Output: 0
//Explanation: The first non-whitespace character is 'w', which is not a numerical
//digit or a +/- sign. Therefore no valid conversion could be performed.
//Example 5:
//Input: "-91283472332"
//Output: -2147483648
//Explanation: The number "-91283472332" is out of the range of a 32-bit signed integer.
//Thefore INT_MIN (−231) is returned.
int myAtoi(char* str) {
    char *p = str;
    int64_t result = 0;
    char blankSpace = ' ';
    while (*p == blankSpace){   //deal with blankspace
        p++;
    };
    bool negativeFlag = false;  //deal with positive and negative flag
    if (*p == '-') {
        negativeFlag = true;
        p++;
    }else if (*p == '+'){
        p++;
    }
    while (*p == '0') {         //deal with initail zero
        p++;
    }
    for (int i = 0;*p >= '0' && *p <= '9' && i <= 10; i++,p++) {    //deal with result over max_int length
        result = result * 10 + (*p) - '0';
    }
    if (negativeFlag) {         // use negativeflag
        result = - result;
    }
    if (result > 2147483647) {      // deal with INT32_MAX
        result = 2147483647;
    }else if (result < -2147483648){ // deal with INT32_MIN
        result = -2147483648;
    }
    return (int)result;
}
int question8(){
//    "  0000000000012345678"
    char *testStr = "9223372036854775808";
    printf("myAtoi %d\n",myAtoi(testStr));
    return 0;
};
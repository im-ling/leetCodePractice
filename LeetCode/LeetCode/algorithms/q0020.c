//
//  q0020.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0020.h"
#include "../common.h"

//20. Valid Parentheses
//Easy
//2257
//107
//
//
//Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
//
//An input string is valid if:
//
//Open brackets must be closed by the same type of brackets.
//Open brackets must be closed in the correct order.
//Note that an empty string is also considered valid.
//
//Example 1:
//
//Input: "()"
//Output: true
//Example 2:
//
//Input: "()[]{}"
//Output: true
//Example 3:
//
//Input: "(]"
//Output: false
//Example 4:
//
//Input: "([)]"
//Output: false
//Example 5:
//
//Input: "{[]}"
//Output: true
bool isValid(char* s) {
    char *p = s;
    size_t strLen = strlen(s);
    if (strLen % 2) {
        return false;
    }else if (!strLen){
        return true;
    }
    char brackets[strLen];
    //    memset(brackets, 0, strLen * sizeof(char));
    char *index = brackets;
    while (*p != '\0') {
        switch (*p) {
            case 40:
                *index++ = 40;
                break;
            case 41:
                if ((--index) < brackets || *index != 40) {
                    return false;
                }
                break;
            case 91:
                *index++ = 91;
                break;
            case 93:
                if ((--index) < brackets || *index != 91) {
                    return false;
                }
                break;
            case 123:
                *index++ = 123;
                break;
            case 125:
                if ((--index) < brackets || *index != 123) {
                    return false;
                }
                break;
            default:
                break;
        }
        p++;
    }
    if (index != brackets) {
        return false;
    }
    return true;
}
int question20(){
    char *testStr = "()[]{}";
    printf("result %d\n",isValid(testStr));
    return 0;
}

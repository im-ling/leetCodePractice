//
//  q0032.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0032.h"
#include "../common.h"

//32. Longest Valid Parentheses
//Hard
//1356
//68
//
//
//Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.
//
//Example 1:
//
//Input: "(()"
//Output: 2
//Explanation: The longest valid parentheses substring is "()"
//Example 2:
//
//Input: ")()())"
//Output: 4
//Explanation: The longest valid parentheses substring is "()()"


int longestValidParentheses(char* s)
{
    int len = (int) strlen(s);
    int *stack = calloc(len , sizeof(int));
    int stackIndex = 0;
    int lastIndex = -1;
    int *stackPosition = calloc(len, sizeof(int));

    int result = -1;
    for (int i = 0; i < len; i++) {
        if (s[i] == '(') {
            if (lastIndex < stackIndex) {
                stackPosition[stackIndex] = i;
            }
            stack[stackIndex] = i;
            lastIndex = stackIndex;
            stackIndex++;
        }else{
            if (stackIndex > 0) {
                stackIndex--;
                if (i - stackPosition[stackIndex] > result) {
                    result = i - stackPosition[stackIndex];
                }
            }else{
                lastIndex = - 1;
            }
        }
    }
    return result + 1;
}


////dp
////https://leetcode.com/problems/longest-valid-parentheses/discuss/14269/An-intuitive-(4ms)-solution-a-DP-solution-(0ms)-and-an-optimized-clean-DP-solution-(0ms)-in-C
//int longestValidParentheses(char* s) {
//    int strLen = (int)strlen(s);
//    int result = 0;
//    if (strLen < 2) {
//        return result;
//    }
//
//    int dp[strLen];
//    memset(dp, 0, strLen * sizeof(int));
//    for (int i = 0; i < strLen; i++) {
//        if (i && s[i] == ')') {
//            if (s[i - 1] == '(') {
//                //use i > 1 instead of i - 1 > 0
//                dp[i] = 2 + (i > 1 ? dp[i - 2] : 0);
//            }else if (i - dp[i - 1] > 0 && s[i - dp[i - 1] - 1] == '('){
//                dp[i] = dp[i - 1] + 2 + (i - dp[i - 1] > 2 ? dp[i - dp[i - 1] - 2] : 0);
////                dp[i] = 2 + (i - 2 >= 0 ? dp[i - 2] : 0);
////            }else if (dp[i - 1] && (i - dp[i - 1] - 1 >= 0) && s[i - dp[i - 1] - 1] == '('){
////                dp[i] = dp[i - 1] + 2 + (((i - dp[i - 1] - 2) > 0) ? dp[i - dp[i - 1] - 2] : 0);
//            }
//            if (result < dp[i]) {
//                result = dp[i];
//            }
//        }
////        printf(" %d ",dp[i]);
//    }
//    return result;
//}


//deprecated
//int longestValidParentheses(char* s) {
//    int result = 0;
//    char *p = s;
//    char *pTail = s + strlen(s) - 1;
//    while (*p != '\0' && result < pTail - p) {
//        char *ps = p;
//        int sum = 0;
//        int max = 0;
//        while (*ps != '\0' && sum <= 0) {
//            if (*ps == '(') {
//                sum--;
//            }else{
//                sum++;
//            }
//            if (sum == 0 && max < ps - p + 1) {
//                max = (int)(ps - p + 1);
//            }
//            ps++;
//        }
//        if (result < max) {
//            result = max;
//        }
//        p += max;
//        if (max == 0) {
//            p++;
//        }
//    }
//    return result;
//}
int question32(){
    char *str =
//    ")))()()(((()()()()))()())";
    "((()))())";
    printf("%s\n",str);
    printf("\nresult:%d\n",longestValidParentheses(str));
    return 0;
}

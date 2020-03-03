//
//  q0044.c
//  LeetCode
//
//  Created by NowOrNever on 03/03/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#include "q0044.h"
#include "../common.h"
//44. Wildcard Matching
//Hard
//
//1596
//
//92
//
//Add to List
//
//Share
//Given an input string (s) and a pattern (p), implement wildcard pattern matching with support for '?' and '*'.
//
//'?' Matches any single character.
//'*' Matches any sequence of characters (including the empty sequence).
//The matching should cover the entire input string (not partial).
//
//Note:
//
//s could be empty and contains only lowercase letters a-z.
//p could be empty and contains only lowercase letters a-z, and characters like ? or *.
//Example 1:
//
//Input:
//s = "aa"
//p = "a"
//Output: false
//Explanation: "a" does not match the entire string "aa".
//Example 2:
//
//Input:
//s = "aa"
//p = "*"
//Output: true
//Explanation: '*' matches any sequence.
//Example 3:
//
//Input:
//s = "cb"
//p = "?a"
//Output: false
//Explanation: '?' matches 'c', but the second letter is 'a', which does not match 'b'.
//Example 4:
//
//Input:
//s = "adceb"
//p = "*a*b"
//Output: true
//Explanation: The first '*' matches the empty sequence, while the second '*' matches the substring "dce".
//Example 5:
//
//Input:
//s = "acdcb"
//p = "a*c?b"
//Output: false
//Accepted
//221,308
//Submissions
//920,104

void q0044printDp(int width, int height,int dp[width][height]){
    printf("\n");
    for (int j = 0; j < width; j++) {
        for (int k = 0; k < height; k++) {
            printf(" %d", dp[j][k]);
        }
        printf("\n");
    }
}

bool q0044isMatch(char * s, char * p){
    int len_s = (int)strlen(s);
    int len_p = (int)strlen(p);
    int dp[len_s + 1][len_p + 1];
    memset(dp, 0, sizeof(int) * (len_s + 1) * (len_p + 1));
    dp[len_s][len_p] = true;
    for (int i = len_p - 1; i >= 0; i--) {
        if (p[i] == '*') {
            dp[len_s][i] = 1;
        }else{
            break;
        }
    }
    for (int i = len_s - 1; i >= 0; i--) {
        for (int j = len_p - 1; j >= 0; j--) {
            if (p[j] == '?' || p[j] == s[i]) {
                dp[i][j] = dp[i + 1][j + 1];
            }else if (p[j] == '*'){
                dp[i][j] = dp[i + 1][j] || dp[i][j + 1];
            }
        }
    }
    return dp[0][0];
}

//dp https://leetcode.com/problems/wildcard-matching/discuss/17904/Java-solution-O(n2)-DP-solution-with-some-explanations
//bool q0044isMatch(char * s, char * p){
//    int len_s = (int)strlen(s);
//    int len_p = (int)strlen(p);
//    int dp[len_s + 1][len_p + 1];
//    memset(dp, 0, sizeof(int) * (len_s + 1) * (len_p + 1));
//
//    dp[0][0] = 1;
//
//    if (*p == '*') {
//        for (int i = 0; i <= len_s; i++) {
//            dp[i][1] = 1;
//        }
//
//        for (int i = 2; i <= len_p; i++) {
//            if (p[i - 1] == '*') {
//                dp[0][i] = 1;
//            }else{
//                break;
//            }
//        }
//    }
//    q0044printDp(len_s + 1, len_p + 1, dp);
//
//    for (int i = 1; i <= len_s; i++) {
//        for (int j = 1; j <= len_p; j++) {
//            if (p[j - 1] != '*') {
//                dp[i][j] = dp[i - 1][j - 1] && (p[j - 1] == '?' || s[i - 1] == p[j - 1]);
//            }else{
//                for (int k = i; k >= 0; k--) {
//                    if (dp[k][j - 1]) {
//                        dp[i][j] = 1;
//                        break;
//                    }
//                }
//            }
//        }
//        q0044printDp(len_s + 1, len_p + 1, dp);
//    }
//
//    return dp[len_s][len_p];
//}


// bractracking, time limit exceeded
//bool q0044isMatch(char * s, char * p){
//    if (!*s || !*p) {
//        while (*p++ == '*');
//        p--;
//        if (*s == *p) {
//            return true;
//        }else{
//            return false;
//        }
//    }
//
//    if (*p == '?' || *p == *s){
//        return q0044isMatch(++s, ++p);
//    }
//
//    if (*p == '*') {
//        while (*p++ == '*');
//        p--;
//        p--;
//        return q0044isMatch(s, p + 1) || q0044isMatch(s + 1, p + 1) ||  q0044isMatch(s + 1, p);
//    }
//
//    return false;
//}

int question44(){
    char *s = "babbbbaabababaabbababaababaabbaabababbaaababbababaaaaaabbabaaaabababbabbababbbaaaababbbabbbbbbbbbbaabbb";
    char *p = "b**bb**a**bba*b**a*bbb**aba***babbb*aa****aabb*bbb***a";
    int result = q0044isMatch(s, p);
    printf("\n the result is %d\n", result);
    return 0;
}

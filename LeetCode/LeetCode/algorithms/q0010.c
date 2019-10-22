//
//  q0010.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0010.h"
#include "../common.h"

//10. Regular Expression Matching
//Hard
//Given an input string (s) and a pattern (p), implement regular expression matching with support for '.' and '*'.
//'.' Matches any single character.
//'*' Matches zero or more of the preceding element.
//The matching should cover the entire input string (not partial).
//Note:
//s could be empty and contains only lowercase letters a-z.
//p could be empty and contains only lowercase letters a-z, and characters like . or *.
//Example 1:
//Input:
//s = "aa"
//p = "a"
//Output: false
//Explanation: "a" does not match the entire string "aa".
//Example 2:
//Input:
//s = "aa"
//p = "a*"
//Output: true
//Explanation: '*' means zero or more of the precedeng element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".
//Example 3:
//Input:
//s = "ab"
//p = ".*"
//Output: true
//Explanation: ".*" means "zero or more (*) of any character (.)".
//Example 4:
//Input:
//s = "aab"
//p = "c*a*b"
//Output: true
//Explanation: c can be repeated 0 times, a can be repeated 1 time. Therefore it matches "aab".
//Example 5:
//Input:
//s = "mississippi"
//p = "mis*is*p*."
//Output: false



// first than fast than 13.61%  /(ㄒoㄒ)/~~
//bool isMatch(char* s, char* p) {
//    printf("\ns(%s) p(%s)",s,p);
//    size_t sLen = strlen(s);
//    size_t pLen = strlen(p);
//    if (sLen == 0 && pLen == 0) {
//        return true;
//    }else if(pLen == 0){
//        return false;
//    }
//    if (*(p+1) != '*') {
////        if (*p == '.' || *p == *s) {
////            return (sLen > 0 && isMatch(s+1, p+1));
////        }else{
////            return false;
////        }
//        return (sLen > 0) && (*p == '.' || *p == *s) && isMatch(s+1, p+1);
//    }else{
//        return (isMatch(s, p+2) || (sLen > 0 && (*s == *p || *p == '.') && isMatch(s+1, p)));
//    }
//}


// fast than 36%
//bool isMatch(char *s, char* p)
//{
////    printf("\ns(%s) p(%s)",s,p);
//    if(*p == '\0')
//        return *s=='\0';
//    if(*(p+1) == '*')
//        return isMatch(s, p+2) ||  //match zero letter in s;
//        (*s!='\0' && (*s==*p || '.'==*p) && isMatch(++s, p)); //match one or more;
//    else
//        return *s!='\0' && (*s==*p || '.'==*p) && isMatch(++s, ++p);
//}

//todo: dp solution
//dp solution done
bool isMatch(char *s, char* p)
{
    size_t sLen = strlen(s);
    size_t pLen = strlen(p);
    bool resultMap[sLen + 1][pLen + 1];
    memset(resultMap, 0, (sLen + 1) * (pLen + 1) * sizeof(bool));
    resultMap[0][0] = true;
    for (int i = 0; i <= sLen; i++) {
        for (int j = 1; j <= pLen; j++) {
            if (p[j - 1] == '*') {
                resultMap[i][j] = resultMap[i][j - 2] || (i > 0 && resultMap[i - 1][j] && (p[j - 2] == '.' || p[j - 2] == s[i - 1]));
            }else{
                resultMap[i][j] = i > 0 && resultMap[i - 1][j - 1] && (p[j - 1] == '.' || p[j - 1] == s[i - 1]);
            }
        }
    }
    
//    for (int i = 0; i <= sLen; i++) {
//        printf("\n");
//        for (int j = 0; j <= pLen; j++) {
//            printf(" %d",resultMap[i][j]);
//        }
//    }
//    printf("\n");
    return resultMap[sLen][pLen];
}

//
int question10(){
    char *str =
//    "bbbba";
//    "aab";
    "aa";
//    char *pattern = "b.*c";
    char *pattern =
//    ".*a*a";
//    "c*a*b";
    "a";
    //    11、121
    printf("isMatch %d\n",isMatch(str, pattern));
    return 0;
};

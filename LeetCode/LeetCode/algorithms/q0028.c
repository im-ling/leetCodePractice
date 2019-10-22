//
//  q0028.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0028.h"
#include "../common.h"



//28. Implement strStr()
//Easy
//680
//1051
//
//
//Implement strStr().
//
//Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
//
//Example 1:
//
//Input: haystack = "hello", needle = "ll"
//Output: 2
//Example 2:
//
//Input: haystack = "aaaaa", needle = "bba"
//Output: -1
//Clarification:
//
//What should we return when needle is an empty string? This is a great question to ask during an interview.
//
//For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().
int strStr(char* haystack, char* needle) {
    if (*haystack == '\0' && *needle == *haystack) {
        return 0;
    }
    char *p1Haystack = haystack;
    while (*p1Haystack != '\0') {
        char *p2Haystack = p1Haystack;
        char *pNeedle = needle;
        bool continueFlag = true;
        while (continueFlag && *pNeedle != '\0' && *p2Haystack != '\0') {
            if (*p2Haystack != *pNeedle) {
                continueFlag = false;
            }else{
                p2Haystack++;
                pNeedle++;
            }
        }
        if (*pNeedle == '\0') {
            return (int)(p1Haystack - haystack);
        }
        if (*p2Haystack == '\0') {  //!!! the difference between 0ms and 468ms
            return -1;
        }
        p1Haystack++;
    }
    return -1;
}

int question28(){
    char *str1 = "mississippi";
    char *str2 = "issip";
    printf("result: %d",strStr(str1, str2));
    return 0;
}

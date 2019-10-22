//
//  q0125.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0125.h"
#include "../common.h"


//125. Valid Palindrome
//Easy
//656
//1926
//Favorite
//
//Share
//Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
//
//Note: For the purpose of this problem, we define empty string as valid palindrome.
//
//Example 1:
//
//Input: "A man, a plan, a canal: Panama"
//Output: true
//Example 2:
//
//Input: "race a car"
//Output: false
//Accepted
//389,766
//Submissions
//1,219,557
bool q125isPalindrome(char * s){
    int len = 0;
    int enough = (int)strlen(s) + 1;
    char target[enough];
    int diff = 'a' - 'A';
    while (*s!='\0') {
        if (*s >= 'a' && *s <= 'z') {
            target[len++] = *s;
        }else if(*s >= 'A' && *s <= 'Z'){
            target[len++] = *s + diff;
        }else if(*s >= '0' && *s <= '9'){
            target[len++] = *s;
        }
        s++;
    }
    for (char *p = target,*pTail = target + len - 1 ; p < pTail;) {
        if (*p != *pTail) {
            return false;
        }
        p++;
        pTail--;
    }
    return true;
}
int question125(){
    char* s = "0P";
    bool result = q125isPalindrome(s);
    printf("result %d \n",result);
    return 0;
}

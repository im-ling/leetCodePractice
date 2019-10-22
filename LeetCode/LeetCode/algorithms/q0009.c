//
//  q0009.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0009.h"
#include "../common.h"

//9. Palindrome Number // i don't understand why it take so long?
//Easy
//1076
//1127
//Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.
//Example 1:
//Input: 121
//Output: true
//Example 2:
//Input: -121
//Output: false
//Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
//Example 3:
//Input: 10
//Output: false
//Explanation: Reads 01 from right to left. Therefore it is not a palindrome.

// cool !
// https://leetcode.com/problems/palindrome-number/discuss/151381/C-Easy-to-understand-solution-without-string-(3-lines)
bool isPalindrome(int x) {
    if (x < 10) return (x >= 0);
    int y = 0;
    for(int x2 = x; x2; y = y*10 + (x2 % 10), x2 /= 10) {}
    return x==y;
}

//bool isPalindrome(int x) {
//    if (x < 0) {
//        return false;
//    }
//    char charsNumber[12];
//    memset(charsNumber, 0, 12);
//    char *p = charsNumber;
//    while ( x != 0) {
//        *p++ = x % 10 + '0';
//        x /= 10;
//    }
//    size_t len = strlen(charsNumber);
//    char *pLeft = charsNumber;
//    char *pRight = charsNumber + len - 1;
//    while (pLeft < pRight) {
//        if (*pLeft != *pRight) {
//            return false;
//        }
//        pLeft++;
//        pRight--;
//    }
//    return true;
//}

//bool isPalindrome(int x) {
//    if (x < 0) {
//        return false;
//    }
//    return x == reverse(x);
//}


int question9(){
//    11、121
    printf("isPalindrome %d\n",isPalindrome(12321));
    return 0;
};

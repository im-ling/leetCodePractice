//
//  q0231.c
//  LeetCode
//
//  Created by NowOrNever on 08/11/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0231.h"
#include "../common.h"

//231. Power of Two
//Easy
//
//538
//
//144
//
//Favorite
//
//Share
//Given an integer, write a function to determine if it is a power of two.
//
//Example 1:
//
//Input: 1
//Output: true
//Explanation: 20 = 1
//Example 2:
//
//Input: 16
//Output: true
//Explanation: 24 = 16
//Example 3:
//
//Input: 218
//Output: false
//Accepted
//255,284
//Submissions
//600,740

bool isPowerOfTwo(int n){
    if (n < 1) {
        return 0;
    }
    return !(n & (n - 1));
}

bool isPowerOfTwo2(int n){
    if (n < 1) {
        return 0;
    }
    // (n & -n) 取最低位1
    n &=  ~(n & -n);    // 去最低位1
    return !n;
}

bool isPowerOfTwo3(int n){
    if (n < 1) {
        return 0;
    }
    while (!(n & 1)) {
        n >>= 1;
    }
    if (n == 1)
        return true;
    return 0;
}

bool isPowerOfTwo4(int n){
    if (n < 1) {
        return 0;
    }
    while (n % 2 == 0) {
        n /= 2;
    }
    if (n == 1) {
        return 1;
    }
    return 0;
}



int question231(){
    return 0;
}

//
//  q0202.c
//  LeetCode
//
//  Created by NowOrNever on 04/11/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0202.h"
#include "../common.h"

//202. Happy Number
//Easy
//
//1124
//
//287
//
//Favorite
//
//Share
//Write an algorithm to determine if a number is "happy".
//
//A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers.
//
//Example:
//
//Input: 19
//Output: true
//Explanation:
//12 + 92 = 82
//82 + 22 = 68
//62 + 82 = 100
//12 + 02 + 02 = 1
//Accepted
//283,709
//Submissions
//601,468

bool isHappy(int n){
    int border = 1000;
    int stack[border + 1];
    memset(stack, 0, sizeof(int) * (border + 1));
    int temp = 0;
    while (n > 1) {
        if (n <= border) {
            if (stack[n]) {
                return 0;
            }
            stack[n] = 1;
        }
        temp = 0;
        while (n) {
            temp += pow(n % 10, 2);
            n /= 10;
        }
        n = temp;
    }
    if (1 == n) {
        return 1;
    }
    return 0;
}

int question202(){
    int result = isHappy(19);
    printf("result of question 202 is: %d\n", result);
    return 0;
}

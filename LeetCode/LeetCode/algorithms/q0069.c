//
//  q0069.c
//  LeetCode
//
//  Created by NowOrNever on 29/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0069.h"
#include "../common.h"
//69. Sqrt(x)
//Easy
//
//931
//
//1565
//
//Favorite
//
//Share
//Implement int sqrt(int x).
//
//Compute and return the square root of x, where x is guaranteed to be a non-negative integer.
//
//Since the return type is an integer, the decimal digits are truncated and only the integer part of the result is returned.
//
//Example 1:
//
//Input: 4
//Output: 2
//Example 2:
//
//Input: 8
//Output: 2
//Explanation: The square root of 8 is 2.82842..., and since
//             the decimal part is truncated, 2 is returned.
//Accepted
//433,949
//Submissions
//1,342,416
int mySqrt(int x){
    int left = 0;
    int right = 46340;
    int middle = (left + right) / 2;
    int temp = 0;
    int result = 0;
    while (left <= right ) {
        temp = middle * middle;
        if (temp == x) {
            return middle;
        }else if (temp < x){
            left = middle + 1;
            result = middle;
        }else{
            right = middle - 1;
        }
        middle = (left + right) / 2;
    }
    return result;
}

int mySqrt2(int x){
    int left = 0;
    int right = 46340;
    int middle = (left + right) / 2;
    int temp = 0;
    while (left < right - 1) {
        temp = middle * middle;
        if (temp == x) {
            return middle;
        }else if (temp < x){
            left = middle;
        }else{
            right = middle;
        }
        middle = (left + right) / 2;
    }
    
    if (right * right <= x) {
        return right;
    }
    return left;
}

int question69(void){
    printf("%Lf\n",sqrtl(INT_MAX));
    int nums[] = {0, 4, 8, 2147395600};
    for (int i = 0; i < sizeof(nums) / sizeof(int); i++) {
        printf("sqrt(%d) is %d.\n", nums[i], mySqrt(nums[i]));
    }
    return 0;
}

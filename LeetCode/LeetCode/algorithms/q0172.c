//
//  q0172.c
//  LeetCode
//
//  Created by NowOrNever on 31/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0172.h"
#include "../common.h"
//172. Factorial Trailing Zeroes
//Easy
//
//573
//
//818
//
//Favorite
//
//Share
//Given an integer n, return the number of trailing zeroes in n!.
//
//Example 1:
//
//Input: 3
//Output: 0
//Explanation: 3! = 6, no trailing zero.
//Example 2:
//
//Input: 5
//Output: 1
//Explanation: 5! = 120, one trailing zero.
//Note: Your solution should be in logarithmic time complexity.

int trailingZeroes(int n){
    int result=0;
    while (n) {
        result += n / 5;
        n /= 5;
    }
    return result;
}
int question172(){
    printf("question 172:");
    int nums[] = {10, 28, 701};
    for (int i = 0; i < sizeof(nums) / sizeof(int); i++) {
        printf("\nnum(%d): %d", nums[i], trailingZeroes(nums[i]));
    }
    printf("\n");

    return 0;
}

//
//  q1155.c
//  LeetCode
//
//  Created by NowOrNever on 22/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q1155.h"
#include "../common.h"

//1155. Number of Dice Rolls With Target Sum
//Medium
//158
//13
//Favorite
//Share
//You have d dice, and each die has f faces numbered 1, 2, ..., f.
//Return the number of possible ways (out of fd total ways) modulo 10^9 + 7 to roll the dice so the sum of the face up numbers equals target.
//
//
//Example 1:
//Input: d = 1, f = 6, target = 3
//Output: 1
//Explanation:
//You throw one die with 6 faces.  There is only one way to get a sum of 3.
//
//Example 2:
//Input: d = 2, f = 6, target = 7
//Output: 6
//Explanation:
//You throw two dice, each with 6 faces.  There are 6 ways to get a sum of 7:
//1+6, 2+5, 3+4, 4+3, 5+2, 6+1.
//
//Example 3:
//Input: d = 2, f = 5, target = 10
//Output: 1
//Explanation:
//You throw two dice, each with 5 faces.  There is only one way to get a sum of 10: 5+5.
//
//Example 4:
//Input: d = 1, f = 2, target = 3
//Output: 0
//Explanation:
//You throw one die with 2 faces.  There is no way to get a sum of 3.
//
//Example 5:
//Input: d = 30, f = 30, target = 500
//Output: 222616187
//Explanation:
//The answer must be returned modulo 10^9 + 7.
//
//Constraints:
//1 <= d, f <= 30
//1 <= target <= 1000
//Accepted
//9,608
//Submissions
//19,918

int numRollsToTarget_backup(int d, int f, int target){
    if (d <= 0 || f <= 0 || d * f < target || d > target) {
        return 0;
    }
    int dp_array[d][f * d];
    memset(dp_array, 0, sizeof(int) * d * f * d);
    for (int i = 0; i < f; i++) {
        dp_array[0][i] = 1;
    }
    int mod_number = pow(10, 9) + 7;
    for (int i = 1; i < d; i++) {
        for (int j = i; j < i * f + f && j < target; j++) {
            int sum = 0;
            //注意边界 k >= 0
            for (int k = j - 1; k >= 0 && k >= j - f; k--) {
                sum += dp_array[i - 1][k];
                sum = sum % mod_number;
            }
            dp_array[i][j] = sum;
        }
    }
    return dp_array[d-1][target-1];
}

int numRollsToTarget(int d, int f, int target){
    if (d <= 0 || f <= 0 || d * f < target || d > target) {
        return 0;
    }
    int size = target;
    int stack1[size];
    int stack2[size];
    memset(stack1, 0, sizeof(int) * size);
    memset(stack2, 0, sizeof(int) * size);
    for (int i = 0; i < f; i++) {
        stack1[i] = 1;
    }
    
    int mod_number = pow(10, 9) + 7;
    for (int i = 1; i < d; i++) {
        stack2[i - 1] = 0;
        for (int j = i; j < i * f + f && j < target; j++) {
            int sum = 0;
            for (int k = j - 1; k >= 0 && k >= j - f; k--) {
                sum += stack1[k];
                sum = sum % mod_number;
            }
            stack2[j] = sum;
        }
        memcpy(stack1, stack2, sizeof(int) * size);
    }
    return stack1[target - 1];
}

int question1155(){
    int d = 2;
    int f = 6;
    int target = 7;
    int result = numRollsToTarget_backup(d, f, target);
    printf("\n1155 result : %d\n",result);
    return 0;
}

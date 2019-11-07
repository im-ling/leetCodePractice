//
//  q0122.c
//  LeetCode
//
//  Created by NowOrNever on 31/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0122.h"
#include "../common.h"

//122. Best Time to Buy and Sell Stock II
//Easy
//
//1342
//
//1436
//
//Favorite
//
//Share
//Say you have an array for which the ith element is the price of a given stock on day i.
//
//Design an algorithm to find the maximum profit. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times).
//
//Note: You may not engage in multiple transactions at the same time (i.e., you must sell the stock before you buy again).
//
//Example 1:
//
//Input: [7,1,5,3,6,4]
//Output: 7
//Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
//             Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
//Example 2:
//
//Input: [1,2,3,4,5]
//Output: 4
//Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
//             Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are
//             engaging multiple transactions at the same time. You must sell before buying again.
//Example 3:
//
//Input: [7,6,4,3,1]
//Output: 0
//Explanation: In this case, no transaction is done, i.e. max profit = 0.
//Accepted
//391,479
//Submissions
//732,360

int q122maxProfit(int* prices, int pricesSize){
    int result = 0;
    for (int i = 1; i < pricesSize; i++) {
        int try = prices[i] - prices[i - 1];
        if (try > 0) {
            result += try;
        }
    }
    return result;
}

int question122(){
    int nums[] = {7,1,5,3,6,4};
    printf("the result of question 122 is : %d\n",q122maxProfit(nums, sizeof(nums) / sizeof(int)));
    return 0;
}

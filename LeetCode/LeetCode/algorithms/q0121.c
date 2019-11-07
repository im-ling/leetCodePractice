//
//  q0121.c
//  LeetCode
//
//  Created by NowOrNever on 31/10/2019.
//  Copyright © 2019 DoubleL. All rights reserved.
//

#include "q0121.h"
#include "../common.h"

//121. Best Time to Buy and Sell Stock
//Easy
//
//3330
//
//149
//
//Favorite
//
//Share
//Say you have an array for which the ith element is the price of a given stock on day i.
//
//If you were only permitted to complete at most one transaction (i.e., buy one and sell one share of the stock), design an algorithm to find the maximum profit.
//
//Note that you cannot sell a stock before you buy one.
//
//Example 1:
//
//Input: [7,1,5,3,6,4]
//Output: 5
//Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
//             Not 7-1 = 6, as selling price needs to be larger than buying price.
//Example 2:
//
//Input: [7,6,4,3,1]
//Output: 0
//Explanation: In this case, no transaction is done, i.e. max profit = 0.
//Accepted
//623,836
//Submissions
//1,284,425

int maxProfit(int* prices, int pricesSize){
    int result = 0;
    int buy = INT_MAX;
    int sell = INT_MIN;
    for (int i = 0; i < pricesSize; i++) {
        if (buy > prices[i]) {
            buy = prices[i];
            sell = INT_MIN;
        }else if(sell < prices[i]){
            sell = prices[i];
            if (result < sell - buy) {
                result = sell - buy;
            }
        }
    }
    return result;
}
int question121(){
    
    
    return 0;
}

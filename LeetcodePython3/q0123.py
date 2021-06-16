#!/usr/bin/python3
from typing import List


class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        length = len(prices)
        if length < 2:
            return 0
        profit1 = 0
        profit2 = 0
        buy1 = -prices[0]
        buy2 = -prices[0]
        for price in prices:
            profit2 = max(profit2, price + buy2)
            buy2 = max(buy2, profit1 - price)
            profit1 = max(profit1, price + buy1)
            buy1 = max(buy1, -price)
        return profit2

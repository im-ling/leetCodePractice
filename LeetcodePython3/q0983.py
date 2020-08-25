#!/usr/bin/python3
from typing import List


class Solution:
    def mincostTickets(self, days: List[int], costs: List[int]) -> int:
        length = days[-1] + 1
        dp = [0 for _ in range(length)]
        sets = set(days)
        for i in range(1,length):
            if i not in sets:
                dp[i] = dp[i - 1]
            else:
                value1 = costs[0] + dp[i - 1]
                value2 = costs[1]
                if i >= 7:
                    value2 += dp[i - 7]
                value3 = costs[2]
                if i >= 30:
                    value3 += dp[i - 30]
                dp[i] = min(value1, value2, value3)
        return dp[length - 1]

    def mincostTickets2(self, days: List[int], costs: List[int]) -> int:
        length_days = len(days)
        dp = [0 for _ in range(length_days)]
        dp[0] = min(costs[0], costs[1], costs[2])

        for i in range(1, length_days):
            value1 = costs[0] + dp[i - 1]
            value2 = costs[1]
            if days[i] > 7:
                index = i
                while index >= 0 and days[index] > days[i] - 7:
                    index -= 1
                if index >= 0:
                    value2 += dp[index]
            value3 = costs[2]
            if days[i] > 30:
                index = i
                while index >= 0 and days[index] > days[i] - 30:
                    index -= 1
                if index >= 0:
                    value3 += dp[index]
            dp[i] = min(value1, value2, value3)
        return dp[length_days - 1]

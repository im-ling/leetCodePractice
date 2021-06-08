#!/usr/bin/python3
from typing import List


class Solution:
    def lastStoneWeightII_dp(self, stones: List[int]) -> int:
        sum = 0
        for stone in stones:
            sum += stone
        target = sum >> 1
        len_stones = len(stones)
        dp = [[False for _ in range(target + 1)] for _ in range(len_stones + 1)]
        for i in range(len_stones + 1):
            dp[i][0] = True
        for i in range(1, len_stones + 1):
            for j in range(1, target + 1):
                stone = stones[i - 1]
                if j < stone:
                    dp[i][j] = dp[i - 1][j]
                else:
                    dp[i][j] = dp[i - 1][j] or dp[i - 1][j - stone]
        j = target
        while not dp[len_stones][j]:
            j -= 1
        return sum - j * 2





    def lastStoneWeightII_map_faster(self, stones: List[int]) -> int:
        sum = 0
        for stone in stones:
            sum += stone
        target = (sum >> 1) + 1

        set1 = set()
        max = 0
        for i in range(len(stones)):
            set2 = set1.copy()
            stone = stones[i]
            if stone < target:
                set2.add(stone)
                if stone > max:
                    max = stone
            for key in set1:
                current = key + stone
                if current < target:
                    set2.add(current)
                    if max < current:
                        max = current
            set1 = set2
        return sum - max * 2




    def lastStoneWeightII(self, stones: List[int]) -> int:
        set1 = set()
        set1.add(stones[0])
        set1.add(-stones[0])
        for i in range(1, len(stones)):
            stone = stones[i]
            set2 = set()
            for key in set1:
                set2.add(key + stone)
                set2.add(key - stone)
            set1 = set2
        result = 100
        for key in set1:
            if abs(key) < result:
                result = abs(key)
        return result


nums = [31,26,33,21,40]
result = Solution().lastStoneWeightII(nums)
print(result)
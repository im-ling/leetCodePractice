#!/usr/bin/python3
from typing import List


class Solution:
    def findTargetSumWays(self, nums: List[int], target: int) -> int:
        sum = 0
        for num in nums:
            sum += num

        if target > sum or (sum - target) % 2 != 0:
            return 0

        border = (sum - target) >> 1
        length = len(nums)
        dp = [[0 for _ in range(border + 1)] for _ in range(length + 1)]
        dp[0][0] = 1

        for i in range(1, length + 1):
            num = nums[i - 1]
            for j in range(border + 1):
                if j < num:
                    dp[i][j] = dp[i - 1][j]
                else:
                    dp[i][j] = dp[i - 1][j - num] + dp[i - 1][j]
        return dp[length][border]



    def findTargetSumWays_map_solution(self, nums: List[int], target: int) -> int:
        map = {}
        if nums[0] == 0:
            map = {0: 2}
        else:
            map = {nums[0]: 1, -nums[0]: 1}

        for i in range(1, len(nums)):
            new_map = {}
            for key in map.keys():
                new_key = key + nums[i]
                if new_key in new_map:
                    new_map[new_key] += map[key]
                else:
                    new_map[new_key] = map[key]
                new_key = key - nums[i]
                if new_key in new_map:
                    new_map[new_key] += map[key]
                else:
                    new_map[new_key] = map[key]
            map = new_map
        if target in map:
            return map[target]
        else:
            return 0


nums = [1,1,1,1,1]
target = 3
result = Solution().findTargetSumWays(nums, target)
print(result)
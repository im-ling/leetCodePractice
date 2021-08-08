from typing import List


class Solution:
    def rob(self, nums: List[int]) -> int:
        length = len(nums)
        dp = [[0, 0] for _ in range(length)]
        dp[0][0] = nums[0]
        for i in range(1, length):
            dp[i][1] = max(dp[i - 1][1], dp[i - 1][0])
            dp[i][0] = dp[i - 1][1] + nums[i]
        return max(dp[length - 1][0], dp[length - 1][1])

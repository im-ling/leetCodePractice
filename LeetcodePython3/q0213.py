from typing import List


class Solution:
    def rob(self, nums: List[int]) -> int:
        length = len(nums)
        if length < 4:
            nums.sort()
            return nums[-1]
        dp = [[0, 0] for _ in range(length)]
        for i in range(1, length):
            dp[i][0] = dp[i - 1][1] + nums[i]
            dp[i][1] = max(dp[i - 1][0], dp[i - 1][1])

        dp2 = [[0, 0] for _ in range(length)]
        dp2[0][0] = nums[0]
        for i in range(1, length - 1):
            dp2[i][0] = dp2[i - 1][1] + nums[i]
            dp2[i][1] = max(dp2[i - 1][0], dp2[i - 1][1])

        return max(dp[length - 1][0], dp[length - 1][1], dp2[length - 2][0], dp2[length - 2][1])

nums = [1,2,3,1]
result = Solution().rob(nums)
print(result)

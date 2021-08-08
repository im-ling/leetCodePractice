from typing import List


class Solution:
    def canJump(self, nums: List[int]) -> bool:
        start = 0
        end = 0
        length = len(nums) - 1
        while start < end < length:
            max_val = 0
            for i in range(start, end + 1):
                max_val = max(max_val, i + nums[i])
            start = end + 1
            end = max_val
        return end >= length


nums = [1, 1, 1, 1]
result = Solution().canJump(nums)
print(result)
#!/usr/bin/python3
from typing import List

class Solution:
    def lengthOfLIS(self, nums: List[int]) -> int:
        length = len(nums)
        stack = [0 for _ in range(length)]
        stack[0] = nums[0]
        count = 1

        for i in range(1, length):
            num = nums[i]

            left = 0
            right = count - 1
            index = -1
            while left <= right:
                mid = (left + right) >> 1
                if num > stack[mid]:
                    left = mid + 1
                    index = mid
                else:
                    right = mid - 1
            index += 1
            stack[index] = num
            if index == count:
                count += 1
        return count


nums = [10,9,2,5,3,7,101,18]
result = Solution().lengthOfLIS(nums)
print(result)
    # def lengthOfLIS(self, nums: List[int]) -> int:
    #     length = len(nums)
    #     dp = [1 for _ in range(length)]
    #     result = 0
    #     for i in range(1, length):
    #         for j in reversed(range(0, i)):
    #             if nums[i] > nums[j]:
    #                 dp[i] = max(dp[i], dp[j] + 1)
    #                 if dp[i] > result:
    #                     result = dp[i]
    #     return result
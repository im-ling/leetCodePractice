#!/usr/bin/python3
from typing import List


class Solution:
    def findKthLargest(self, nums: List[int], k: int) -> int:
        def search_helper(nums, k, low, high):
            o_low = low
            o_high = high
            guide = nums[low]
            low += 1
            while low <= high:
                while low <= high and nums[low] <= guide:
                    low += 1
                while nums[high] > guide:
                    high -= 1
                if low < high:
                    tmp = nums[low]
                    nums[low] = nums[high]
                    nums[high] = tmp
                    low += 1
                    high -= 1
            low -= 1
            nums[o_low] = nums[low]
            nums[low] = guide
            if low == k:
                return guide
            elif low < k:
                return search_helper(nums, k, low + 1, o_high)
            else:
                return search_helper(nums, k, o_low, low - 1)

        length = len(nums)
        return search_helper(nums, length - k, 0, length - 1)

nums = [3,2,3,1,2,4,5,5,6]
k = 4
result = Solution().findKthLargest(nums, k)
print(result)
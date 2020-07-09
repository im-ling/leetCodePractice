#!/usr/bin/python3
from typing import List


class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        result: List[List[int]] = []
        nums.sort()
        # print(nums)
        length = len(nums)
        if length < 0:
            return result
        for i in range(length):
            if i > 0 and nums[i] == nums[i - 1]:
                continue
            target = -nums[i]
            left = i + 1
            right = length - 1
            while left < right:
                sum = nums[left] + nums[right]
                if sum == target:
                    result.append([nums[i], nums[left], nums[right]])
                    left += 1
                    right -= 1
                    while left < right and nums[left] == nums[left - 1]:
                        left += 1
                    while right > left and nums[right] == nums[right + 1]:
                        right -= 1
                elif sum < target:
                    left += 1
                else:
                    right -= 1
        return result


solu = Solution()
nums = [-4,-2,1,-5,-4,-4,4,-2,0,4,0,-2,3,1,-5,0]
result = solu.threeSum(nums)
print(result)

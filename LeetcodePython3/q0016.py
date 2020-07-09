#!/usr/bin/python3
from typing import List


class Solution:
    def threeSumClosest(self, nums: List[int], target: int) -> int:
        result = target
        nums.sort()
        # print(nums)
        length = len(nums)
        minDistance = 1000 * 2
        if length < 3:
            return result
        for i in range(length):
            if i > 0 and nums[i] == nums[i - 1]:
                continue
            tmp = target - nums[i]
            left = i + 1
            right = length - 1
            while left < right:
                distance = abs(nums[left] + nums[right] + nums[i] - target)
                if distance == 0:
                    return target
                elif distance < minDistance:
                    minDistance = distance
                    result = nums[i] + nums[left] + nums[right]
                sum = nums[left] + nums[right]
                if sum < tmp:
                    left += 1
                    while left < right and nums[left] == nums[left - 1]:
                        left += 1
                else:
                    right -= 1
                    while left < right and nums[right] == nums[right + 1]:
                        right -= 1
        return result

solu = Solution()
nums = [0,1,2]
result = solu.threeSumClosest(nums,0)
print(result)

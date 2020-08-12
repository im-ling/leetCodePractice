#!/usr/bin/python3
from typing import List

class Solution:
    def triangleNumber(self, nums: List[int]) -> int:
        result = 0
        nums.sort()
        length = len(nums)
        if length < 3:
            return result
        for i in range(length - 2):
            left = i + 1
            right = length - 1
            while left < right:
                if nums[i] + nums[left] > nums[right]:
                    result += right - left
                    left += 1
                else:
                    right -= 1
        return result

    def triangleNumber2(self, nums: List[int]) -> int:
        result = 0
        nums.sort()
        length = len(nums)
        if length < 3:
            return result
        for i in range(length - 2):

            for j in range(i + 1, length - 1):
                sum_i_j = nums[i] + nums[j]
                index = j + 1
                if sum_i_j <= nums[index]:
                    continue
                left = index
                right = length - 1

                while left <= right:
                    mid = (left + right) // 2
                    # print(left, right, mid)
                    if sum_i_j > nums[mid]:
                        index = mid
                        left = mid + 1
                    else:
                        right = mid - 1
                result += index - j
                # print("---",i, j ,index)
        return result

nums = [2, 2, 3, 4]
result = Solution().triangleNumber(nums)
print(result)
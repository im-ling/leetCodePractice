#!/usr/bin/python3
from typing import List


class Solution:
    def minOperations(self, nums: List[int]) -> int:
        result = 0
        new_nums = sorted(nums, reverse=True)
        while len(new_nums) > 0:
            print(len(new_nums))
            print(new_nums)
            if new_nums[-1] == 0:
                new_nums.pop(len(new_nums) - 1)
            elif new_nums[-1] == 1:
                new_nums.pop(len(new_nums) - 1)
                result += 1
            else:
                flag = True
                for i in range(len(new_nums)):
                    if new_nums[i] & 0x1 == 1:
                        new_nums[i] -= 1
                        result += 1
                        flag = False
                if flag:
                    for i in range(len(new_nums)):
                        new_nums[i] >>= 1
                    result += 1
        return result

nums = [2,4,8,16]
result = Solution().minOperations(nums)
print(result)
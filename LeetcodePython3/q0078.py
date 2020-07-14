#!/usr/bin/python3
from typing import List

class Solution:
    def subsets_helper(self, nums:List[int], target_len: int, maxLen: int, currentIndex: int, currentLen: int, path: List[int], result: List[List[int]]):
        if currentLen == target_len:
            result.append(path.copy())
            return
        if currentLen + maxLen - currentIndex < target_len or currentIndex > maxLen - 1:
            return
        for i in range(currentIndex, maxLen):
            path.append(nums[i])
            self.subsets_helper(nums, target_len, maxLen, 1 + i, currentLen + 1, path, result)
            del path[-1]


    def subsets(self, nums: List[int]) -> List[List[int]]:
        result: List[List[int]] = list()
        path: List[int] = list()
        length = len(nums)
        for i in range(length + 1):
            self.subsets_helper(nums, i, length, 0, 0, path, result)
        return result

solu = Solution()
nums = [1,2,3]
result = solu.subsets(nums)
print(result)
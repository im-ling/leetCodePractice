#!/usr/bin/python3
from typing import List


class Solution:
    def permuteUnique_helper(self, nums: List[int], flags: List[bool], index: int, targetLen: int, path: List[int],
                             result: List[List[int]]):
        if index == targetLen:
            result.append(path.copy())
            return
        for i in range(targetLen):
            if flags[i]:
                if i > 0 and nums[i] == nums[i - 1] and not (flags[i - 1]):
                    continue
                flags[i] = False
                path.append(nums[i])
                self.permuteUnique_helper(nums, flags, index + 1, targetLen, path, result)
                path.pop()
                flags[i] = True

    def permuteUnique(self, nums: List[int]) -> List[List[int]]:
        result = list()
        path = list()
        sortedNums = sorted(nums)
        flags: List[bool] = [True for _ in range(len(nums))]
        self.permuteUnique_helper(sortedNums, flags, 0, len(nums), path, result)
        return result

nums = [1,1,2]
solu = Solution()
result = solu.permuteUnique(nums)
print(result)
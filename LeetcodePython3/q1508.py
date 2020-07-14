#!/usr/bin/python3
from typing import List

class Solution:
    def rangeSum(self, nums: List[int], n: int, left: int, right: int) -> int:
        prime = 1000000007
        result = 0
        newNums = []
        for i in range(n):
            sum = 0
            for j in range(i, n):
                sum += nums[j]
                if sum >= prime:
                    sum %= prime
                newNums.append(sum)
        newNums.sort()
        print(newNums)
        for i in range(left - 1, right):
            result += newNums[i]
            if result >= prime:
                result %= prime
        return result





solu = Solution()
nums = [1,2,3,4]
result = solu.rangeSum(nums, 4, 1, 10)
print(result)
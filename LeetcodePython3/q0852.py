#!/usr/bin/python3
from typing import List

class Solution:
    def peakIndexInMountainArray(self, A: List[int]) -> int:
        result = 0
        for i in range(1, len(A)):
            if A[i] > A[result]:
                result = i
            else:
                break
        return result


A = [0,2,1,0]
result = Solution().peakIndexInMountainArray(A)
print(result)
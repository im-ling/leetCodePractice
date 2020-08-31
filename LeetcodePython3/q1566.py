#!/usr/bin/python3
from typing import List


class Solution:
    def containsPattern(self, arr: List[int], m: int, k: int) -> bool:
        if k == 1:
            return len(arr) >= m
        length = len(arr)
        for i in range(length - m * k + 1):
            flag = True
            for j in range(m):
                for _k in range(1, k):
                    if arr[i + j] != arr[i + j + m * _k]:
                        flag = False
                        break
                if not flag:
                    break
            if flag:
                return True
        return False

arr = [1,2,1,2,1,3]
m = 2
k = 3

result = Solution().containsPattern(arr,m,k)
print(result)
#!/usr/bin/python3
from typing import List


class Solution:
    def combinationSum3(self, k: int, n: int) -> List[List[int]]:
        result = list()
        path = list()
        flags = [True for i in range(10)]

        def combinationSum3_helper(k:int, n: int, current:int, flags:List[bool], path:List[int], result:List):
            if k == 0 and n == 0:
                result.append(path.copy())
            for i in range(current, 10):
                if flags[i]:
                    flags[i] = False
                    path.append(i)
                    combinationSum3_helper(k - 1, n - i, i + 1, flags, path, result)
                    path.pop()
                    flags[i] = True
        combinationSum3_helper(k, n, 1, flags, path, result)
        return result



k = 3
n = 7
result = Solution().combinationSum3(k, n)
print(result)
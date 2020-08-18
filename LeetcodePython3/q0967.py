#!/usr/bin/python3
from typing import List


class Solution:
    base = 0

    def numsSameConsecDiff_helper(self, K: int, current: int, result: list):
        # print(current,current % 10)
        if current >= self.base:
            result.append(current)
            return
        last = current % 10
        if last + K < 10:
            self.numsSameConsecDiff_helper(K, current * 10 + last + K, result)
        if last - K >= 0:
            self.numsSameConsecDiff_helper(K, current * 10 + last - K, result)

    def numsSameConsecDiff(self, N: int, K: int) -> List[int]:
        if N == 1:
            return [i for i in range(10)]
        result = list()
        if K == 0:
            for i in range(1,10):
                number = i
                for j in range(N - 1):
                    number = 10 * number + i
                result.append(number)
            return result

        self.base = 1
        while N > 1:
            self.base *= 10
            N -= 1
        for i in range(1, 10):
            self.numsSameConsecDiff_helper(K, i, result)
        return result

N = 2
K = 0
result = Solution().numsSameConsecDiff(N, K)
print(result)
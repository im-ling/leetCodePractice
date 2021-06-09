#!/usr/bin/python3
from typing import List

class Solution:
    def candy(self, ratings: List[int]) -> int:
        length = len(ratings)
        array1 = [1 for _ in range(length)]
        array2 = [1 for _ in range(length)]

        for i in range(1, length):
            if ratings[i] > ratings[i - 1]:
                array1[i] = array1[i - 1] + 1

        for i in reversed(range(length - 1)):
            if ratings[i] > ratings[i + 1]:
                array2[i] = array2[i + 1] + 1

        result = 0
        for i in range(length):
            result += max(array1[i], array2[i])
        return result


ratings = [1,2,2]
result = Solution().candy(ratings)
print(result)
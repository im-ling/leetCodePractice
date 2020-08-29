#!/usr/bin/python3
from typing import List


class Solution:
    def findLatestStep(self, arr: List[int], m: int) -> int:
        length = len(arr)
        if length == m:
            return m
        if length < m:
            return -1

        count_m = 0
        array2 = [0 for _ in range(length + 2)]
        result = -1
        for i in range(length):
            index = arr[i]
            if array2[index - 1] == m:
                count_m -= 1
            if array2[index + 1] == m:
                count_m -= 1
            array2[index] = array2[index - 1] + array2[index + 1] + 1
            if array2[index - 1] > 0:
                array2[index - array2[index - 1]] = array2[index]
            if array2[index + 1] > 0:
                array2[index + array2[index + 1]] = array2[index]
            if array2[index] == m:
                count_m += 1
            if count_m > 0:
                result = i + 1
        return result


arr = [3,1,5,4,2]
m = 2
result = Solution().findLatestStep(arr, m)
print(result)

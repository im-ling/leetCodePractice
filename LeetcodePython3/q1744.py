#!/usr/bin/python3
from typing import List


class Solution:
    def canEat(self, candiesCount: List[int], queries: List[List[int]]) -> List[bool]:
        result = list()
        sum = 0
        sumCount = list()
        for count in candiesCount:
            sumCount.append(sum)
            sum += count
        for i in range(len(queries)):
            array = queries[i]
            flag = array[2] * (array[1] + 1) > sumCount[array[0]] and array[1] < sumCount[array[0]] + candiesCount[array[0]]
            result.append(flag)
        return result

candiesCount = [46,5,47,48,43,34,15,26,11,25,41,47,15,25,16,50,32,42,32,21,36,34,50,45,46,15,46,38,50,12,3,26,26,16,23,1,4,48,47,32,47,16,33,23,38,2,19,50,6,19,29,3,27,12,6,22,33,28,7,10,12,8,13,24,21,38,43,26,35,18,34,3,14,48,50,34,38,4,50,26,5,35,11,2,35,9,11,31,36,20,21,37,18,34,34,10,21,8,5]
queries = [[85,54,42]]
result = Solution().canEat(candiesCount, queries)
print(result)
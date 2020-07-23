#!/usr/bin/python3
from typing import List

class Solution:
    def canCompleteCircuit(self, gas: List[int], cost: List[int]) -> int:
        sumGas = 0
        sumCost = 0
        current = 0
        result = 0
        length = len(gas)
        for i in range(length):
            current += gas[i] - cost[i]
            if current < 0:
                current = 0
                result = i + 1
            sumGas += gas[i]
            sumCost += cost[i]
        if sumGas < sumCost:
            return -1
        return result


gas =  [1,2,3,4,5]
cost = [3,4,5,1,2]
solu = Solution()
result = solu.canCompleteCircuit(gas, cost)
print(result)
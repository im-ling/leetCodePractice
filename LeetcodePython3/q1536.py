from typing import List

class Solution:
    def minSwaps(self, grid: List[List[int]]) -> int:
        result = 0
        numberOfZeroArray = list()
        sideLen = len(grid)
        for i in range(sideLen):
            numberOfZero = 0
            for j in reversed(range(sideLen)):
                if grid[i][j] == 0:
                    numberOfZero += 1
                else:
                    break
            numberOfZeroArray.append(numberOfZero)

        for i in range(sideLen - 1):
            j = sideLen - i - 1
            k = i
            while k < sideLen and numberOfZeroArray[k] < j:
                k += 1
            if k == sideLen:
                return -1
            result += k - i
            number = numberOfZeroArray.pop(k)
            numberOfZeroArray.insert(i, number)
        return result





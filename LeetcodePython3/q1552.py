#!/usr/bin/python3
from typing import List


class Solution:
    def maxDistance(self, position: List[int], m: int) -> int:
        position.sort()
        minVal = position[0]
        maxVal = position[0]

        for item in position:
            if minVal > item:
                minVal = item
            if maxVal < item:
                maxVal = item

        def isVaild(n) -> bool:
            count = 0
            cur = position[0]
            for item in position:
                # print(item, cur, n)
                if item - cur >= n:
                    count += 1
                    cur = item
            # print(cur, m - 1)
            return count >= m - 1

        result = 0
        left = 0
        right = maxVal - minVal
        while left <= right:
            mid = (left + right) // 2
            if isVaild(mid):
                result = mid
                left = mid + 1
            else:
                right = mid - 1
        return result

position = [1,2,3,4,7]
m = 3
result = Solution().maxDistance(position, m)
print(result)
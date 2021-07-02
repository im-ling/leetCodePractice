from typing import List


class Solution:
    def maxIceCream(self, costs: List[int], coins: int) -> int:
        costs.sort()
        result = 0
        for cost in costs:
            if coins >= cost:
                coins -= cost
                result += 1
            else:
                break
        return result


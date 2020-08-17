#!/usr/bin/python3
from typing import List


class Solution:
    def distributeCandies(self, candies: int, num_people: int) -> List[int]:
        level_require = (num_people + 1) * num_people // 2
        levels = 0
        while candies > level_require:
            candies -= level_require
            levels += 1
            level_require += num_people * num_people
        base = (levels * (levels - 1) // 2) * num_people
        result = list()
        for i in range(num_people):
            number = base + levels * (i + 1)
            if candies > 0:
                if candies >= i + 1 + levels * num_people:
                    candies -= i + 1 + levels * num_people
                    number += i + 1 + levels * num_people
                else:
                    number += candies
                    candies = 0
            result.append(number)
        return result

print(Solution().distributeCandies(1000000000, 1000))
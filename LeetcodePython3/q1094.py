#!/usr/bin/python3
from typing import List


class Solution:
    def carPooling(self, trips: List[List[int]], capacity: int) -> bool:
        trips.sort(key=lambda x: x[1])
        current_list = list()
        current_number = 0
        for trip in trips:
            start = trip[1]
            for i in reversed(range(len(current_list))):
                if current_list[i][2] <= start:
                    current_number -= current_list[i][0]
                    current_list.pop(i)
            current_number += trip[0]
            # print(current_number, current_list, trip)
            current_list.append(trip)
            if current_number > capacity:
                return False
        return True

trips = [[3,2,7],[3,7,9],[8,3,9]]
cap = 11
result = Solution().carPooling(trips, cap)
print(result)

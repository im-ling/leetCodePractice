#!/usr/bin/python3
from typing import List
class Solution:
    def mostVisited(self, n: int, rounds: List[int]) -> List[int]:
        times = [0 for _ in range(n)]
        times[rounds[0] - 1] = 1
        last = rounds[0]
        for number in rounds:
            if number == last:
                continue
            elif number > last:
                for i in range(last,number):
                    times[i % n] += 1
                last = number
            else:
                for i in range(last, number + n):
                    times[i % n] += 1
                last = number
            print(times)
        maxVal = times[0]
        for time in times:
            if time > maxVal:
                maxVal = time
        result = list()
        for i in range(len(times)):
            if times[i] == maxVal:
                result.append(i + 1)
        return result

n = 7
rounds = [7,1,7]
result = Solution().mostVisited(n, rounds)
print(result)
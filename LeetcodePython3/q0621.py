#!/usr/bin/python3
from typing import List

class Solution:
    def leastInterval(self, tasks: List[str], n: int) -> int:
        dic = {}
        for str in tasks:
            if str not in dic:
                dic[str] = 0
            dic[str] += 1
        result = 0
        values = list(dic.values())
        values.sort()
        maxVal = values[len(values) - 1]
        length = (maxVal - 1) * (n + 1)
        index = len(values) - 1
        while index >= 0 and values[index] == maxVal:
            length += 1
            index -= 1
        if length > len(tasks):
            return length
        else:
            return len(tasks)

    def leastInterval2(self, tasks: List[str], n: int) -> int:
        dic = {}
        for str in tasks:
            if str not in dic:
                dic[str] = 0
            dic[str] += 1

        result = 0
        values = list(dic.values())
        values.sort()
        lastIdle = 0
        while len(values) > 0:
            length = len(values)
            if length > n:
                result += n + 1
                index = length - 1
                while index >= length - 1 - n:
                    values[index] -= 1
                    if values[index] == 0:
                        values.pop(index)
                    index -= 1
                values.sort()
            else:
                result += n + 1
                lastIdle = n + 1 - length
                for i in reversed(range(length)):
                    values[i] -= 1
                    if values[i] == 0:
                        values.pop(i)
                values.sort()
        return result - lastIdle

solu = Solution()
tasks = ["A","A","A","B","B","B"]
n = 2
result = solu.leastInterval(tasks, n)
print(result)
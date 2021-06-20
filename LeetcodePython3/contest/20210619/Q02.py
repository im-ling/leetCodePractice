#!/usr/bin/python3
from typing import List

# https://leetcode-cn.com/problems/WqXACV/
class Solution:
    def halfQuestions(self, questions: List[int]) -> int:
        map = {}
        for ques in questions:
            if ques not in map:
                map[ques] = 1
            else:
                map[ques] += 1
        array = list()
        for key in map.keys():
            array.append(map[key])
        array = sorted(array)[::-1]
        i = 0
        target = len(questions) // 2
        sum = 0
        while sum < target:
            sum += array[i]
            i += 1
        return i
questions = [2,1,6,2]
result = Solution().halfQuestions(questions)
print(result)


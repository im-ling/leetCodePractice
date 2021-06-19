#!/usr/bin/python3
from typing import List

class Solution:
    def validateStackSequences(self, pushed: List[int], popped: List[int]) -> bool:
        stack = list()
        index = 0
        for num in pushed:
            stack.append(num)
            print(stack, index)
            while len(stack) > 0 and stack[-1] == popped[index]:
                stack.pop()
                index += 1
        return index == len(popped)


pushed = [1,2,3,4,5]
poped = [4,5,3,2,1]
result = Solution().validateStackSequences(pushed, poped)




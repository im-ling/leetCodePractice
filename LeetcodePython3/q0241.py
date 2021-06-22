#!/usr/bin/python3
from typing import List


class Solution:
    def diffWaysToCompute(self, expression: str) -> List[int]:
        nums_stack = [0 for _ in range(10)]
        operation_stack = []
        index = 0
        for char in expression:
            if ord("0") <= ord(char) <= ord("9"):
                nums_stack[index] = nums_stack[index] * 10 + ord(char) - ord("0")
            else:
                operation_stack.append(char)
                index += 1
        # print(nums_stack)
        # print(operation_stack)

        map = {}
        length = index
        for i in range(length + 1):
            map[i] = {i: [nums_stack[i]]}

        def left_to_right(left, right) -> List[int]:
            if right in map[left]:
                return map[left][right]

            result = []
            for i in range(left, right):
                left_list = left_to_right(left, i)
                right_list = left_to_right(i + 1, right)
                op = operation_stack[i]
                for num_left in left_list:
                    for num_right in right_list:
                        if op == "+":
                            result.append(num_left + num_right)
                        elif op == "*":
                            result.append(num_left * num_right)
                        else:
                            result.append(num_left - num_right)
            map[left][right] = result
            return result

        # print(map)

        return left_to_right(0, length)


expression = "2*3-4*5"
result = Solution().diffWaysToCompute(expression)
print(result)

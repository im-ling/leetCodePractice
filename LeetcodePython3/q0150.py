#!/usr/bin/python3
from typing import List


class Solution:
    def evalRPN(self, tokens: List[str]) -> int:
        def is_symbol(chars: str) -> bool:
            return chars == "+" or chars == "-" or chars == "*" or chars == "/"

        def cal(num1, num2, char) -> int:
            if char == "+":
                return num1 + num2
            elif char == "-":
                return num1 - num2
            elif char == "*":
                return num1 * num2
            elif char == "/":
                res = num1 // num2
                if res < 0 and num1 % num2 != 0:
                    res += 1
                return res
            else:
                return 0

        stack = list()
        for token in tokens:
            if is_symbol(token):
                num2 = stack.pop()
                num1 = stack.pop()
                stack.append(cal(num1, num2, token))
                # print(stack[len(stack) - 1])
            else:
                stack.append(int(token))

        return stack.pop()


tokens = ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]
result = Solution().evalRPN(tokens)
print(result)

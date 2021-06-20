class Solution:
    def fib(self, n: int) -> int:
        if n < 2:
            return n
        num1 = 0
        num2 = 1
        index = 1
        factor = 1000000007
        while index < n:
            num2 = (num1 + num2) % factor
            num1 = (num2 - num1 + factor) % factor
            index += 1
        return num2
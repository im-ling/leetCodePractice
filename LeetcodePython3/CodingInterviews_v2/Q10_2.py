# https://leetcode-cn.com/problems/qing-wa-tiao-tai-jie-wen-ti-lcof/
class Solution:
    def numWays(self, n: int) -> int:
        if n < 2:
            return 1
        num1 = 1
        num2 = 1
        index = 1
        factor = 1000000007
        while index < n:
            num2 = (num1 + num2) % factor
            num1 = (num2 - num1 + factor) % factor
            index += 1
        return num2
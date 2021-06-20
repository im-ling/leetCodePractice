# https://leetcode-cn.com/problems/Ju9Xwi/
class Solution:
    def leastMinutes(self, n: int) -> int:
        i = 1
        sum = 1
        while sum < n:
            i += 1
            sum <<= 1
        return i

class Solution:
    def minOperations(self, n: int) -> int:
        times = n // 2
        if n & 0x1 == 0x0:
            return times * times
        else:
            return (times + 1) * times

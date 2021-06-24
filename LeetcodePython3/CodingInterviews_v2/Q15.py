class Solution:
    def hammingWeight(self, n: int) -> int:
        result = 0
        if n < 0:
            n += 1 << 32
        while n != 0:
            result += 0x1 & n
            n >>= 1
        return result
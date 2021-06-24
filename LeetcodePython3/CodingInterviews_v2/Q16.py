class Solution:
    def myPow(self, x: float, n: int) -> float:
        if x == 0:
            return 0
        if n < 0:
            x = 1 / x
            n = -n
        base = x
        result = 1
        while n > 0:
            if n & 0x1 == 0x1:
                result *= base
            n >>= 1
            base = base * base
        return result
class Solution:
    def cuttingRope(self, n: int) -> int:
        if n <= 3:
            return n - 1
        factor = 1000000007
        res = 1
        if n % 3 == 1:
            for i in range(n // 3 - 1):
                res = res * 3 % factor
            res = res * 4 % factor
        else:
            for i in range(n // 3):
                res = res * 3 % factor
            if n % 3 == 2:
                res = res * 2 % factor
        return res
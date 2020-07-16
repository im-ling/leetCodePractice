class Solution:
    def myPow(self, x: float, n: int) -> float:
        if x == 1 or x == 0:
            return x
        if x == - 1:
            if n % 2 == 0:
                return 1
            else:
                return -1
        if n < 0:
            x = 1 / x
            n = -n
        result = 1
        while n != 0:
            if n % 2 != 0:
                result *= x
            n = n // 2
            x = x * x
        return result


solu = Solution()
x = 2.00000
n = -2
result = solu.myPow(x, n)
print(result)
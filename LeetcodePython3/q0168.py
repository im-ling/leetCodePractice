class Solution:
    def convertToTitle(self, n: int) -> str:
        result = ""
        base = ord("A")
        while n > 0:
            # from 1-26 to 0-25
            n = n - 1
            result = chr(n % 26 + base) + result
            n //= 26
        return result
result = Solution().convertToTitle(701)
print(result)
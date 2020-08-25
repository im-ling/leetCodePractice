class Solution:
    def thousandSeparator(self, n: int) -> str:
        result = ""
        while n >= 1000:
            result = "." + str(1000 + n % 1000)[1:] + result
            n //= 1000
        result = str(n) + result
        return result


s = "aa"
print(s[-3:])
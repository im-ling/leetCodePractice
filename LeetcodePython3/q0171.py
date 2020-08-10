class Solution:
    def titleToNumber(self, s: str) -> int:
        result = 0
        base = ord("A") - 1
        for char in s:
            result = result * 26 + ord(char) - base
        return result


# ord(char) = n % 26 + base
class Solution:
    def makeGood(self, s: str) -> str:
        diff = abs(ord("A") - ord("a"))
        flag = True
        while flag:
            flag = False
            index = 0
            while index < len(s) - 1:
                if abs(ord(s[index]) - ord(s[index + 1])) == diff:
                    s = s[:index] + s[index + 2: len(s)]
                    flag = True
                index += 1
        return s


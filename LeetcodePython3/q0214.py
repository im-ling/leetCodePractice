class Solution:
    def shortestPalindrome(self, s: str) -> str:
        length = len(s)
        best = 0
        for i in range(1, length + 1):
            # print(s[:i], s[:i][::-1])
            if s[:i] == s[:i][::-1]:
                best = i
        if best == 0:
            return s[::-1][:-1] + s
        else:
            return s[best:][::-1] + s
s = "aacecaaa"
result = Solution().shortestPalindrome(s)
print(result)
s = "123"
print(s[::-1][:-1])
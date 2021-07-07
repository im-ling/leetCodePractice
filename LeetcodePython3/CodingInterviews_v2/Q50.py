class Solution:
    def firstUniqChar(self, s: str) -> str:
        map = {}
        for char in s:
            if char not in map:
                map[char] = True
            else:
                map[char] = False
        for char in reversed(s):
            if map[char]:
                return char
        return ""
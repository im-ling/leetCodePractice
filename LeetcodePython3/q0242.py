class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        if len(s) != len(t):
            return False
        tmp = "abcdefghijklmnopqrstuvwxyz"
        map_s = {}
        map_t = {}
        for char in tmp:
            map_s[char] = 0
            map_t[char] = 0
        for char in s:
            map_s[char] += 1
        for char in t:
            map_t[char] += 1
        for char in tmp:
            if map_s[char] != map_t[char]:
                return False
        return True

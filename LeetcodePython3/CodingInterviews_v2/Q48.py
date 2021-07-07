class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        result = -1
        start = 0
        map = {}
        for i in range(len(s)):
            char = s[i]
            if char not in map:
                map[char] = 1
            else:
                map[char] += 1
            if map[char] > 1:
                while map[char] > 1:
                    new_char = s[start]
                    map[new_char] -= 1
                    start += 1
            if i - start > result:
                result = i - start
        return result + 1
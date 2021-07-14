class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        _set = set()
        length = len(s)
        count = 0
        result = 0
        start = 0
        for i in range(length):
            char = s[i]
            if char not in _set:
                _set.add(char)
                count += 1
            else:
                while s[start] != char:
                    _set.remove(s[start])
                    start += 1
                    count -= 1
                start += 1
                print(start)
            if count > result:
                result = count
        return result

str = "tmmzuxt"
result = Solution().lengthOfLongestSubstring(str)
print(result)
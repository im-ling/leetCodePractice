#!/usr/bin/python3
from typing import List

class Solution:
    def wordPattern(self, pattern: str, str: str) -> bool:
        dic = {}
        dic2 = {}
        words = str.split(" ")
        if len(pattern) != len(words):
            return False
        for i in range(len(pattern)):
            char = pattern[i]
            word = words[i]
            if char not in dic:
                dic[char] = word
            elif dic[char] != word:
                return False
            if word not in dic2:
                dic2[word] = char
            elif dic2[word] != char:
                return False
        return True


pattern = "abba"
string = "dog cat cat fish"
result = Solution().wordPattern(pattern, string)
print(result)
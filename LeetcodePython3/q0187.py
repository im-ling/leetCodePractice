#!/usr/bin/python3
from typing import List


class Solution:
    def findRepeatedDnaSequences3(self, s: str) -> List[str]:
        map = {}
        result = list()
        for i in range(len(s) - 9):
            dna = s[i: i+10]
            if map[dna] not in map:
                map[dna] = 1
            else:
                map[dna] += 1
                if map[dna] == 2:
                    result.append(dna)
        return result


    def findRepeatedDnaSequences(self, s: str) -> List[str]:
        result = list()
        if len(s) < 11:
            return result

        chars_map = {"A":0, "C":1, "G":2, "T":3}
        record_map = {}
        factor = 1 << 20
        theNumber = 0

        for i in range(10):
            theNumber = ((theNumber << 2) + chars_map[s[i]]) % factor
        record_map[theNumber] = 1

        for i in range(10, len(s)):
            theNumber = ((theNumber << 2) + chars_map[s[i]]) % factor
            if theNumber in record_map:
                record_map[theNumber] += 1
                if record_map[theNumber] == 2:
                    result.append(s[i - 9: i + 1])
            else:
                record_map[theNumber] = 1
        return result

    def findRepeatedDnaSequences2(self, s: str) -> List[str]:
        tie = {}
        result = list()
        for i in range(len(s) - 9):
            # print(i)
            level = 0
            p = tie
            while level < 9:
                char =  s[i + level]
                if char not in p:
                    p[char] = {}
                p = p[char]
                level += 1
            char = s[i + level]
            if char not in p:
                p[char] = 1
            else:
                p[char] += 1
            if p[char] == 2:
                result.append(s[i:i + 10])
        return result

# s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
# result = Solution().findRepeatedDnaSequences(s)
# print(result)


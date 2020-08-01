#!/usr/bin/python3
from typing import List

class Solution:
    def detectCapitalUse(self, word: str) -> bool:
        length = len(word)
        if length <= 1:
            return True
        isAllCapital = True
        isAllNotCapital = True
        for i in range(1, length):
            char = word[i]
            if "A" <= char <= "Z":
                isAllNotCapital = False
            else:
                isAllCapital = False
            if not isAllCapital and not isAllNotCapital:
                return False
        if "A" <= word[0] <= "Z" and (isAllCapital or isAllNotCapital):
            return True
        elif "a" <= word[0] <= "z" and isAllNotCapital:
            return True
        else:
            return False



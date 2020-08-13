#!/usr/bin/python3
from typing import List


class CombinationIterator:
    indexs = list()
    max_indexs = list()
    chars_len = 0
    combination_length = 0
    characters = ""

    def __init__(self, characters: str, combinationLength: int):
        self.indexs = list()
        self.max_indexs = list()
        self.chars_len = len(characters)
        self.combination_length = combinationLength
        self.characters = characters
        for i in range(combinationLength):
            self.indexs.append(i)
            self.max_indexs.append(self.chars_len - combinationLength + i)

    def next(self) -> str:
        if not self.hasNext():
            return ""

        result = ""
        for i in self.indexs:
            result += self.characters[i]

        i = self.combination_length - 1
        while i >= 0 and self.indexs[i] + 1 > self.max_indexs[i]:
            i -= 1
        if i < 0:
            self.indexs[0] += 1
        else:
            self.indexs[i] += 1
            i += 1
            while i < self.combination_length:
                self.indexs[i] = self.indexs[i - 1] + 1
                i += 1
        return result


    def hasNext(self) -> bool:
        return self.indexs[0] <= self.chars_len - self.combination_length


# Your CombinationIterator object will be instantiated and called as such:
characters = "abc"
combinationLength = 2
obj = CombinationIterator(characters, combinationLength)
print(obj.next())
print(obj.hasNext())

print(obj.next())
print(obj.hasNext())

print(obj.next())
print(obj.hasNext())

#!/usr/bin/python3
from typing import List


class MyHashSet:
    prime = 19993
    hashList = list()

    def __init__(self):
        """
        Initialize your data structure here.
        """
        self.hashList = [-1 for _ in range(self.prime)]

    def add(self, key: int) -> None:
        left = key % self.prime
        while self.hashList[left] != -1 and self.hashList[left] != key:
            left = (1 + left) % self.prime
        if self.hashList[left] == key:
            return
        else:
            self.hashList[left] = key

    def remove(self, key: int) -> None:
        startIndex = key % self.prime
        left = startIndex
        while self.hashList[left] != -1 and self.hashList[left] != key:
            left = (1 + left) % self.prime
        if self.hashList[left] == -1:
            return
        else:
            self.hashList[left] = -1
            right = (left + 1) % self.prime
            while self.hashList[right] != -1:
                value = self.hashList[right]
                self.hashList[right] = -1
                self.add(value)
                right += 1

    def contains(self, key: int) -> bool:
        """
        Returns true if this set contains the specified element
        """
        left = key % self.prime
        while self.hashList[left] != -1 and self.hashList[left] != key:
            left = (1 + left) % self.prime
        if self.hashList[left] == key:
            return True
        else:
            return False

# Your MyHashSet object will be instantiated and called as such:
obj = MyHashSet()
obj.add(1)
obj.add(2)
print(obj.contains(1))
print(obj.contains(3))
obj.add(2)



# param_3 = obj.contains(key)
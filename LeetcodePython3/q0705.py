#!/usr/bin/python3
from typing import List


class MyHashSet:
    prime = 19993
    hashList = list()

    def __init__(self):
        self.hashList = [-1 for _ in range(self.prime)]

    def add(self, key: int) -> None:
        index = key % self.prime
        while self.hashList[index] != -1 and self.hashList[index] != key:
            index = (1 + index) % self.prime
        if self.hashList[index] == key:
            return
        else:
            self.hashList[index] = key

    def contains(self, key: int) -> bool:
        index = key % self.prime
        while self.hashList[index] != -1 and self.hashList[index] != key:
            index = (1 + index) % self.prime
        if self.hashList[index] == key:
            return True
        else:
            return False

    def remove(self, key: int) -> None:
        index = key % self.prime
        while self.hashList[index] != -1 and self.hashList[index] != key:
            index = (1 + index) % self.prime
        if self.hashList[index] == -1:
            # 没找到退出
            return
        else:
            # 找到了删除
            self.hashList[index] = -1
            index = (index + 1) % self.prime
            while self.hashList[index] != -1:
                origin = self.hashList[index]
                self.hashList[index] = -1
                self.add(origin)
                index += 1


# Your MyHashSet object will be instantiated and called as such:
obj = MyHashSet()
obj.add(0)
obj.add(1)
print(obj.contains(1))
print(obj.contains(3))
obj.add(19993)

# param_3 = obj.contains(key)

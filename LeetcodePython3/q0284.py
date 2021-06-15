#!/usr/bin/python3
from typing import List


class Iterator:
    nums = None
    length = 0
    index = 0

    def __init__(self, nums):
        """
        Initializes an iterator object to the beginning of a list.
        :type nums: List[int]
        """
        self.nums = nums
        self.length = len(nums)
        self.index = 0

    def hasNext(self):
        """
        Returns true if the iteration has more elements.
        :rtype: bool
        """
        return self.index < self.length

    def next(self):
        """
        Returns the next element in the iteration.
        :rtype: int
        """
        self.index += 1
        # print(self.index)
        return self.nums[self.index - 1]


class PeekingIterator:
    iterator = None
    _next = None

    def __init__(self, iterator):
        """
        Initialize your data structure here.
        :type iterator: Iterator
        """
        self.iterator = iterator
        if iterator.hasNext():
            self._next = iterator.next()

    def peek(self):
        """
        Returns the next element in the iteration without advancing the iterator.
        :rtype: int
        """
        return self._next

    def next(self):
        """
        :rtype: int
        """
        result = self._next
        if self.iterator.hasNext():
            self._next = self.iterator.next()
        else:
            self._next = None
        return result

    def hasNext(self):
        """
        :rtype: bool
        """
        return self._next != None


nums = [1, 2, 3]
iterator = Iterator(nums)
solu = PeekingIterator(iterator)
print(solu.next())
print(solu.peek())
print(solu.next())
print(solu.next())
print(solu.hasNext())

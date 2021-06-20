#!/usr/bin/python3
from typing import List


class CQueue:
    push = []
    pop = []

    def __init__(self):
        self.push = []
        self.pop = []

    def appendTail(self, value: int) -> None:
        self.push.append(value)

    def deleteHead(self) -> int:
        if len(self.pop) > 0:
            return self.pop.pop()
        elif len(self.push) > 0:
            for _ in range(len(self.push)):
                self.pop.append(self.push.pop())
            return self.pop.pop()
        else:
            return -1

# Your CQueue object will be instantiated and called as such:
# obj = CQueue()
# obj.appendTail(value)
# param_2 = obj.deleteHead()

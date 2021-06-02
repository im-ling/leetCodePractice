#!/usr/bin/python3
from typing import List


# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class BSTIterator:
    visit: TreeNode
    stack: List[TreeNode]

    def __init__(self, root: TreeNode):
        if root:
            self.stack = list()
            p = root
            while p:
                self.stack.append(p)
                p = p.left

    def next(self) -> int:
        if len(self.stack) > 0:
            result = self.stack.pop()
            p = result.right
            while p:
                self.stack.append(p)
                p = p.left
            return result.val
        return -1

    def hasNext(self) -> bool:
        return len(self.stack) > 0

# Your BSTIterator object will be instantiated and called as such:
root = TreeNode(1)
root.left = TreeNode(3)
obj = BSTIterator(root)
param_1 = obj.next()
print(param_1)
# param_2 = obj.hasNext()

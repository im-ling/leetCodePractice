#!/usr/bin/python3
from typing import List


class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def preorderTraversal(self, root: TreeNode) -> List[int]:
        result = list()
        stack = [root]
        while len(stack) != 0:
            p = stack.pop()
            if p:
                result.append(p.val)
                stack.append(p.right)
                stack.append(p.left)
        return result

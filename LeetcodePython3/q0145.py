#!/usr/bin/python3
from typing import List


class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def postorderTraversal(self, root: TreeNode) -> List[int]:
        result = list()
        stack = [root]
        while len(stack) != 0:
            p = stack.pop()
            if p:
                result.append(p.val)
                stack.append(p.left)
                stack.append(p.right)
        return reversed(result)

    def postorderTraversal2(self, root: TreeNode) -> List[int]:
        result = list()
        if not root:
            return result

        stack = [root]
        pre = root
        while len(stack) != 0:
            p = stack[-1]
            if (p.left == None and p.right == None) or p.left == pre or p.right == pre:
                pre = p
                stack.pop()
                result.append(p.val)
            else:
                if p.right:
                    stack.append(p.right)
                if p.left:
                    stack.append(p.left)
        return result
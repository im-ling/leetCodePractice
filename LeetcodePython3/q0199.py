#!/usr/bin/python3
from typing import List


class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def rightSideView(self, root: TreeNode) -> List[int]:
        result = list()

        def helper(node: TreeNode, height: int):
            if not node:
                return
            if height == len(result):
                result.append(node.val)
            if node.right:
                helper(node.right, height + 1)
            if node.left:
                helper(node.left, height + 1)

        helper(root, 0)
        return result

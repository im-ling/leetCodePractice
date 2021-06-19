#!/usr/bin/python3
from typing import List


# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def pathSum(self, root: TreeNode, target: int) -> List[List[int]]:
        result = list()
        path = list()

        def helper(node, sum):
            if node:
                sum += node.val
                path.append(node.val)
                if node.left is None and node.right is None:
                    if sum == target:
                        result.append(path.copy())
                else:
                    if node.left:
                        helper(node.left, sum)
                    if node.right:
                        helper(node.right, sum)
                path.pop()
        if root:
            helper(root, 0)
        return result

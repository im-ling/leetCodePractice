#!/usr/bin/python3
from typing import List


# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def widthOfBinaryTree_helper(self, root: TreeNode, length: int, position: int, positions: List[List[int]]):
        if root:
            if length > len(positions):
                positions.append([])
            positions[length - 1].append(position)
            self.widthOfBinaryTree_helper(root.left, length + 1, position * 2, positions)
            self.widthOfBinaryTree_helper(root.right, length + 1, position * 2 + 1, positions)

    def widthOfBinaryTree(self, root: TreeNode) -> int:
        result = 0
        levels: List[List[int]] = []
        self.widthOfBinaryTree_helper(root, 1, 0, levels)
        for level in levels:
            if result < level[-1] - level[0]:
                result = level[-1] - level[0]
        return result + 1

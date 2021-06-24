#!/usr/bin/python3
from typing import List


class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution:
    def buildTree(self, preorder: List[int], inorder: List[int]) -> TreeNode:
        length = len(preorder)
        if length == 0:
            return None

        def helper(left1, right1, left2, right2) -> TreeNode:
            if left1 > right1:
                return None
            node = TreeNode(preorder[left1])
            if left1 == right1:
                return node
            i = left2
            while i <= right2:
                if preorder[left1] == inorder[i]:
                    break
                i += 1
            if i > left2:
                node.left = helper(left1 + 1, left1 + i - left2, left2, i - 1)
            if i < right2:
                node.right = helper(right1 - right2 + i + 1, right1, i + 1, right2)
            return node

        return helper(0, length - 1, 0, length - 1)

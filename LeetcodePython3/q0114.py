#!/usr/bin/python3
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    lastNode = None

    def flatten(self, root: TreeNode) -> None:
        self.lastNode = None
        self.flatten_helper(root)

    def flatten_helper(self, root: TreeNode) -> None:
        if not root:
            return
        # 右左中
        self.flatten_helper(root.right)
        self.flatten_helper(root.left)
        root.left = None
        root.right = self.lastNode
        self.lastNode = root

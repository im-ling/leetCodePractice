#!/usr/bin/python3
from typing import List


class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def binaryTreePaths(self, root: TreeNode) -> List[str]:
        result = []
        path = []

        def dfs_vist(node: TreeNode):
            if node:
                path.append(node.val)
                if not node.left and not node.right:
                    result.append(path.copy())
                else:
                    if node.left:
                        dfs_vist(node.left)
                    if node.right:
                        dfs_vist(node.right)
                path.pop()

        dfs_vist(root)
        result_str = []
        for nums in result:
            ans = ""
            for num in nums:
                ans += "->" + str(num)
            result_str.append(ans[2:])
        return result_str

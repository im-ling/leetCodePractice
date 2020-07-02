#!/usr/bin/python3
from typing import List


# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def levelOrderBottom_helper(self, root: TreeNode, length: int, result: List[List[int]]):
        if root:
            if length > len(result):
                result.append(list())
            result[length - 1].append(root.val)
            self.levelOrderBottom_helper(root.left, length + 1, result)
            self.levelOrderBottom_helper(root.right, length + 1, result)

    def levelOrderBottom(self, root: TreeNode) -> List[List[int]]:
        result: List[List[int]] = list()
        self.levelOrderBottom_helper(root, 1, result)
        result.reverse()
        return result


node15 = TreeNode(15)
node7 = TreeNode(7)
node20 = TreeNode(20,node15, node7)
node9 = TreeNode(9)
node3 = TreeNode(3, node9, node20)

solu = Solution()
result = solu.levelOrderBottom(node3)
print(result)
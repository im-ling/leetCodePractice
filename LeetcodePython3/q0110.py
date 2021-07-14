# Definition for a binary tree node.
from collections import deque


class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def isBalanced(self, root: TreeNode) -> bool:
        map = {}

        def depth(node):
            if not node:
                return 0
            if node in map:
                return map[node]
            left = depth(node.left)
            right = depth(node.right)
            map[node] = max(left, right) + 1
            return map[node]

        bfs_queue = deque([])
        if root:
            bfs_queue.append(root)
        while bfs_queue:
            node = bfs_queue.popleft()
            if abs(depth(node.left) - depth(node.right)) > 1:
                return False
            if node.left:
                bfs_queue.append(node.left)
            if node.right:
                bfs_queue.append(node.right)
        return True

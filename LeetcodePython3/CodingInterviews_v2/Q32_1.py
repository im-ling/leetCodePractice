from collections import deque
from typing import List


class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution:
    def levelOrder(self, root: TreeNode) -> List[int]:
        result = []
        if not root:
            return result
        bfs_queue = deque([root])
        while bfs_queue:
            node = bfs_queue.popleft()
            result.append(node.val)
            if node.left:
                bfs_queue.append(node.left)
            if node.right:
                bfs_queue.append(node.right)
        return result

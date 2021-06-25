from collections import deque
from typing import List


class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution:
    def levelOrder(self, root: TreeNode) -> List[List[int]]:
        result = []
        if not root:
            return result
        bfs_queue = deque([root])
        bfs_queue2 = deque([])
        list = []
        reversed_flag = False
        while bfs_queue or bfs_queue2:
            if bfs_queue:
                node = bfs_queue.popleft()
                list.append(node.val)
                if node.left:
                    bfs_queue2.append(node.left)
                if node.right:
                    bfs_queue2.append(node.right)
            else:
                if reversed_flag:
                    list.reverse()
                reversed_flag = not reversed_flag
                result.append(list)
                list = []
                bfs_queue = bfs_queue2
                bfs_queue2 = deque([])
        if list:
            if reversed_flag:
                list.reverse()
            result.append(list)
        return result
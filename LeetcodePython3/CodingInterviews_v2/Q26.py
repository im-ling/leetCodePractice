#!/usr/bin/python3
from collections import deque
from typing import List


class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution:
    is_sub = True

    def isSubStructure(self, A: TreeNode, B: TreeNode) -> bool:
        if not B:
            return False

        def helper(node1, node2):
            if not self.is_sub:
                return
            if node1.val != node2.val:
                self.is_sub = False
                return
            if node2.left:
                if node1.left:
                    helper(node1.left, node2.left)
                else:
                    self.is_sub = False
                    return
            if node2.right:
                if node1.right:
                    helper(node1.right, node2.right)
                else:
                    self.is_sub = False
                    return

        bfs_queue1 = deque([])
        if A:
            bfs_queue1.append(A)
        while bfs_queue1:
            node = bfs_queue1.popleft()
            if node.val == B.val:
                self.is_sub = True
                helper(node, B)
                if self.is_sub:
                    return True
            if node.left:
                bfs_queue1.append(node.left)
            if node.right:
                bfs_queue1.append(node.right)
        return False

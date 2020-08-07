#!/usr/bin/python3
from collections import deque
from typing import List


# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

class Solution:
    dic = {}
    def verticalTraversal_helper(self, root: TreeNode, xIndex:int, yIndex:int):
        if not root:
            return
        if xIndex not in self.dic:
            self.dic[xIndex] = {}
        if yIndex not in self.dic[xIndex]:
            self.dic[xIndex][yIndex] = list()
        self.dic[xIndex][yIndex].append(root.val)
        self.verticalTraversal_helper(root.left, xIndex - 1, yIndex + 1)
        self.verticalTraversal_helper(root.right, xIndex + 1, yIndex + 1)

    def verticalTraversal(self, root: TreeNode) -> List[List[int]]:
        self.dic = {}
        self.verticalTraversal_helper(root, 0, 0)
        keys = sorted(self.dic.keys())
        result = list()
        for key in keys:
            temp = list()
            for y in sorted(self.dic[key].keys()):
                for number in sorted(self.dic[key][y]):
                    temp.append(number)
            result.append(temp)
        return result


    # 垃圾题目，限制
    # If two nodes have the same position, then the value of the node that is reported first is the value that is smaller.
    # 用不了bfs
    def verticalTraversal_bfs(self, root: TreeNode) -> List[List[int]]:
        self.dic = {}

        bfsNode = deque([root])
        bfsXIndex = deque([0])
        while bfsNode:
            node = bfsNode.popleft()
            xIndex = bfsXIndex.popleft()
            if node:
                if xIndex not in self.dic:
                    self.dic[xIndex] = list()
                self.dic[xIndex].append(node.val)
                bfsNode.append(node.left)
                bfsXIndex.append(xIndex - 1)
                bfsNode.append(node.right)
                bfsXIndex.append(xIndex + 1)

        keys = sorted(self.dic.keys())
        result = list()
        for key in keys:
            result.append(self.dic[key].copy())
        return result




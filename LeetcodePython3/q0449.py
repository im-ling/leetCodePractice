#!/usr/bin/python3
from typing import List
from collections import deque

class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Codec:

    def serialize(self, root: TreeNode) -> str:
        """Encodes a tree to a single string.
        """
        if not root:
            return ""
        the_list = list()
        bfs_queue = deque([root])
        while bfs_queue:
            node = bfs_queue.popleft()
            newList = ["-1", "-1", "-1"]
            newList[0] = str(node.val)
            if node.left:
                bfs_queue.append(node.left)
                newList[1] = str(node.left.val)
            if node.right:
                bfs_queue.append(node.right)
                newList[2] = str(node.right.val)
            the_list.append(",".join(newList))
        result = "z".join(the_list)
        return result


    def deserialize(self, data: str) -> TreeNode:
        """Decodes your encoded data to tree.
        """
        if len(data) <= 0:
            return None
        nodes_strings = data.split("z")
        nodes_valus = list()
        for string in nodes_strings:
            values = string.split(",")
            temp_list = list()
            for value in values:
                temp_list.append(int(value))
            nodes_valus.append(temp_list)
        nodeDic = {}
        for node_value in nodes_valus:
            nodeDic[node_value[0]] = TreeNode(node_value[0])
        for node_value in nodes_valus:
            node = nodeDic[node_value[0]]
            if node_value[1] >= 0:
                node.left = nodeDic[node_value[1]]
            if node_value[2] >= 0:
                node.right = nodeDic[node_value[2]]
        return nodeDic[nodes_valus[0][0]]

from collections import deque


class Node:
    def __init__(self, val = 0, neighbors = None):
        self.val = val
        self.neighbors = neighbors if neighbors is not None else []

class Solution:
    nodeDic = {}

    def dfs_copy(self, node:'Node') -> 'Node':
        if node is None:
            return None
        if node not in self.nodeDic:
            newNode = Node(node.val)
            self.nodeDic[node] = newNode
            if len(node.neighbors) > 0:
                for neighbor in node.neighbors:
                    newNode.neighbors.append(self.dfs_copy(neighbor))
            return newNode
        else:
            return self.nodeDic[node]

    def cloneGraph(self, node: 'Node') -> 'Node':
        if Node is None:
            return None
        else:
            self.nodeDic = {}
            result = self.dfs_copy(node)
            return result



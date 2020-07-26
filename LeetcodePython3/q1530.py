from typing import Dict
import sys

class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    result = 0

    def countPairs(self, root: TreeNode, distance: int) -> int:
        self.result = 0
        self.dfs(root, distance)
        return self.result

    def dfs(self, root: TreeNode, distance: int) -> Dict[TreeNode, int]:
        curDict: Dict[TreeNode, int] = {}
        if root is None:
            return curDict
        if root.left is None and root.right is None:
            return {root: 1}
        leftDic = self.dfs(root.left, distance)
        rightDic = self.dfs(root.right, distance)
        for nodeLeft in leftDic.keys():
            for nodeRight in rightDic.keys():
                if leftDic[nodeLeft] + rightDic[nodeRight] <= distance:
                    self.result += 1
        for nodeLeft in leftDic.keys():
            curDict[nodeLeft] = leftDic[nodeLeft] + 1
        for nodeRight in rightDic.keys():
            curDict[nodeRight] = rightDic[nodeRight] + 1
        return curDict

# class Solution:
#     nodeDic = {}
#     fatherDic = {}
#     count = 0
#     distance = 0
#
#     def countDis(self, node1: TreeNode, node2: TreeNode) -> int:
#         dis = 0
#         level1 = self.nodeDic[node1]
#         level2 = self.nodeDic[node2]
#         while level1 > level2:
#             level1 -= 1
#             node1 = self.fatherDic[node1]
#             dis += 1
#         while level1 < level2:
#             level2 -= 1
#             node2 = self.fatherDic[node2]
#             dis += 1
#         while node1 != node2:
#             node1 = self.fatherDic[node1]
#             node2 = self.fatherDic[node2]
#             dis += 2
#         return dis
#
#     def visit(self, node: TreeNode, level: int, father: TreeNode):
#         self.fatherDic[node] = father
#         if node.left is None and node.right is None:
#             keys = self.nodeDic.keys()
#             self.nodeDic[node] = level
#             for key in keys:
#                 dis = self.countDis(node, key)
#                 if dis > 0 and dis <= self.distance:
#                     self.count += 1
#         else:
#             if node.left:
#                 self.visit(node.left, level + 1, node)
#             if node.right:
#                 self.visit(node.right, level + 1, node)
#
#     def countPairs(self, root: TreeNode, distance: int) -> int:
#         self.nodeDic = {}
#         self.fatherDic = {}
#         self.count = 0
#         self.distance = distance
#         father = TreeNode(1)
#         if root:
#             self.visit(root, 0, father)
#         return self.count



print(sys.version)
# node = TreeNode(100)
# solu = Solution()
# result = solu.countPairs(node,10)
# print(result)
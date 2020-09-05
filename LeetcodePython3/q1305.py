#!/usr/bin/python3
from typing import List

# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

class Solution:
    def getAllElements(self, root1: TreeNode, root2: TreeNode) -> List[int]:
        list1 = list()
        list2 = list()

        def travelWithTreeNode(root: TreeNode, local_list: List[int]):
            if root:
                travelWithTreeNode(root.left, local_list)
                local_list.append(root.val)
                travelWithTreeNode(root.right, local_list)

        travelWithTreeNode(root1, list1)
        travelWithTreeNode(root2, list2)

        result = list()
        i = 0
        j = 0
        len1 = len(list1)
        len2 = len(list2)
        while i < len1 and j < len2:
            if list1[i] <= list2[j]:
                result.append(list1[i])
                i += 1
            else:
                result.append(list2[j])
                j += 1

        if i == len1:
            while j < len2:
                result.append(list2[j])
                j += 1
        else:
            while i < len1:
                result.append(list1[i])
                i += 1
        return result


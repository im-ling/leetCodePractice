#!/usr/bin/python3
from typing import List

class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

class Solution:
    def buildTree_helper(self, inorder: List[int], postorder: List[int], inorderStartIndex:int, inorderEndIndex:int, postorderStartIndex:int, postorderEndIndex:int) -> TreeNode:
        if inorderStartIndex > inorderEndIndex or postorderStartIndex > postorderEndIndex:
            return None
        node = TreeNode(postorder[postorderEndIndex])
        # print(inorderStartIndex, inorderEndIndex , postorderStartIndex, postorderEndIndex, node.val)
        if postorderEndIndex == postorderStartIndex:
            return node
        t_inorderStartIndex = inorderStartIndex
        while inorder[t_inorderStartIndex] != postorder[postorderEndIndex]:
            t_inorderStartIndex += 1
        if t_inorderStartIndex == inorderEndIndex:
            node.left = self.buildTree_helper(inorder, postorder, inorderStartIndex, inorderEndIndex - 1, postorderStartIndex, postorderEndIndex - 1)
            return node
        if t_inorderStartIndex == inorderStartIndex:
            node.right = self.buildTree_helper(inorder, postorder, inorderStartIndex + 1, inorderEndIndex, postorderStartIndex, postorderEndIndex - 1)
            return node
        length = t_inorderStartIndex - inorderStartIndex
        node.left = self.buildTree_helper(inorder, postorder, inorderStartIndex, t_inorderStartIndex - 1, postorderStartIndex, postorderStartIndex + length - 1)
        node.right = self.buildTree_helper(inorder, postorder, t_inorderStartIndex + 1, inorderEndIndex, postorderStartIndex + length, postorderEndIndex - 1)
        return node

    def buildTree(self, inorder: List[int], postorder: List[int]) -> TreeNode:
        length = len(inorder)
        node = self.buildTree_helper(inorder, postorder, 0, length - 1 , 0 , length - 1)
        return node


inorder = [9,3,15,20,7]
postOrder = [9,15,7,20,3]
result = Solution().buildTree(inorder, postOrder)
print(result.val)
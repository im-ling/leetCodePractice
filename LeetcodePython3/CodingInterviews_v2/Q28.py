# Definition for a binary tree node.
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution:
    def isSymmetric(self, root: TreeNode) -> bool:
        def isSymmetric_helper(node1, node2) -> bool:
            if node1 is None and node2 is None:
                return True
            elif node1 is None or node2 is None or node1.val != node2.val:
                return False
            return isSymmetric_helper(node1.left, node2.right) and isSymmetric_helper(node1.right, node2.left)

        return isSymmetric_helper(root, root)

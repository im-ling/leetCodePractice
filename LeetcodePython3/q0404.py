class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right
class Solution:
    sum = 0
    def sumOfLeftLeaves_helper(self, root: TreeNode, leftFlag:bool) -> int:
        if root:
            if root.left or root.right:
                self.sumOfLeftLeaves_helper(root.left, True)
                self.sumOfLeftLeaves_helper(root.right, False)
            elif leftFlag:
                self.sum += root.val

    def sumOfLeftLeaves(self, root: TreeNode) -> int:
        self.sum = 0
        self.sumOfLeftLeaves_helper(root, False)
        return self.sum


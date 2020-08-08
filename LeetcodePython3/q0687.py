class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right
class Solution:
    result = 0
    def longestUnivaluePath_helper2(self, root: TreeNode, lastNumber:int) -> int:
        if not root or root.val != lastNumber:
            return 0
        left = self.longestUnivaluePath_helper2(root.left, lastNumber)
        right = self.longestUnivaluePath_helper2(root.right, lastNumber)
        return max(left,right) + 1

    def longestUnivaluePath_helper1(self, root: TreeNode):
        if not root:
            return
        left = self.longestUnivaluePath_helper2(root.left, root.val)
        right = self.longestUnivaluePath_helper2(root.right, root.val)
        if left + right > self.result:
            self.result = left + right
        self.longestUnivaluePath_helper1(root.left)
        self.longestUnivaluePath_helper1(root.right)


    def longestUnivaluePath(self, root: TreeNode) -> int:
        self.result = 0
        self.longestUnivaluePath_helper1(root)
        return self.result

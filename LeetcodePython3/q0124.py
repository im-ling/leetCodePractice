class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    max_val = 0

    def maxPathSum(self, root: TreeNode) -> int:
        def helper(node: TreeNode):
            left = -1001
            right = -1001
            if node.left:
                left = helper(node.left)
            if node.right:
                right = helper(node.right)
            cur = node.val
            self.max_val = max(self.max_val, cur, left + cur, left + cur + right, cur + right)
            return max(cur, left + cur, cur + right)

        self.max_val = -1001
        helper(root)
        return self.max_val

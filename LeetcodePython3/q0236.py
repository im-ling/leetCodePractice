class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution:
    def lowestCommonAncestor(self, root: 'TreeNode', p: 'TreeNode', q: 'TreeNode') -> 'TreeNode':
        path_p = [None]
        path_q = [None]

        def dfs_visit(path, target, node):
            if path[-1] == target:
                return
            if node:
                path.append(node)
                if node == target:
                    return
                if node.left:
                    dfs_visit(path, target, node.left)
                if node.right:
                    dfs_visit(path, target, node.right)
                if path[-1] != target:
                    path.pop()

        dfs_visit(path_p, p, root)
        dfs_visit(path_q, q, root)
        # print(path_p)
        # print(path_q)

        length = min(len(path_q), len(path_p))
        result = None
        for i in range(length):
            if path_p[i] == path_q[i]:
                result = path_q[i]
            else:
                break
        return result

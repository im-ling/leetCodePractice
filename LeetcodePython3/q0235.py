class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution:
    def lowestCommonAncestor(self, root: 'TreeNode', p: 'TreeNode', q: 'TreeNode') -> 'TreeNode':
        left = [None]
        right = [None]

        tmp = root
        while tmp != p:
            left.append(tmp)
            if tmp.val < p.val:
                tmp = tmp.right
            else:
                tmp = tmp.left
        left.append(tmp)

        tmp = root
        while tmp != q:
            right.append(tmp)
            if tmp.val < q.val:
                tmp = tmp.right
            else:
                tmp = tmp.left
        right.append(tmp)

        result = None
        length = min(len(left), len(right))
        for i in range(length):
            if left[i] == right[i]:
                result = left[i]
            else:
                break
        return result

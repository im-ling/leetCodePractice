from typing import Dict


class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

class Solution:
    result = 0
    def pathSum_helper(self, root: TreeNode, sumDic: Dict, sum:int):
        if not root:
            return
        if root.val in sumDic:
            self.result += sumDic[root.val]
        if sum == root.val:
            self.result += 1

        newDic = {}
        for key in sumDic.keys():
            newDic[key - root.val] = sumDic[key]
        if (sum - root.val) not in newDic:
            newDic[sum - root.val] = 1
        else:
            newDic[sum - root.val] += 1

        self.pathSum_helper(root.left, newDic, sum)
        self.pathSum_helper(root.right, newDic, sum)

    def pathSum(self, root: TreeNode, sum: int) -> int:
        self.result = 0
        sumDic = {}
        self.pathSum_helper(root, sumDic, sum)
        return self.result




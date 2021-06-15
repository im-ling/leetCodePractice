from collections import deque

# Definition for a binary tree node.
class TreeNode(object):
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Codec:

    def serialize(self, root):
        """Encodes a tree to a single string.

        :type root: TreeNode
        :rtype: str
        """
        if not root:
            return ""
        result = ""
        bfs_queue = deque([root])
        while bfs_queue:
            p = bfs_queue.popleft()
            if p:
                result += str(p.val) + ","
                bfs_queue.append(p.left)
                bfs_queue.append(p.right)
            else:
                result += "None" + ","
        print(result[:-1])
        return result[:-1]

    def deserialize(self, data):
        """Decodes your encoded data to tree.

        :type data: str
        :rtype: TreeNode
        """
        if "," not in data:
            return None
        nums = data.split(",")
        length = len(nums)
        root = TreeNode(int(nums[0]))
        bfs_queue = deque([root])
        index = 1
        while bfs_queue:
            p = bfs_queue.popleft()

            if nums[index] != "None":
                p.left = TreeNode(int(nums[index]))
                bfs_queue.append(p.left)
            index += 1

            if nums[index] != "None":
                p.right = TreeNode(int(nums[index]))
                bfs_queue.append(p.right)
            index += 1
        return root

# Your Codec object will be instantiated and called as such:
# ser = Codec()
# deser = Codec()
# ans = deser.deserialize(ser.serialize(root))

node2 = TreeNode(2)
node3 = TreeNode(3)
node4 = TreeNode(4)
node5 = TreeNode(5)
root = TreeNode(1)
root.left = node2
root.right = node3
node3.left = node4
node3.right = node5
result = Codec().serialize(root)
result = Codec().deserialize(result)
print(result)
print(result.val)

print("," in "asdfa asdf")

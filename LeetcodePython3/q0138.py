class Node:
    def __init__(self, x: int, next: 'Node' = None, random: 'Node' = None):
        self.val = int(x)
        self.next = next
        self.random = random


class Solution:
    dic = {}

    def copyRandomList(self, head: 'Node') -> 'Node':
        self.dic = {}
        return self.deepCopyNode(head)

    def deepCopyNode(self, node: 'Node') -> 'Node':
        if node is None:
            return None
        if node not in self.dic:
            newNode = Node(node.val)
            self.dic[node] = newNode
            newNode.next = self.deepCopyNode(node.next)
            newNode.random = self.deepCopyNode(node.random)
            return newNode
        else:
            return self.dic[node]

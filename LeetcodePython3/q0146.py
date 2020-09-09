class DoubleListNode:
    def __init__(self, key=0, val=0, next=None, pre=None):
        self.key: int = key
        self.val: int = val
        self.next = next
        self.pre = pre


class LRUCache:
    capacity = 0
    cache = {}
    head = None
    tail = None
    size = 0

    def __init__(self, capacity: int):
        self.capacity = capacity
        self.cache = {}
        self.head = DoubleListNode(0)
        self.tail = DoubleListNode(0)
        self.head.next = self.tail
        self.tail.pre = self.head
        self.size = 0

    def get(self, key: int) -> int:
        if key not in self.cache:
            return -1
        else:
            node = self.cache[key]
            self.moveTohead(node)
            return node.val

    def put(self, key: int, value: int) -> None:
        if key in self.cache:
            node = self.cache[key]
            node.val = value
            self.moveTohead(node)
        else:
            node = DoubleListNode(key, value)
            self.cache[key] = node
            self.addToHead(node)
            self.size += 1
            if self.size > self.capacity:
                remove_key = self.removeTail().key
                self.cache.pop(remove_key)
                self.size -= 1

    def deleteNode(self, node: DoubleListNode):
        node.pre.next = node.next
        node.next.pre = node.pre

    def addToHead(self, node: DoubleListNode):
        node.pre = self.head
        node.next = self.head.next
        self.head.next.pre = node
        self.head.next = node

    def removeTail(self) -> DoubleListNode:
        node = self.tail.pre
        self.deleteNode(node)
        return node

    def moveTohead(self, node: DoubleListNode):
        self.deleteNode(node)
        self.addToHead(node)

    # Your LRUCache object will be instantiated and called as such:
capacity = 2
obj = LRUCache(capacity)
obj.put(1,1)
obj.put(2,2)
result = obj.get(1)
print(result)

# param_1 = obj.get(key)
# obj.put(key,value)

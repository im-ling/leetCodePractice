class MyQueue:

    push_stack = []
    pop_stack = []
    count = 0

    def __init__(self):
        """
        Initialize your data structure here.
        """
        self.push_stack = []
        self.pop_stack = []
        self.count = 0

    def push(self, x: int) -> None:
        """
        Push element x to the back of queue.
        """
        self.push_stack.append(x)
        self.count += 1

    def pop(self) -> int:
        """
        Removes the element from in front of queue and returns that element.
        """
        if self.count == 0:
            return -1
        self.count -= 1
        if len(self.pop_stack) == 0:
            for _ in range(len(self.push_stack)):
                self.pop_stack.append(self.push_stack.pop())
        return self.pop_stack.pop()

    def peek(self) -> int:
        """
        Get the front element.
        """
        if self.count == 0:
            return -1
        if len(self.pop_stack) == 0:
            for _ in range(len(self.push_stack)):
                self.pop_stack.append(self.push_stack.pop())
        return self.pop_stack[-1]


    def empty(self) -> bool:
        """
        Returns whether the queue is empty.
        """
        return self.count == 0

# Your MyQueue object will be instantiated and called as such:
# obj = MyQueue()
# obj.push(1)
# obj.push(2)
# param_2 = obj.pop()
# param_3 = obj.peek()
# param_4 = obj.empty()
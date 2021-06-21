class MyStack:
    stack = []
    length = 0
    index = 0

    def __init__(self):
        """
        Initialize your data structure here.
        """
        self.stack = []
        self.length = 0
        self.index = 0

    def push(self, x: int) -> None:
        """
        Push element x onto stack.
        """
        if self.index == self.length:
            self.stack.append(x)
            self.length += 1
        else:
            self.stack[self.index] = x
        self.index += 1

    def pop(self) -> int:
        """
        Removes the element on top of the stack and returns that element.
        """
        if self.index > 0:
            self.index -= 1
            return self.stack[self.index]
        else:
            return -1

    def top(self) -> int:
        """
        Get the top element.
        """
        return self.stack[self.index - 1]

    def empty(self) -> bool:
        """
        Returns whether the stack is empty.
        """
        return self.index == 0

# Your MyStack object will be instantiated and called as such:
obj = MyStack()
obj.push(1)
obj.push(2)
print(obj.top())
print(obj.pop())
print(obj.empty())

import heapq


class MinStack:
    stack = []
    min_stack = []

    def __init__(self):
        """
        initialize your data structure here.
        """
        self.stack = []
        self.min_stack = []

    def push(self, x: int) -> None:
        self.stack.append(x)
        if not self.min_stack or self.min_stack[-1] >= x:
            self.min_stack.append(x)

    def pop(self) -> None:
        if self.stack.pop() == self.min_stack[-1]:
            self.min_stack.pop()

    def top(self) -> int:
        if self.stack:
            return self.stack[-1]
        return -1

    def min(self) -> int:
        if self.min_stack:
            return self.min_stack[-1]
        return -1

# class MinStack:
#     min_heap = []
#     stack = []
#     index = 0
#
#     def __init__(self):
#         """
#         initialize your data structure here.
#         """
#         self.min_heap = []
#         self.stack = []
#         self.index
#
#     def push(self, x: int) -> None:
#         heapq.heappush(self.min_heap, [x, self.index])
#         self.stack.append(x)
#         self.index += 1
#
#     def pop(self) -> None:
#         self.stack.pop()
#         self.index -= 1
#         while self.min_heap[0][1] >= self.index:
#             heapq.heappop(self.min_heap)
#
#     def top(self) -> int:
#         if self.index > 0:
#             return self.stack[self.index - 1]
#         return -1
#
#     def min(self) -> int:
#         if self.index > 0:
#             return self.min_heap[0]
#         return -1

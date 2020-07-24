#!/usr/bin/python3
from typing import List


class Solution:
    def findPath(self, flags: List[bool], graph: List[List[int]], current: int, target: int, path: List[int],
                 result: List[List[int]]):
        if current == target:
            path.append(target)
            result.append(path.copy())
            path.pop()
            return
        if flags[current]:
            return
        flags[current] = True
        path.append(current)
        for index in graph[current]:
            self.findPath(flags, graph, index, target, path, result)
        path.pop()
        flags[current] = False

    def allPathsSourceTarget(self, graph: List[List[int]]) -> List[List[int]]:
        result = list()
        length = len(graph)
        flags = [False for _ in range(length)]
        path = list()
        self.findPath(flags, graph, 0, length - 1, path, result)
        return result

from typing import List


class Solution:
    def numWays(self, n: int, relation: List[List[int]], k: int) -> int:
        edges = {}
        for edge in relation:
            a = edge[0]
            b = edge[1]
            if a not in edges:
                edges[a] = set()
            edges[a].add(b)

        result = [0]

        def helper(current: int, step_left: int):
            if step_left == 0:
                if current == n - 1:
                    result[0] += 1
                return
            if current in edges:
                step_left -= 1
                for next in edges[current]:
                    helper(next, step_left)

        helper(0, k)
        return result[0]

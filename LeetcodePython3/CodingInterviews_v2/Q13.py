class Solution:
    def movingCount(self, m: int, n: int, k: int) -> int:
        result = [0]
        used_flag = [[False for _ in range(n)] for _ in range(m)]

        def visit(i, j):
            def cal(x) -> int:
                res = 0
                while x > 0:
                    res += x % 10
                    x = x // 10
                return res

            if i >= m or j >= n or cal(i) + cal(j) > k or used_flag[i][j]:
                return
            used_flag[i][j] = True
            result[0] += 1
            visit(i, j + 1)
            visit(i + 1, j)

        visit(0, 0)
        return result[0]
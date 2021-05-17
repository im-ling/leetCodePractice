class Solution:
    def superEggDrop(self, k: int, n: int) -> int:
        result = 0
        array = [[0 for _ in range(k + 1)] for _ in range(n + 1)]
        for i in range(1, n + 1):
            for j in range(1, k + 1):
                array[i][j] = array[i - 1][j] + array[i - 1][j - 1] + 1
                if array[i][j] >= n:
                    return i
        return result


class Solution:
    table = []
    def hammingDistance(self, x: int, y: int) -> int:
        if len(Solution.table) == 0:
            for i in range(1 << 8):
                distance = 0
                z = i
                while z != 0:
                    distance += z & 0x1
                    z >>= 1
                Solution.table.append(distance)
        z = x ^ y
        distance = 0
        while z != 0:
            distance += Solution.table[z & 0xFF]
            z >>= 8
        return distance

solu = Solution()
result = solu.hammingDistance(1,4)
print(Solution.table)
print(result)

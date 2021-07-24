from typing import List


class Solution:
    def isCovered(self, ranges: List[List[int]], left: int, right: int) -> bool:
        ranges.sort(key=lambda x:x[0])
        big_range = [[0, -2]]
        index = 0
        for range in ranges:
            if range[1] < left:
                continue
            if range[0] > right:
                break
            if range[0] > big_range[index][1] + 1:
                big_range.append(range)
                index += 1
            else:
                if range[1] > big_range[index][1]:
                    big_range[index][1] = range[1]
        for range in big_range:
            if left >= range[0] and right <= range[1]:
                return True
        return False

ranges = [[1,2],[3,4],[5,6]]
left = 2
right = 5
result = Solution().isCovered(ranges, left, right)
print(result)

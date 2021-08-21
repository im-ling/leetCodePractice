class Solution:
    def longestObstacleCourseAtEachPosition(self, nums: List[int]) -> List[int]:
        output, sub = [], []
        for num in nums:
            idx = bisect_right(sub, num)
            if idx == len(sub):
                sub.append(num)
            else:
                sub[idx] = num
            output.append(idx + 1)
        return output

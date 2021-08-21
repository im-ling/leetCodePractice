class Solution:
    def longestObstacleCourseAtEachPosition(self, nums: List[int]) -> List[int]:
        out=[]
        temp=[]
        for i in nums:
            index=bisect.bisect_right(temp,i)
            if index>=len(temp):
                temp.append(i)
            else:
                temp[index]=i
            out.append(index+1)
        return out
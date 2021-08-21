class Solution:
    def longestObstacleCourseAtEachPosition(self, obstacles: List[int]) -> List[int]:
        st = []
        ans = []
        for p in obstacles:
            idx = bisect.bisect_right(st,p)
            if idx == len(st):
                st.append(p)
            st[idx] = p
            ans.append(idx+1)
        return ans 
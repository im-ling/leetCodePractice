class Solution {
public:
    vector<int> longestObstacleCourseAtEachPosition(vector<int>& obstacles) {
        const int n = obstacles.size();
        vector<int> ans(n, 0);

        vector<int> stk;
        for (int i = 0; i < n; i++) {
            const int t = obstacles[i];
            
            if (stk.empty() || stk.back() <= t) {
                stk.push_back(t);
            } else {
                auto it = upper_bound(stk.begin(), stk.end(), t);
                *it = t;
            }
            
            ans[i] = upper_bound(stk.begin(), stk.end(), t) - stk.begin();
        }
        
        return ans;
    }
};
class Solution {
public:
    vector<int> longestObstacleCourseAtEachPosition(vector<int>& obstacles) {
        int n = obstacles.size();
        vector<pair<int, int>> sorted;
        vector<int> result(n);
        for (int i = 0; i < n; i++) {
            pair<int, int> p = {obstacles[i], i};
            auto it = upper_bound(sorted.begin(), sorted.end(), p);
            int index = it - sorted.begin();
            if (it == sorted.begin()) {
                result[i] = 1;
            } else {
                result[i] = result[sorted[index - 1].second] + 1;
            }
            sorted.insert(it, 1, p);
            index++;
            while (index < sorted.size()) {
                if (result[sorted[index].second] <= result[i]) {
                    sorted.erase(sorted.begin() + index);
                } else {
                    break;
                }
            }
        }
        return result;
    }
};
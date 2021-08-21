class Solution {
public:
	vector<int> longestObstacleCourseAtEachPosition(vector<int>& obstacles) {
		vector<int> result;
		vector<int> M;
		for (int n : obstacles)
		{
			auto it = upper_bound(M.begin(), M.end(), n);
			result.push_back((it - M.begin()) + 1);
			if (it == M.end())
				M.push_back(n);
			else
				*it = n;
		}
		return result;
	}
};
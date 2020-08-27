//
//  q1470.hpp
//  LeetCode
//
//  Created by NowOrNever on 28/08/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q1470_hpp
#define q1470_hpp

#include <iostream>
#include <queue>
#include <algorithm>
#include <vector>
#include <unordered_map>
#include <unordered_set>
#include <set>
#include <numeric>
#include <stack>
#include <string>

using namespace std;

class q1470Solution {
public:
    vector<int> shuffle(vector<int>& nums, int n) {
        vector<int> result(nums.size());
        for (int i = 0; i < n; i ++) {
            result[i * 2] = nums[i];
            result[i * 2 + 1] = nums[i + n];
        }
        return result;
    }
};

void question1470(){
    vector<int> nums = {1,2,3,4,4,3,2,1};
    vector<int> result = q1470Solution().shuffle(nums, (int)nums.size() / 2);
    for (int i = 0; i < nums.size(); i++) {
        cout << result[i] << ' ';
    }
}
#endif /* q1470_hpp */

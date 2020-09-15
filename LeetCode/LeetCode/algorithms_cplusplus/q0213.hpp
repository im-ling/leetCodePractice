//
//  q0213.hpp
//  LeetCode
//
//  Created by NowOrNever on 15/09/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q0213_hpp
#define q0213_hpp

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
void question0213(){
    class Solution {
    public:
        int rob(vector<int>& nums) {
            int length = (int) nums.size();
            if (length <= 3) {
                int max_val = 0;
                for (int i = 0; i < length; i++) {
                    if (max_val < nums[i]) {
                        max_val = nums[i];
                    }
                }
                return max_val;
            }
            
            vector<int> result1(length);
            vector<int> result2(length);
            result1[0] = nums[0];
            result1[1] = nums[1];
            result1[2] = nums[2] + nums[0];
            result2[0] = 0;
            result2[1] = nums[1];
            result2[2] = nums[2];
            for (int i = 3; i < length; i++) {
                result1[i] = max(result1[i - 2], result1[i - 3]) + nums[i];
                result2[i] = max(result2[i - 2], result2[i - 3]) + nums[i];
            }
            return max(max(result1[length - 2], result1[length - 3]), max(result2[length - 1], result2[length - 3]));
        }
    };
    vector<int> nums = {1,2,3,1};
    int result = Solution().rob(nums);
    printf("%d\n", result);
}

#endif /* q0213_hpp */

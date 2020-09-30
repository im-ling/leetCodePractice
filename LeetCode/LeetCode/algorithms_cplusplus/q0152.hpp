//
//  q0152.hpp
//  LeetCode
//
//  Created by 李凌 on 2020/10/9.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q0152_hpp
#define q0152_hpp

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
void question0152(){
    class Solution {
    public:
        int maxProduct(vector<int>& nums) {
            int result = nums[0];
            int min_val = nums[0];
            int max_val = nums[0];
            for (int i = 1; i < nums.size(); i++) {
                if (nums[i] < 0) {
                    int temp = min_val;
                    min_val = max_val;
                    max_val = temp;
                }
                max_val = max(nums[i], max_val * nums[i]);
                min_val = min(nums[i], min_val * nums[i]);
                result = max(max_val, result);
            }
            return result;
        }
    };
}

#endif /* q0152_hpp */

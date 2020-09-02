//
//  q0219.hpp
//  LeetCode
//
//  Created by NowOrNever on 02/09/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q0219_hpp
#define q0219_hpp

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
void question0219(){
    class Solution {
    public:
        bool containsNearbyDuplicate(vector<int>& nums, int k) {
            unordered_map<int, int> map;
            for (int i = 0; i < nums.size(); i++) {
                if (map.find(nums[i]) != map.end() && i - map[nums[i]] <= k){
                    return true;
                }
                map[nums[i]] = i;
            }
            return false;
        }
    };
}

#endif /* q0219_hpp */

//
//  q0041.hpp
//  LeetCode
//
//  Created by 李凌 on 2020/9/30.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q0041_hpp
#define q0041_hpp

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
void question0041(){
    class Solution {
    public:
        int firstMissingPositive(vector<int>& nums) {
            size_t size = nums.size();
            vector<bool> nums2(size + 2);
            for (int i = 0; i < size; i++) {
                int number = nums[i];
                if (number > 0 && number <= size) {
                    nums2[number] = true;
                }
            }
            int j = 1;
            while (nums2[j++]);
            return --j;
        }
    };
    vector<int> nums = {3,4,-1,1};
    int result = Solution().firstMissingPositive(nums);
    printf("q0041_c++ result %d\n", result);
}
#endif /* q0041_hpp */

//
//  q0421.hpp
//  LeetCode
//
//  Created by 李凌 on 2020/10/9.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q0421_hpp
#define q0421_hpp

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
void question0421(){
    class Solution {
    public:
        int findMaximumXOR(vector<int>& nums) {
            sort(nums.begin(), nums.end());
            int number = nums[nums.size() - 1];
            int bits = -1;
            while (number > 0) {
                number >>= 1;
                bits++;
            }
            number = 1 << bits;
            if (bits < 0) {
                return 0;
            }
            int result = 0;
            for (int i = (int)nums.size() - 1; i > 0; i--) {
                if (nums[i] < number) {
                    break;
                }
                for (int j = 0; j < i; j++) {
                    if (result < (nums[i] ^ nums[j])) result = nums[i] ^ nums[j];
                }
            }
            return result;
        }
    };
    
    vector<int> nums = {3,10,5,25,2,8};
    int result = Solution().findMaximumXOR(nums);
    printf("result %d\n", result);
}

#endif /* q0421_hpp */

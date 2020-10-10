//
//  q0179.hpp
//  LeetCode
//
//  Created by 李凌 on 2020/10/10.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q0179_hpp
#define q0179_hpp

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
void question0179(){
    static vector<int> temp1;
    static vector<int> temp2;
    class Solution {
    private:
        static bool my_compare(int a, int b){
            if (a == 0) return false;
            temp1.clear();
            temp2.clear();
            while (a > 0) {
                temp1.push_back(a % 10);
                a /= 10;
            }
            while (b > 0) {
                temp2.push_back(b % 10);
                b /= 10;
            }
            int index1 = (int)temp1.size() - 1;
            int index2 = (int)temp2.size() - 1;
            for (int i = 0; i < temp1.size() * temp2.size(); i++) {
                if (temp1[index1] > temp2[index2]) return true;
                else if (temp1[index1] < temp2[index2]) return false;
                if (--index1 < 0) index1 = (int) temp1.size() - 1;
                if (--index2 < 0) index2 = (int) temp2.size() - 1;
            }
            return true;
        }
    public:
        string largestNumber(vector<int>& nums) {
            sort(nums.begin(), nums.end(), my_compare);
            if (nums[0] == 0) {
                return "0";
            }
            string result = "";
            for (auto number : nums) {
                result.append(to_string(number));
            }
            return result;
        }
    };
    
    vector<int> nums = {3,30,34,5,9};
    string result = Solution().largestNumber(nums);
    cout << result << endl;
}

#endif /* q0179_hpp */

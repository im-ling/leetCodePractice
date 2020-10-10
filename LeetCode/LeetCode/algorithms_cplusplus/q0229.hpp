//
//  q0229.hpp
//  LeetCode
//
//  Created by 李凌 on 2020/10/10.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q0229_hpp
#define q0229_hpp

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
void question0229(){
    class Solution {
    public:
        vector<int> majorityElement(vector<int>& nums) {
            int number1 = 0;
            int number2 = 0;
            int count1 = 0;
            int count2 = 0;
            for (auto number : nums) {
                if (number == number1) {
                    count1++;
                }else if (number == number2) {
                    count2++;
                }else if (!count1){
                    number1 = number;
                    count1++;
                }else if (!count2){
                    number2 = number;
                    count2++;
                }else{
                    count1--;
                    count2--;
                }
            }
            
            count1 = 0;
            count2 = 0;
            for (auto number : nums) {
                if (number == number1) {
                    count1++;
                }
                if (number == number2) {
                    count2++;
                }
            }
            vector<int> result;
            if (count1 > nums.size() / 3.0) {
                result.push_back(number1);
            }
            if (number2 != number1 && count2 > nums.size() / 3.0) {
                result.push_back(number2);
            }
            return result;
        }
    };
}

#endif /* q0229_hpp */

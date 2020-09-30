//
//  q1291.hpp
//  LeetCode
//
//  Created by 李凌 on 2020/10/9.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q1291_hpp
#define q1291_hpp

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
void question1291(){
    class Solution {
    public:
        vector<int> sequentialDigits(int low, int high) {
            vector<int> result;
            int array[9] = {1, 11, 111, 1111, 11111, 111111, 1111111, 11111111, 111111111};
            int number = 0;
            for (int i = 0; i < 9; i++) {
                number += array[i];
                if (number > high) break;
                if (low > array[i] * 9) continue;
                int temp = number;
                if (temp >= low && temp <= high) {
                    result.push_back(temp);
                }
                for (int j = i + 1; j < 9; j++) {
                    temp += array[i];
                    if (temp > high) break;
                    if (temp >= low)
                        result.push_back(temp);
                }
            }
            return result;
        }
    };
}

#endif /* q1291_hpp */

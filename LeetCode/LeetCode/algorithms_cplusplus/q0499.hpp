//
//  q0499.hpp
//  LeetCode
//
//  Created by NowOrNever on 26/09/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q0499_hpp
#define q0499_hpp

#include <stdio.h>

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
void question0499(){
    class Solution {
    public:
        int findPoisonedDuration(vector<int>& timeSeries, int duration) {
            int result = 0;
            int end = 0;
            for (int i = 0; i < timeSeries.size(); i++) {
                result += duration;
                if (timeSeries[i] < end) {
                    result -= end - timeSeries[i];
                }
                end = timeSeries[i] + duration;
            }
            return result;
        }
    };
}
#endif /* q0499_hpp */

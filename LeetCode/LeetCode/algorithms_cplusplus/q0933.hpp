//
//  q0933.hpp
//  LeetCode
//
//  Created by NowOrNever on 08/10/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q0933_hpp
#define q0933_hpp

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

void question0933(){
    class RecentCounter {
    private:
        vector<int> nums;
        int index = 0;
    public:
        RecentCounter() {
            nums.clear();
            index = 0;
        }
        
        int ping(int t) {
            nums.push_back(t);
            while (nums[index] - t > 3000) {
                index += 1;
            }
            return (int)nums.size() - index;
        }
    };
}

#endif /* q0933_hpp */

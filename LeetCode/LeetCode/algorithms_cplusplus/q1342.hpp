//
//  q1342.hpp
//  LeetCode
//
//  Created by NowOrNever on 28/08/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q1342_hpp
#define q1342_hpp

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

void question1342(){
    static int cache1342[1000001] = {0,1};
    class Solution {
    public:
        int numberOfSteps (int num) {
            if (cache1342[num] > 0 || num == 0) return cache1342[num];
            int temp = num;
            int count = 0;
            while (cache1342[temp] == 0) {
                count++;
                if (temp & 0x1) temp--;
                else temp = temp >> 1;
            }
            count += cache1342[temp];
            temp = num;
            do {
                cache1342[temp] = count--;
                if (temp & 0x1) temp--;
                else temp = temp >> 1;
            } while (cache1342[temp] == 0);
            return cache1342[num];
        }
    };
    cout << Solution().numberOfSteps(14) << endl;
    cout << endl;
}

#endif /* q1342_hpp */

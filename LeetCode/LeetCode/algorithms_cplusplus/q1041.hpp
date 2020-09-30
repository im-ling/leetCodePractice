//
//  q1041.hpp
//  LeetCode
//
//  Created by 李凌 on 2020/10/9.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q1041_hpp
#define q1041_hpp

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
void question1041(){
    class Solution {
    public:
        bool isRobotBounded(string instructions) {
            int directions[4][2] = {{0, 1}, {-1, 0}, {0, -1}, {1, 0}};
            int index = 0;
            int point[2] = {0, 0};
            for (int i = 0; i < 4; i++) {
                for (int j = 0; j < instructions.length(); j++) {
                    switch (instructions[j]) {
                        case 'G':
                            point[0] += directions[index][0];
                            point[1] += directions[index][1];
//                            printf("%d %d \n", point[0], point[1]);
                            break;
                        case 'L':
                            index = (++index) % 4;
                            break;
                        case 'R':
                            index = (3 + index) % 4;
                            break;
                        default:
                            break;
                    }
                }
            }
            if (point[0] == 0 && point[1] == 0)
                return true;
            return false;
        }
    };
    string str = "GGLLGG";
    bool result = Solution().isRobotBounded(str);
    printf("result %d\n", result);
}

#endif /* q1041_hpp */

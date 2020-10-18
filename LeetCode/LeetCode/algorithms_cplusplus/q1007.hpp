//
//  q1007.hpp
//  LeetCode
//
//  Created by 李凌 on 2020/10/19.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q1007_hpp
#define q1007_hpp

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
void question1007(){
    class Solution {
    public:
        int minDominoRotations(vector<int>& A, vector<int>& B) {
            unordered_map<int, int> map;
            int count1 = 0;
            int count2 = 0;
            int common1 = 0;
            int common2 = 0;
            map[A[0]] = 0;
            map[B[0]] = 0;

            for (int i = 0; i < A.size(); i++) {
                int val1 = A[i];
                int val2 = B[i];
                if (map.find(val1) == map.end() && map.find(val2) == map.end()) {
                    return -1;
                }
                if (map.find(val1) != map.end()) {
                    map[val1]++;
                }
                if (map.find(val2) != map.end()) {
                    map[val2]++;
                }
                if (val1 == val2) {
                    map[val1]--;
                    if (val1 == A[0]) {
                        common1++;
                    }else{
                        common2++;
                    }
                }
                if (map[A[0]] <= i && map[B[0]] <= i) {
                    return -1;
                }
                if (val1 == A[0]) {
                    count1++;
                }
                if (val2 == B[0]) {
                    count2++;
                }
            }
            if (map.begin()->second == A.size()) {
                if (map.begin()->first == A[0]) {
                    return min(count1 - common1, (int)A.size() - count1);
                }else{
                    return min(count2 - common2, (int)B.size() - count2);
                }
            }else{
                if (map.begin()->first == A[0]) {
                    return min(count2 - common2, (int)B.size() - count2);
                }else{
                    return min(count1 - common1, (int)A.size() - count1);
                }
            }
            return -1;
        }
    };
    
    vector<int> A = {2,1,1,3,2,1,2,2,1};
    vector<int> B = {3,2,3,1,3,2,3,3,2};
    int result = Solution().minDominoRotations(A, B);
    printf("result %d\n", result);
}

#endif /* q1007_hpp */

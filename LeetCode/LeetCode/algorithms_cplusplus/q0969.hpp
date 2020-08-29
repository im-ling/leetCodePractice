//
//  q0969.hpp
//  LeetCode
//
//  Created by NowOrNever on 29/08/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q0969_hpp
#define q0969_hpp

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
void printIntVector(vector<int> &array){
    for (int i = 0; i < array.size(); i++) {
        cout << array[i] << " ";
    }
    cout << endl;
}

void question0969(){    
    class Solution {
    public:
        vector<int> pancakeSort(vector<int>& A) {
            int target = (int)A.size();
            vector<int> result;
            while (target > 0) {
                for (int i = 0; i < target - 1; i++) {
                    if (target == A[i]) {
                        if (i == 0){
                            result.push_back(target);
                            reverse(A.begin(), A.begin() + target);
                        }else{
                            result.push_back(i + 1);
                            reverse(A.begin(), A.begin() + i + 1);
                            result.push_back(target);
                            reverse(A.begin(), A.begin() + target);
                        }
                        break;
                    }
                }
                target--;
            }
            return result;
        }
    };

    vector<int> A = {3,2,4,1};
    vector<int> result = Solution().pancakeSort(A);
    for (int i = 0; i < result.size(); i++) {
        cout << result[i] << " ";
    }

    cout << endl;

}

void question0969();

#endif /* q0969_hpp */

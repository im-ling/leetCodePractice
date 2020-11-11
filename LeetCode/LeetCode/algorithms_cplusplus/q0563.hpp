//
//  q0563.hpp
//  LeetCode
//
//  Created by 李凌 on 2020/11/11.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q0563_hpp
#define q0563_hpp

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
void question0563(){
    class Solution {
    private:
        int sum_of_node(TreeNode* node, int* result) {
            if (node) {
                int sum_left = sum_of_node(node->left, result);
                int sum_right = sum_of_node(node->right, result);
                *result += abs(sum_left - sum_right);
                return sum_left + sum_right + node->val;
            }else{
                return 0;
            }
        }
        
    public:
        int findTilt(TreeNode* root) {
            int result = 0;
            if (root) {
                sum_of_node(root, &result);
            }
            return result;
        }
    };
}

#endif /* q0563_hpp */

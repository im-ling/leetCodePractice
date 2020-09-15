//
//  q0337.hpp
//  LeetCode
//
//  Created by NowOrNever on 15/09/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q0337_hpp
#define q0337_hpp

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
void question0337(){
    struct TreeNode {
        int val;
        TreeNode *left;
        TreeNode *right;
        TreeNode() : val(0), left(nullptr), right(nullptr) {}
        TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
        TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
    };
    class Solution {
    unordered_map<TreeNode*, int> true_map;
    unordered_map<TreeNode*, int> false_map;
    private:
        int rob_helper(TreeNode* root, bool flag) {
            int result = 0;
            if (root) {
                if (flag) {
                    if (true_map.find(root) != true_map.end()) {
                        return true_map[root];
                    }
                }else{
                    if (false_map.find(root) != false_map.end()) {
                        return false_map[root];
                    }
                }
                result = rob_helper(root->left, true) + rob_helper(root->right, true);
                false_map[root] = result;
                if (flag) {
                    int value1 = root->val + rob_helper(root->left, false) + rob_helper(root->right, false);
                    result = max(result, value1);
                    true_map[root] = result;
                }
            }
            return result;
        }
    public:
        int rob(TreeNode* root) {
            true_map.clear();
            false_map.clear();
            return rob_helper(root, true);
        }
    };
    
}

#endif /* q0337_hpp */

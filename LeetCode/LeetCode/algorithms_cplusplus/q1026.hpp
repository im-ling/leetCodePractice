//
//  q1026.hpp
//  LeetCode
//
//  Created by 李凌 on 2020/11/11.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q1026_hpp
#define q1026_hpp

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

void question1026(){
    struct TreeNode {
        int val;
        TreeNode *left;
        TreeNode *right;
        TreeNode() : val(0), left(nullptr), right(nullptr) {}
        TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
        TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
    };
    class Solution {
    private:
        void visit(TreeNode *node, int max_val, int min_val, int *max_diff){
            if (node) {
                int node_val = node->val;
                if (abs(max_val - node_val) > *max_diff) {
                    *max_diff = abs(max_val - node_val);
                }
                if (abs(node_val - min_val) > *max_diff) {
                    *max_diff = abs(node_val - min_val);
                }
                if (node_val < min_val) {
                    min_val = node_val;
                }
                if (node_val > max_val) {
                    max_val = node_val;
                }
                visit(node->left, max_val, min_val, max_diff);
                visit(node->right, max_val, min_val, max_diff);
            }
        }
    public:
        int maxAncestorDiff(TreeNode* root) {
            int result = 0;
            if (root) {
                visit(root, root->val, root->val, &result);
            }
            return result;
        }
    };
}

#endif /* q1026_hpp */

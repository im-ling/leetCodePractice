//
//  q1305.hpp
//  LeetCode
//
//  Created by NowOrNever on 05/09/2020.
//  Copyright © 2020 DoubleL. All rights reserved.
//

#ifndef q1305_hpp
#define q1305_hpp

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
void question1305(){
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
        void travelNode(TreeNode *node, vector<int> &vector){
            if (node) {
                travelNode(node->left, vector);
                vector.push_back(node->val);
                travelNode(node->right, vector);
            }
        }
    public:
        vector<int> getAllElements(TreeNode* root1, TreeNode* root2) {
            vector<int> result;
            vector<int> list1;
            vector<int> list2;
            travelNode(root1, list1);
            travelNode(root2, list2);
            int len1 = (int) list1.size();
            int len2 = (int) list2.size();
            int i = 0;
            int j = 0;
            while (i < len1 && j < len2) {
                if (list1[i] <= list2[j]) {
                    result.push_back(list1[i++]);
                }else {
                    result.push_back(list2[j++]);
                }
            }
            if (i == len1){
                while (j < len2) {
                    result.push_back(list2[j++]);
                }
            }else{
                while (i < len1) {
                    result.push_back(list1[i++]);
                }
            }
            return result;
        }
    };
    
}
#endif /* q1305_hpp */

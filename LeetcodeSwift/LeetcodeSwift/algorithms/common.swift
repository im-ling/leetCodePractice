//
//  common.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 13/02/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

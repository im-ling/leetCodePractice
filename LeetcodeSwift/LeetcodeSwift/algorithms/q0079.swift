//
//  q0079.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 10/03/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//79. Word Search
//Medium
//
//2854
//
//147
//
//Add to List
//
//Share
//Given a 2D board and a word, find if the word exists in the grid.
//
//The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.
//
//Example:
//
//board =
//[
//  ['A','B','C','E'],
//  ['S','F','C','S'],
//  ['A','D','E','E']
//]
//
//Given word = "ABCCED", return true.
//Given word = "SEE", return true.
//Given word = "ABCB", return false.
//Accepted
//399,696
//Submissions
//1,184,720
class q0079Solution {
    var height = 0
    var width = 0
    var board_flags = [[Bool]]()
    var array = [Character]()
    var _board = [[Character]]()
    func exist_helper(i: Int, j: Int, index: Int) -> Bool{
        if index == array.count {
            return true
        }
        if i < 0 || i >= height || j < 0 || j >= width{
            return false
        }
        if _board[i][j] == array[index] && board_flags[i][j] {
            board_flags[i][j] = false
            if exist_helper(i: i - 1, j: j, index: index + 1) ||
                exist_helper(i: i + 1, j: j, index: index + 1) ||
                exist_helper(i: i, j: j - 1, index: index + 1) ||
                exist_helper(i: i, j: j + 1, index: index + 1) {
                return true
            }
            board_flags[i][j] = true
        }
        return false
    }
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        array = [Character].init(word)
        if board.count < 1 || board[0].count < 1 || array.count < 1{
            return false
        }
        _board = board
        width = board[0].count
        height = board.count
        board_flags = [[Bool]].init(repeating: [Bool].init(repeating: true, count: width), count: height)
        for i in 0..<height {
            for j in 0..<width {
                if board[i][j] == array[0] {
                    board_flags[i][j] = false
                    if exist_helper(i: i - 1, j: j, index: 1) ||
                        exist_helper(i: i + 1, j: j, index: 1) ||
                        exist_helper(i: i, j: j - 1, index: 1) ||
                        exist_helper(i: i, j: j + 1, index: 1) {
                        return true
                    }
                    board_flags[i][j] = true
                }
            }
        }
        return false
    }
}
func q0079(){
    let solu = q0079Solution()
    var board = [[Character]]()
    board.append([Character].init(arrayLiteral: "A","B","C","E"))
    board.append([Character].init(arrayLiteral: "S","F","C","S"))
    board.append([Character].init(arrayLiteral: "A","D","E","E"))
    let word = "ABCCED"
    let result = solu.exist(board, word)
    print(result)
}

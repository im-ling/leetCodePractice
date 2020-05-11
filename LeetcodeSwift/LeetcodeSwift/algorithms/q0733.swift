//
//  q0733.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 11/05/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//733. Flood Fill
//Easy
//
//904
//
//165
//
//Add to List
//
//Share
//An image is represented by a 2-D array of integers, each integer representing the pixel value of the image (from 0 to 65535).
//
//Given a coordinate (sr, sc) representing the starting pixel (row and column) of the flood fill, and a pixel value newColor, "flood fill" the image.
//
//To perform a "flood fill", consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color as the starting pixel), and so on. Replace the color of all of the aforementioned pixels with the newColor.
//
//At the end, return the modified image.
//
//Example 1:
//Input:
//image = [[1,1,1],[1,1,0],[1,0,1]]
//sr = 1, sc = 1, newColor = 2
//Output: [[2,2,2],[2,2,0],[2,0,1]]
//Explanation:
//From the center of the image (with position (sr, sc) = (1, 1)), all pixels connected
//by a path of the same color as the starting pixel are colored with the new color.
//Note the bottom corner is not colored 2, because it is not 4-directionally connected
//to the starting pixel.
//Note:
//
//The length of image and image[0] will be in the range [1, 50].
//The given starting pixel will satisfy 0 <= sr < image.length and 0 <= sc < image[0].length.
//The value of each color in image[i][j] and newColor will be an integer in [0, 65535].
//Accepted
//109,937
//Submissions
//203,806
class q0733Solution {
    func floodFill_helper(_ image: inout [[Int]], _ x: Int, _ y: Int, _ newColor: Int, _ originColor: Int){
        if x < 0 || x >= image.count || y < 0 || y >= image[0].count || image[x][y] != originColor || image[x][y] == newColor{
            return
        }
        image[x][y] = newColor
        floodFill_helper(&image, x - 1, y, newColor, originColor)
        floodFill_helper(&image, x, y - 1, newColor, originColor)
        floodFill_helper(&image, x + 1, y, newColor, originColor)
        floodFill_helper(&image, x, y + 1, newColor, originColor)
    }
    
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        guard image[sr][sc] != newColor else {return image}
        var newImage = image
        floodFill_helper(&newImage, sr, sc, newColor, image[sr][sc])
        return newImage
    }
}

func q0733(){
    let solution = q0733Solution()
    let sr = 1
    let sc = 1
    let newColor = 2
    let image = [[1,1,1],[1,1,0],[1,0,1]]
    let result = solution.floodFill(image, sr, sc, newColor)
    print(result)
}

#!/usr/bin/python3
from typing import List
from fractions import Fraction

class Solution:
    def maxPoints(self, points: List[List[int]]) -> int:
        length = len(points)
        if length < 3:
            return length
        result = 2
        for i in range(length - 1):
            dic = {"v": 1}
            if length - i < result:
                break
            for j in range(i + 1, length):
                if points[i][0] == points[j][0]:
                    dic["v"] += 1
                    if dic["v"] > result:
                        result = dic["v"]
                else:
                    k = (points[j][1] - points[i][1]) / (points[j][0] - points[i][0])
                    print(k)
                    if k not in dic:
                        dic[k] = 2
                    else:
                        dic[k] += 1
                        if dic[k] > result:
                            result = dic[k]
        return result



    def maxPoints3(self, points: List[List[int]]) -> int:
        result = 0
        for i in range(len(points)):
            p = points[i]
            same = 0
            dic = {'v': 1}
            for j in range(i + 1, len(points)):
                p2 = points[j]
                if p[0] == p2[0] and p[1] == p2[1]:
                    same += 1
                elif p2[0] == p[0]:
                    dic['v'] += 1
                else:
                    angle = (p2[1] - p[1]) / (p2[0] - p[0])
                    if angle not in dic:
                        dic[angle] = 2
                    else:
                        dic[angle] += 1
            result = max(result, same + max(dic.values()))
        return result

    def maxPoints2(self, points: List[List[int]]) -> int:
        length = len(points)
        if length < 3:
            return length
        result = 2
        record_k = {}
        record_y = {}
        for i in range(length - 1):
            for j in range(i + 1, length):
                if points[i][0] == points[j][0]:
                    if points[i][0] not in record_y:
                        record_y[points[i][0]] = {i, j}
                    elif j not in record_y[points[i][0]]:
                        record_y[points[i][0]].add(j)
                        if len(record_y[points[i][0]]) > result:
                            result = len(record_y[points[i][0]])
                else:
                    k = Fraction (points[j][1] - points[i][1], points[j][0] - points[i][0])
                    c = Fraction(points[j][1] - k * points[j][0])
                    # print(k, c)
                    if k not in record_k:
                        record_k[k] = {c: {i, j}}
                    else:
                        record_c = record_k[k]
                        if c not in record_c:
                            record_c[c] = {i, j}
                        else:
                            record_c[c].add(j)
                            if len(record_c[c]) > result:
                                result = len(record_c[c])
        return result

nums = [[-6,-1],[3,1],[12,3]]
result = Solution().maxPoints(nums)
print(result)

print(Fraction(1, -123) == Fraction(-2, 246))
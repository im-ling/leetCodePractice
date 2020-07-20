#!/usr/bin/python3
from collections import defaultdict
from typing import List


class Solution:
    def countSubTrees(self, n: int, edges: List[List[int]], labels: str) -> List[int]:
        listOfDic = list()
        for i in range(n):
            listOfDic.append({})
            listOfDic[i][labels[i]] = 1

        edgeFlag = [True for _ in range(n)]
        edgeFlag[0] = False
        for edge in edges:
            if edgeFlag[edge[0]] and not edgeFlag[edge[1]]:
                temp = edge[0]
                edge[0] = edge[1]
                edge[1] = temp
            if edgeFlag[edge[1]]:
                edgeFlag[edge[1]] = False

        for edge in reversed(edges):
            node1 = edge[0]
            node2 = edge[1]
            for key in listOfDic[node2].keys():
                if key in listOfDic[node1]:
                    listOfDic[node1][key] += listOfDic[node2][key]
                else:
                    listOfDic[node1][key] = listOfDic[node2][key]

        result = list()
        for i in range(n):
            result.append(listOfDic[i][labels[i]])
        return result

# class Solution:
#     def dfs(self, flags, index, edgeDic, listOfDic, labels, result):
#         if flags[index]:
#             return
#         flags[index] = True
#         result.append(listOfDic[index][labels[index]])
#         for index in edgeDic[index]:
#             self.dfs(flags, index, edgeDic, listOfDic, labels, result)
#
#     def countSubTrees(self, n: int, edges: List[List[int]], labels: str) -> List[int]:
#         listOfDic = list()
#
#         for i in range(n):
#             dic = defaultdict()
#             listOfDic.append(dic)
#             listOfDic[i][labels[i]] = 1
#
#         edgeDic = defaultdict(list)
#         for edge in edges:
#             edgeDic[edge[0]].append(edge[1])
#
#         for edge in reversed(edges):
#             node1 = edge[0]
#             node2 = edge[1]
#             for key in listOfDic[node2].keys():
#                 if key in listOfDic[node1]:
#                     listOfDic[node1][key] += listOfDic[node2][key]
#                 else:
#                     listOfDic[node1][key] = listOfDic[node2][key]
#
#         result = list()
#         flags = [False for _ in range(n)]
#         for i in range(n):
#             self.dfs(flags, i, edgeDic, listOfDic, labels, result)
#         return result

solu = Solution()
n = 4
edges = [[0,2],[0,3],[1,2]]
labels = "aeed"
result = solu.countSubTrees(n, edges, labels)
print(result)
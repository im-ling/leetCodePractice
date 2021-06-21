#!/usr/bin/python3
import functools
from typing import List


class Solution:
    def getSkyline(self, buildings: List[List[int]]) -> List[List[int]]:
        def inner_insert(list, ele):
            left = 0
            right = len(list) - 1
            if right < 0:
                list.append(ele)
                return list
            while left <= right:
                mid = (left + right) // 2
                if list[mid] <= ele:
                    left = mid + 1
                else:
                    right = mid - 1
            list.insert(left, ele)

        def inner_delete(list, ele):
            left = 0
            right = len(list) - 1
            while left <= right:
                mid = (left + right) // 2
                if list[mid] == ele:
                    list.pop(mid)
                    return
                elif list[mid] < ele:
                    left = mid + 1
                else:
                    right = mid - 1
        def cmp(a, b):
            if a[0] < b[0]:
                return -1
            elif a[0] > b[0]:
                return 1
            else:
                if a[1] < b[1]:
                    return -1
                elif a[1] > b[1]:
                    return 1
                return 0

        result = list()
        points = list()
        for building in buildings:
            points.append([building[0], -building[2]])
            points.append([building[1], building[2]])

        last = 0
        heights = [0]
        points.sort(key=functools.cmp_to_key(cmp))
        for point in points:
            if point[1] < 0:
                inner_insert(heights, -point[1])
            else:
                inner_delete(heights, point[1])
            cur = heights[len(heights) - 1]
            if cur != last:
                result.append([point[0], cur])
                last = cur
        # i = len(result) - 1
        # while i > 0:
        #     if result[i][0] == result[i - 1][0]:
        #         result[i - 1][1] = result[i][1]
        #         result.pop(i)
        #     elif result[i][1] == result[i - 1][1]:
        #         result.pop(i)
        #     i -= 1
        return result

    # Time Limit Exceeded
    def getSkyline2(self, buildings: List[List[int]]) -> List[List[int]]:
        length = len(buildings)
        height_buildings = buildings.copy()
        height_buildings.sort(key=lambda x: x[2])
        new_buildings = [height_buildings[length - 1]]
        new_buildings_count = 1

        index = length - 2
        while index >= 0:
            building = height_buildings[index]

            if building[0] == -1:
                index += 1
                continue

            for i in range(new_buildings_count):
                new_building_i = new_buildings[i]
                if building[1] < new_building_i[0] or building[0] > new_building_i[1]:
                    continue
                elif new_building_i[0] <= building[0] <= building[1] <= new_building_i[1]:
                    building[0] = -1
                    break
                elif building[0] <= new_building_i[0] <= new_building_i[1] <= building[1]:
                    height_buildings.insert(index, [new_building_i[1], building[1], building[2]])
                    index += 1
                    building[1] = new_building_i[0]
                    if building[1] == building[0]:
                        break
                elif new_building_i[0] <= building[0] <= new_building_i[1]:
                    building[0] = new_building_i[1]
                elif new_building_i[0] <= building[1] <= new_building_i[1]:
                    building[1] = new_building_i[0]
            if building[1] > building[0] > -1:
                new_buildings.append(building)
                new_buildings_count += 1
            index -= 1

        # print(new_buildings)
        new_buildings.sort(key=lambda x: x[0])
        # print(new_buildings)

        i = 1
        while i < len(new_buildings):
            if new_buildings[i - 1][2] == new_buildings[i][2]:
                new_buildings[i - 1][1] = new_buildings[i][1]
                new_buildings.pop(i)
            else:
                i += 1

        result = list()
        result.append([new_buildings[0][0], new_buildings[0][2]])
        result.append([new_buildings[0][1], 0])
        i = 1
        while i < len(new_buildings):
            building = new_buildings[i]
            if result[-1][0] == building[0]:
                result[-1][1] = building[2]
            else:
                result.append([building[0], building[2]])
            result.append([building[1], 0])
            i += 1
        return result


buildings = [[0,2,3],[2,5,3]]
result = Solution().getSkyline(buildings)
print(result)





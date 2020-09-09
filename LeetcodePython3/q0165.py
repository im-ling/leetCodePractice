class Solution:
    def compareVersion(self, version1: str, version2: str) -> int:
        version1_array = version1.split(".")
        version2_array = version2.split(".")
        len1 = len(version1_array)
        len2 = len(version2_array)
        len_min = min(len1, len2)
        for i in range(len_min):
            if int(version1_array[i]) > int(version2_array[i]):
                return 1
            elif int(version1_array[i]) < int(version2_array[i]):
                return -1
        if len1 == len2:
            return 0
        len_max = len2
        array = version2_array
        flag = -1
        if len1 > len2:
            len_max = len1
            array = version1_array
            flag = 1

        for i in range(len_min, len_max):
            if int(array[i]) > 0:
                return flag
        return 0


version1 = "2.0"
version2 = "2"
result = Solution().compareVersion(version1, version2)
print(result)
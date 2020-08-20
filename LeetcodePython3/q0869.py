class Solution:
    pow_of_2_set = {1}

    def reorderedPowerOf2(self, N: int) -> bool:
        def number_transform(number_copy: int) -> int:
            array = list()
            while number_copy > 0:
                array.append(number_copy % 10)
                number_copy //= 10
            number_copy = 0
            # notice 1024 will be transform into 124 without reversed
            for i in sorted(array, reverse=True):
                number_copy = number_copy * 10 + i
            return number_copy

        if len(self.pow_of_2_set) == 1:
            number = 2
            while number < 1000000000:
                self.pow_of_2_set.add(number_transform(number))
                # print(number)
                # print(self.pow_of_2_set)
                number <<= 1
        return number_transform(N) in self.pow_of_2_set

    pow_of_2_set2 = {"1"}

    def reorderedPowerOf2_string(self, N: int) -> bool:
        if len(self.pow_of_2_set2) == 1:
            number = 2
            while number < 1000000000:
                self.pow_of_2_set2.add(''.join(sorted(str(number))))
                number <<= 1
        # print(self.pow_of_2_set2)
        return ''.join(sorted(str(N))) in self.pow_of_2_set2


result = Solution().reorderedPowerOf2(124)
print(result)
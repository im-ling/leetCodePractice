class Solution:
    def computeArea(self, ax1: int, ay1: int, ax2: int, ay2: int, bx1: int, by1: int, bx2: int, by2: int) -> int:
        _ax1 = min(ax1, ax2)
        _ax2 = max(ax1, ax2)
        _ay1 = min(ay1, ay2)
        _ay2 = max(ay1, ay2)

        _bx1 = min(bx1, bx2)
        _bx2 = max(bx1, bx2)
        _by1 = min(by1, by2)
        _by2 = max(by1, by2)

        area_a = (_ax2 - _ax1) * (_ay2 - _ay1)
        area_b = (_bx2 - _bx1) * (_by2 - _by1)
        result = area_a + area_b
        if area_a == 0 or area_b == 0:
            return result
        if _ax2 <= _bx1 or _bx2 <= _ax1 or _ay2 <= _by1 or _by2 <= _ay1:
            return result
        if _bx1 <= _ax1 <= _ax2 <= _bx2 and _by1 <= _ay1 <= _ay2 <= _by2:
            return result - area_a
        if _ax1 <= _bx1 <= _bx2 <= _ax2 and _ay1 <= _by1 <= _by2 <= _ay2:
            return result - area_b

        #  取最大值中间的2个作为cx1,cx2 !!!
        cx1 = max(_ax1, _bx1)
        cx2 = min(_ax2, _bx2)
        cy1 = max(_ay1, _by1)
        cy2 = min(_ay2, _by2)

        result -= abs(cx1 - cx2) * abs(cy1 - cy2)
        return result


result = Solution().computeArea(-2, -2, 2, 2, -1, -1, 1, 1)
print(result)

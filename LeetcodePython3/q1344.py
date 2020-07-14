class Solution:
    def angleClock(self, hour: int, minutes: int) -> float:
        angle_hour = (hour % 12 + minutes / 60.0) * 30
        angle_minutes = minutes * 6.0
        angle = abs(angle_hour - angle_minutes)
        if angle > 180:
            angle = 360 - angle
        return angle
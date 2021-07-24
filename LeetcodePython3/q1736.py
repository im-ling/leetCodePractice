class Solution:
    def maximumTime(self, time: str) -> str:
        result = ""

        if time[0] == "?":
            if ord("4") <= ord(time[1]) <= ord("9"):
                result += "1"
            else:
                result += "2"
        else:
            result += time[0]

        if time[1] == "?":
            if result[0] == "2":
                result += "3"
            else:
                result += "9"
        else:
            result += time[1]

        result += ":"

        if time[3] == "?":
            result += "5"
        else:
            result += time[3]

        if time[4] == "?":
            result += "9"
        else:
            result += time[4]

        return result
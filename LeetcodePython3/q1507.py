class Solution:
    def reformatDate(self, date: str) -> str:
        splits = date.split(" ")
        monthArray = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        monthString = ""
        for i in range(len(monthArray)):
            if splits[1] == monthArray[i]:
                monthString = str(i + 1)
        dayString = ""
        for c in splits[0]:
            if c >= "0" and c <= "9":
                dayString += c
        if len(monthString) == 1:
            monthString = "0" + monthString
        if len(dayString) == 1:
            dayString = "0" + dayString
        result = splits[2] + "-" + monthString + "-" + dayString
        return result

solu = Solution()
date = "20th Oct 2052"
result = solu.reformatDate(date)
print(result)
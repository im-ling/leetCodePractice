class Solution:
    def validPalindrome(self, s: str) -> bool:
        return self.validPalindrome_helper(s, 0, len(s) - 1, True)

    def validPalindrome_helper(self, s: str, left:int, right:int, deleteFlag:bool) -> bool:
        if left >= right:
            return True
        while left < right and s[left] == s[right]:
            left += 1
            right -= 1
        if left >= right:
            return True
        else:
            if deleteFlag:
                return self.validPalindrome_helper(s, left + 1, right, False) or self.validPalindrome_helper(s, left, right - 1, False)
            else:
                return False

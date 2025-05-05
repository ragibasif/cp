"""
Problem: 1137 nth_tribonacci_number
Platform: leetcode
Contest/Difficulty: easy
URL: https://leetcode.com/problems/n-th-tribonacci-number/
Topics: Math, Dynamic Programming, Memoization
"""


class Solution:

    # Recursion + Memoization / Top Down

    hashmap = dict()

    def top_down_tribonacci(self, n: int) -> int:
        if n <= 0:
            return 0
        elif n == 1 or n == 2:
            return 1
        else:
            if n not in self.hashmap:
                self.hashmap[n] = (
                    self.top_down_tribonacci(n - 1)
                    + self.top_down_tribonacci(n - 2)
                    + self.top_down_tribonacci(n - 3)
                )
        return self.hashmap[n]

    # Tabulation / Bottom Up

    def bottom_up_tribonacci(self, n: int) -> int:
        one = 0
        two = three = 1

        if n <= 0:
            return one
        elif n == 1 or n == 2:
            return two
        for i in range(3, n + 1):
            curr = one + two + three
            one = two
            two = three
            three = curr
        return three

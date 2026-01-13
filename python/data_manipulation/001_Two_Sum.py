"""
LeetCode 1 - Two Sum
Difficulty: Easy
Category: Array, Hash Table

Problem:
Given an array of integers nums and an integer target, 
return indices of the two numbers such that they add up to target.

Approach:
- Iterate through the list
- Use a dictionary to store seen numbers and their indices
- For each number, check if target - num exists in the dictionary

Key Points:
- Trade space for time
- Be careful with duplicate numbers

Why This Is Data-Oriented:
- Uses a lookup table (dictionary) for fast access
- Similar to matching or joining data by key
- Demonstrates space-time tradeoff common in analytics workflows
"""
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        for i in range(len(nums)):
            for j in range(i + 1, len(nums)):
                if nums[j] == target - nums[i]:
                    return [i,j]
        # Return an empty list if no solutions is found
        return []

##faster one below

class Solution:
    def twoSum(self, nums, target):
        seen = {}
        for i, num in enumerate(nums):
            if target - num in seen:
                return [seen[target - num], i]
            seen[num] = i

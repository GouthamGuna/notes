# 30 Days of JavaScript

* Learn JS Basics with 30 Qs

## To Be Or Not To Be

 Write a function expect that helps developers test their code. It should take in any value val and return an object with the following two functions.

 * toBe(val) accepts another value and returns true if the two values === each other. If they are not equal, it should throw an error "Not Equal".
 
 * notToBe(val) accepts another value and returns true if the two values !== each other. If they are equal, it should throw an error "Equal".
 
 * Example 1:

	Input: func = () => expect(5).toBe(5)
	Output: {"value": true}
	Explanation: 5 === 5 so this expression returns true.
	
* Example 2:
 
	Input: func = () => expect(5).toBe(null)
	Output: {"error": "Not Equal"}
	Explanation: 5 !== null so this expression throw the error "Not Equal".
	
* Example 3:
 
	Input: func = () => expect(5).notToBe(null)
	Output: {"value": true}
	Explanation: 5 !== null so this expression returns true
	
	# Write your Script below
	
	var expect = function(val) {
		return {
			toBe: (val2) => {
				if(val !== val2) throw new Error("Not Equal");
				else return true;
			},
			notToBe: (val2) => {
				if(val === val2) throw new Error("Equal")
				else return true;
			}
		};
	};
	
## Merge Sorted Array 

 [REF](https://github.com/GouthamGuna/typical-tasks/blob/main/experimental-lab-2024/src/main/java/in/dev/gmsk/leetcode/EasyProblems.java)
	
	# Write your Script below
	
	var merge = function(nums1, m, nums2, n) {
		for (let i = m, j = 0; j < n; i++, j++) {
			nums1[i] = nums2[j];
		}
		nums1.sort((a, b) => a - b);
	};
	
##  Apply Transform Over Each Element in Array

 Given an integer array arr and a mapping function fn, return a new array with a transformation applied to each element.

 The returned array should be created such that returnedArray[i] = fn(arr[i], i).

 Please solve it without the built-in Array.map method.
 
 * Example 1:

	Input: arr = [1,2,3], fn = function plusone(n) { return n + 1; }
	Output: [2,3,4]
	Explanation:
	const newArray = map(arr, plusone); // [2,3,4]
	The function increases each value in the array by one. 
	
	# Write your Script below
	
	var map = function(arr, fn) {
		return arr.map(fn);
	};
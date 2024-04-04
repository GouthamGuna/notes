# 30 Days of JavaScript

* Learn JS Basics with 30 Qs

## To Be Or Not To Be

 Write a function expect that helps developers test their code. It should take in any value val and return an object with the following two functions.

 toBe(val) accepts another value and returns true if the two values === each other. If they are not equal, it should throw an error "Not Equal".
 
 notToBe(val) accepts another value and returns true if the two values !== each other. If they are equal, it should throw an error "Equal".
 
 **Example_1:**

		Input: func = () => expect(5).toBe(5)
		Output: {"value": true}
		Explanation: 5 === 5 so this expression returns true.
		
 **Example_2:**
	 
		Input: func = () => expect(5).toBe(null)
		Output: {"error": "Not Equal"}
		Explanation: 5 !== null so this expression throw the error "Not Equal".
		
 **Example_3:**
	 
		Input: func = () => expect(5).notToBe(null)
		Output: {"value": true}
		Explanation: 5 !== null so this expression returns true
	
 **Solution Script below**
		
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
	
 **Solution Script below**
	
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
 
 **Example_1:**

	Input: arr = [1,2,3], fn = function plusone(n) { return n + 1; }
	Output: [2,3,4]
	Explanation:
	const newArray = map(arr, plusone); // [2,3,4]
	The function increases each value in the array by one. 
	
 **Solution Script below**
	
	var map = function(arr, fn) {
		return arr.map(fn);
	};
	
## Filter Elements from Array

 Given an integer array arr and a filtering function fn, return a filtered array filteredArr.

 The fn function takes one or two arguments:

 `arr[i] - number from the arr`
 `i - index of arr[i]`
 
 filteredArr should only contain the elements from the arr for which the expression fn(arr[i], i) evaluates to a truthy value. A truthy value is a value where `Boolean(value)` returns true.

 Please solve it without the built-in `Array.filter` method.
 
 **Example_1:**

	Input: arr = [0,10,20,30], fn = function greaterThan10(n) { return n > 10; }
	Output: [20,30]
	Explanation:
	const newArray = filter(arr, fn); // [20, 30]
	The function filters out values that are not greater than 10
	
Constraints:

 `0 <= arr.length <= 1000
 -109 <= arr[i] <= `
 
 **Solution Script below**
 
	 var filter = function(arr, fn) {

		let filteredArr = [];

		for(let i = 0; i < arr.length; i++){
			if(fn(arr[i], i)){
				filteredArr.push(arr[i])
			}
		}

		return filteredArr;
	};
	
 **OR**
		
	var filter = function(arr, fn) {

		let filteredArr = [];

		arr.forEach((e, i) => {
			let value = fn(e, i);
			if (Boolean(value)) filteredArr.push(e);
		});

		return filteredArr;
	};
	
## Array Reduce Transformation

 Given an integer array nums, a reducer function fn, and an initial value init, return the final result obtained by executing the fn function on each element of the array,
 sequentially, passing in the return value from the calculation on the preceding element.
 
 This result is achieved through the following operations:
 
 `val = fn(init, nums[0]), val = fn(val, nums[1]), val = fn(val, nums[2]), ...` 
  until every element in the array has been processed. The ultimate value of val is then returned.

  If the length of the array is 0, the function should return init.

  Please solve it without using the built-in Array.reduce method.

  **Example_1:**

	Input: 
	nums = [1,2,3,4]
	fn = function sum(accum, curr) { return accum + curr; }
	init = 0
	Output: 10
	Explanation:
	initially, the value is init=0.
	(0) + nums[0] = 1
	(1) + nums[1] = 3
	(3) + nums[2] = 6
	(6) + nums[3] = 10
	The final answer is 10.

 **Example_2:**

	Input: 
	nums = [1,2,3,4]
	fn = function sum(accum, curr) { return accum + curr * curr; }
	init = 100
	Output: 130
	Explanation:
	initially, the value is init=100.
	(100) + nums[0] * nums[0] = 101
	(101) + nums[1] * nums[1] = 105
	(105) + nums[2] * nums[2] = 114
	(114) + nums[3] * nums[3] = 130
	The final answer is 130.

 **Example_3:**

	Input: 
	nums = []
	fn = function sum(accum, curr) { return 0; }
	init = 25
	Output: 25
	Explanation: For empty arrays, the answer is always init.

 **Constraints:**

 `0 <= nums.length <= 1000`
 `0 <= nums[i] <= 1000`
 `0 <= init <= 1000`

 **Solution Script below**

	var reduce = function(nums, fn, init) {
		let val = init;
		for(let i = 0; i < nums.length; i++){
			val = fn(val, nums[i]);
		}
		return val;
	};

 **OR**
 
	var reduce = function(nums, fn, init) {
		while (nums.length) {
			init = fn(init, nums[0]);
			nums.splice(0, 1);
		}
		return init
	};

## Calculator with Method Chaining

 Input: actions = ["Calculator", "add", "subtract", "getResult"], 
 values = [10, 5, 7]
 Output: 8

	class Calculator {
    
		/** 
		* @param {number} value
		*/
		constructor(value) {
			this.result = value;
		}
		
		/** 
		* @param {number} value
		* @return {Calculator}
		*/
		add(value){
			this.result += value;
			return this;
		}
		
		/** 
		* @param {number} value
		* @return {Calculator}
		*/
		subtract(value){
			this.result -= value;
			return this;
		}
		
		/** 
		* @param {number} value
		* @return {Calculator}
		*/  
		multiply(value) {
			this.result *= value;
			return this;
		}
		
		/** 
		* @param {number} value
		* @return {Calculator}
		*/
		divide(value) {
			if (value === 0){
				throw new Error("Division by zero is not allowed");
			}
			this.result /= value;
			return this;
		}
		
		/** 
		* @param {number} value
		* @return {Calculator}
		*/
		power(value) {
			this.result **= value;
			return this;
		}
		
		/** 
		* @return {number}
		*/
		getResult() {
			return this.result;
		}
	}

 **OR**

	class Calculator {
		v = null;

		/** 
		* @param {number} value
		*/
		constructor(value) {
			this.v = value;
		}
		
		/** 
		* @param {number} value
		* @return {Calculator}
		*/
		add(value){
			this.v += value;
			return this;
		}
		
		/** 
		* @param {number} value
		* @return {Calculator}
		*/
		subtract(value){
			this.v -= value;
			return this;
		}
		
		/** 
		* @param {number} value
		* @return {Calculator}
		*/  
		multiply(value) {
			this.v *= value;
			return this;
		}
		
		/** 
		* @param {number} value
		* @return {Calculator}
		*/
		divide(value) {
			if (value === 0) {
				throw new Error("Division by zero is not allowed");
			}
			this.v /= value;
			return this;
		}
		
		/** 
		* @param {number} value
		* @return {Calculator}
		*/
		power(value) {
			this.v = Math.pow(this.v, value);
			return this;
		}
		
		/** 
		* @return {number}
		*/
		getResult() {
			return this.v;
		}
	}
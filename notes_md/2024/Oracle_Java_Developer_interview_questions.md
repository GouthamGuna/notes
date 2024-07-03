# Oracle Java Developer interview questions and tips for answering them:

1. **Core Java Concepts**:
   - Difference between method overloading and overriding
   - Thread lifecycle and handling thread sleep
   - Use of `final` keyword and `finally` block

2. **Data Structures**:
   - Arrays
   - Linked Lists
   - Stacks and Queues
   - Trees (Binary Trees, AVL Trees, B-Trees, B+ Trees)
   - Graphs
   - Hash Tables

3. **Algorithms**:
   - Sorting (e.g. quicksort, mergesort)
   - Searching (e.g. binary search)
   - Traversal algorithms (e.g. DFS, BFS)
   - Dynamic Programming
   - Detecting cycles in graphs

4. **Design and Architecture**:
   - Database schema design for employee-department relationships
   - Handling concurrent users in an application
   - Improving application performance (e.g. caching, asynchronous processing)

## Core Java Questions

1. **Explain the difference between method overloading and overriding with real-time examples.**[1]
   - Overloading allows defining multiple methods with the same name but different parameters in the same class. The JVM determines which method to call based on the method signature.
   - Overriding is when a subclass provides its own implementation of a method that is already defined in its parent class. The method must have the same name, return type, and parameters.

2. **How do you make a thread sleep?**[3]
   - Use the `Thread.sleep(milliseconds)` method to pause the execution of a thread for the specified time.

3. **What is the use of the `finally` block?**[4]
   - The `finally` block is used to execute important code, such as closing connections, that needs to run regardless of whether an exception is thrown or not.

4. **Explain the thread lifecycle in Java.**[3]
   - The main thread states are: New, Runnable, Running, Waiting, Timed Waiting, Terminated.

5. **What is the use of the `final` keyword?**[4]
   - The `final` keyword can be used to create constants, prevent method overriding, and prevent class inheritance.

## Data Structures and Algorithms

1. **Given an array `[1, 2, 5, 4, 8, 3]` and a target sum of 7, find all the subsets whose sum equals 7.**[2]
   - Use a nested loop to generate all possible subsets and check if their sum equals the target.

2. **Check if an array `array1` contains another array `array2`.**[2]
   - Iterate through `array1` and check if each element of `array2` is present in `array1`.

3. **Given a string containing Roman characters, convert it to an integer.**[1]
   - Use a map to store the values of each Roman numeral. Iterate through the string, comparing each character to the next. Add the value if the current is greater than or equal to the next, otherwise subtract.

4. **Given a 2D array, check for cyclic dependency.**[1]
   - Represent the dependencies as a graph and perform a depth-first search (DFS) to detect cycles.

## Design and Architecture

1. **Design the database schema for an employee-department relationship.**[2]
   - Create an `Employee` table with columns like `id`, `name`, `department_id`, etc.
   - Create a `Department` table with columns like `id`, `name`.
   - If an employee can belong to multiple departments, create a junction table like `EmployeeDepartment` with `employee_id` and `department_id` columns.

2. **How do you handle concurrent users in your application?**[1]
   - Use synchronization, thread pools, and non-blocking I/O to handle concurrent requests efficiently.

3. **How did you improve the performance of your application?**[1]
   - Optimize database queries, cache frequently accessed data, and use asynchronous processing for long-running tasks.

Remember to tailor your answers to your specific experience and the role you're interviewing for. Provide concrete examples whenever possible. Good luck!

Citations:
[1] https://www.glassdoor.co.in/Interview/Oracle-Java-Developer-Interview-Questions-EI_IE1737.0,6_KO7,21.htm
[2] https://www.geeksforgeeks.org/oracle-interview-experience-set-43-3-years-experienced/
[3] https://www.credosystemz.com/oracle-java-interview-questions/
[4] https://howtodoinjava.com/interview-questions/real-java-interview-questions-asked-for-oracle-enterprise-manager-project/


## DSA Problem One Explanation

 * Given an array `[1, 2, 5, 4, 8, 3]` and a target sum of 7, find all the subsets whose sum equals 7.

```
import java.util.ArrayList;
import java.util.List;

public class SubsetSum {
    public static void main(String[] args) {
        int[] arr = {1, 2, 5, 4, 8, 3};
        int targetSum = 7;
        List<List<Integer>> result = findSubsets(arr, targetSum);
        System.out.println(result);
    }

    public static List<List<Integer>> findSubsets(int[] arr, int targetSum) {
        List<List<Integer>> result = new ArrayList<>();
        findSubsetsHelper(arr, targetSum, 0, new ArrayList<>(), result);
        return result;
    }

    private static void findSubsetsHelper(int[] arr, int targetSum, int start, List<Integer> currentSubset, List<List<Integer>> result) {
        if (targetSum == 0) {
            result.add(new ArrayList<>(currentSubset));
            return;
        }

        if (targetSum < 0) {
            return;
        }

        for (int i = start; i < arr.length; i++) {
            currentSubset.add(arr[i]);
            findSubsetsHelper(arr, targetSum - arr[i], i + 1, currentSubset, result);
            currentSubset.remove(currentSubset.size() - 1);
        }
    }
}
```

## DSA Problem Two Explanation

 * Check if an array `array1` contains another array `array2`.


```
public class ArrayContains {
    public static void main(String[] args) {
        char[] array1 = {'a', 'f', 'h', 'k', 'm', 'o', 's', 'r'};
        char[] array2 = {'h', 'k', 'm', 'o'};
        
        boolean contains = containsArray(array1, array2);
        System.out.println("Array1 contains Array2: " + contains);
    }

    public static boolean containsArray(char[] array1, char[] array2) {
        int i = 0, j = 0;
        
        while (i < array1.length && j < array2.length) {
            if (array1[i] == array2[j]) {
                j++;
            }
            i++;
            
            if (j == array2.length) {
                return true;
            }
        }
        
        return false;
    }
}
```

## DSA Problem Three Explanation

 * Given a string containing Roman characters, convert it to an integer.
 * Use a map to store the values of each Roman numeral. Iterate through the string, comparing each character to the next. 
 * Add the value if the current is greater than or equal to the next, otherwise subtract.


 * Here's a Java solution to convert a Roman numeral string to an integer:

```java
import java.util.HashMap;
import java.util.Map;

public class RomanToInteger {
    public static void main(String[] args) {
        String romanNumeral = "MCMXCIV";
        int result = romanToInt(romanNumeral);
        System.out.println("Roman numeral " + romanNumeral + " is equal to " + result);
    }

    public static int romanToInt(String s) {
        Map<Character, Integer> romanMap = new HashMap<>();
        romanMap.put('I', 1);
        romanMap.put('V', 5);
        romanMap.put('X', 10);
        romanMap.put('L', 50);
        romanMap.put('C', 100);
        romanMap.put('D', 500);
        romanMap.put('M', 1000);

        int result = 0;
        for (int i = 0; i < s.length(); i++) {
            int currentValue = romanMap.get(s.charAt(i));
            if (i + 1 < s.length()) {
                int nextValue = romanMap.get(s.charAt(i + 1));
                if (currentValue < nextValue) {
                    result -= currentValue;
                } else {
                    result += currentValue;
                }
            } else {
                result += currentValue;
            }
        }
        return result;
    }
}
```

Output:
```
Roman numeral MCMXCIV is equal to 1994
```

Explanation:
1. The `romanToInt` method takes a Roman numeral string `s` as input.
2. It creates a `romanMap` HashMap to store the values of each Roman numeral character.
3. It initializes a `result` variable to store the final integer value.
4. It iterates through each character in the input string `s`:
   - It retrieves the value of the current character from the `romanMap`.
   - If there is a next character (i.e., `i + 1` is less than the length of `s`), it retrieves the value of the next character from the `romanMap`.
   - It compares the current value with the next value:
     - If the current value is less than the next value, it subtracts the current value from the `result` (e.g., IV represents 4, not 6).
     - If the current value is greater than or equal to the next value, it adds the current value to the `result`.
   - If there is no next character (i.e., `i + 1` is greater than or equal to the length of `s`), it simply adds the current value to the `result`.
5. Finally, it returns the `result`, which represents the integer value of the Roman numeral.

* The time complexity of this solution is O(n), where n is the length of the input string, as we iterate through each character once. The space complexity is O(1) since we use a constant amount of extra space for the `romanMap`.

## DSA Problem Four Explanation

 * Given a 2D array, check for cyclic dependency.
 * Represent the dependencies as a graph and perform a depth-first search (DFS) to detect cycles.
 
 To check for cyclic dependency in a 2D array, we can represent the dependencies as a graph and perform a depth-first search (DFS) to detect cycles.

Here's a Java implementation:

```java
import java.util.ArrayList;
import java.util.List;

public class CyclicDependency {
    public static void main(String[] args) {
        int[][] dependencies = {
            {0, 1},
            {1, 2},
            {2, 0},
            {3, 4},
            {4, 5},
            {5, 3}
        };

        boolean hasCycle = hasCyclicDependency(dependencies);
        System.out.println("Cyclic dependency found: " + hasCycle);
    }

    public static boolean hasCyclicDependency(int[][] dependencies) {
        List<List<Integer>> graph = buildGraph(dependencies);
        boolean[] visited = new boolean[graph.size()];
        boolean[] recStack = new boolean[graph.size()];

        for (int i = 0; i < graph.size(); i++) {
            if (dfs(i, graph, visited, recStack)) {
                return true;
            }
        }

        return false;
    }

    private static boolean dfs(int node, List<List<Integer>> graph, boolean[] visited, boolean[] recStack) {
        visited[node] = true;
        recStack[node] = true;

        for (int neighbor : graph.get(node)) {
            if (!visited[neighbor] && dfs(neighbor, graph, visited, recStack)) {
                return true;
            } else if (recStack[neighbor]) {
                return true;
            }
        }

        recStack[node] = false;
        return false;
    }

    private static List<List<Integer>> buildGraph(int[][] dependencies) {
        List<List<Integer>> graph = new ArrayList<>();
        for (int i = 0; i < dependencies.length; i++) {
            int from = dependencies[i][0];
            int to = dependencies[i][1];

            while (graph.size() <= Math.max(from, to)) {
                graph.add(new ArrayList<>());
            }

            graph.get(from).add(to);
        }
        return graph;
    }
}
```

Output:
```
Cyclic dependency found: true
```

Explanation:
1. The `buildGraph` method takes the 2D array `dependencies` as input and constructs a graph representation using an adjacency list.
2. The `hasCyclicDependency` method is the main entry point. It initializes the `visited` and `recStack` arrays, which will be used to detect cycles during the DFS traversal.
3. It then iterates through all the nodes in the graph and calls the `dfs` method for each unvisited node.
4. The `dfs` method performs a depth-first search starting from the given `node`:
   - It marks the current `node` as visited and adds it to the recursive stack (`recStack`).
   - It then recursively calls `dfs` on each neighbor of the current `node`.
   - If a neighbor is not visited, it recursively calls `dfs` on that neighbor.
   - If a neighbor is already in the recursive stack (`recStack[neighbor]` is true), it means a cycle has been detected, and the method returns `true`.
   - If all neighbors have been processed without finding a cycle, it removes the current `node` from the recursive stack (`recStack[node] = false`) and returns `false`.
5. The `hasCyclicDependency` method returns `true` if a cycle is detected during the DFS traversal, and `false` otherwise.

 * The time complexity of this solution is O(V + E), where V is the number of nodes (dependencies) and E is the number of edges (dependencies) in the graph.
 *  The space complexity is O(V) for the adjacency list representation of the graph and the `visited` and `recStack` arrays.
 
## perfect squares that sum up to a given number n.

 * To solve the problem of finding the minimum number of perfect squares that sum up to a given number n in Java 8, you can use dynamic programming. 


```java
public class PerfectSquares {
    public static int numSquares(int n) {
        int[] dp = new int[n + 1];
        Arrays.fill(dp, Integer.MAX_VALUE);
        dp[0] = 0;

        for (int i = 1; i <= n; i++) {
            int j = 1;
            while (j * j <= i) {
                dp[i] = Math.min(dp[i], dp[i - j * j] + 1);
                j++;
            }
        }

        return dp[n];
    }

    public static void main(String[] args) {
        int n = 15;
        int result = numSquares(n);
        System.out.println("The minimum number of perfect squares that sum up to " + n + " is: " + result);
    }
}
```

Output:
```
The minimum number of perfect squares that sum up to 15 is: 4
```

Explanation:
1. We create an array `dp` of size `n + 1` and initialize all the values to `Integer.MAX_VALUE`.
2. We set `dp` to 0, as the sum of no perfect squares is 0.
3. We iterate from 1 to `n` and for each `i`, we find the minimum number of perfect squares that sum up to `i`.
   - We start with `j = 1` and check if `j * j` is less than or equal to `i`.
   - If it is, we update `dp[i]` to the minimum of its current value and `dp[i - j * j] + 1`.
   - We increment `j` to check the next perfect square.
4. Finally, we return the value stored in `dp[n]`, which represents the minimum number of perfect squares that sum up to `n`.

The time complexity of this solution is O(n * sqrt(n)), as we iterate through all the numbers from 1 to `n` and for each number, we find the minimum number of perfect squares that sum up to it. The space complexity is O(n) for the `dp` array.

This solution is based on the Lagrange's Four Square Theorem, which states that every positive integer can be expressed as the sum of at most four perfect squares.

Citations:
[1] https://www.prepbytes.com/blog/java/java-program-to-check-for-the-perfect-square/
[2] https://www.edureka.co/blog/java-sqrt-method/
[3] https://stackoverflow.com/questions/36688675/square-numbers-java
[4] https://www.javatpoint.com/java-program-to-check-if-a-given-number-is-perfect-square
[5] https://www.geeksforgeeks.org/minimum-number-of-squares-whose-sum-equals-to-given-number-n/
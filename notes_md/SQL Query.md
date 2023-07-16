Intuition
Approach
Complexity

    Time complexity:

    Space complexity:

Code


# Write your MySQL query statement below
SELECT name
FROM Customer
WHERE COALESCE(referee_id,0) <> 2;

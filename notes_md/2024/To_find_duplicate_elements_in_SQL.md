#To find duplicate elements in SQL, you can use the following methods:

### Method 1: Using `DISTINCT` and `COUNT` with `GROUP BY`

```sql
SELECT column_name, COUNT(*)
FROM table_name
GROUP BY column_name
HAVING COUNT(*) > 1;
```

This method groups the rows by the specified column and counts the number of occurrences. It then filters out the groups with a count less than 2, leaving only the duplicate values.

### Method 2: Using `GROUP BY` and `HAVING` with `COUNT`

```sql
SELECT column_name
FROM table_name
GROUP BY column_name
HAVING COUNT(*) > 1;
```

This method is similar to the first one but does not include the count in the output.

### Method 3: Using `ROW_NUMBER` and `PARTITION BY`

```sql
WITH duplicate_rows AS (
    SELECT column_name, ROW_NUMBER() OVER (PARTITION BY column_name ORDER BY column_name) AS row_num
    FROM table_name
)
SELECT column_name
FROM duplicate_rows
WHERE row_num > 1;
```

This method uses a common table expression (CTE) to assign a unique row number to each row within each group of rows with the same value. It then selects the rows with a row number greater than 1, which are the duplicates.

### Method 4: Using `EXISTS` and `IN`

```sql
SELECT column_name
FROM table_name AS t1
WHERE EXISTS (
    SELECT 1
    FROM table_name AS t2
    WHERE t2.column_name = t1.column_name AND t2.id > t1.id
);
```

This method uses a subquery to check if there is another row with the same value in the table. It then selects the rows where such a row exists, which are the duplicates.

### Method 5: Using `NOT EXISTS` and `IN`

```sql
SELECT column_name
FROM table_name AS t1
WHERE NOT EXISTS (
    SELECT 1
    FROM table_name AS t2
    WHERE t2.column_name = t1.column_name AND t2.id < t1.id
);
```

This method is similar to the previous one but uses `NOT EXISTS` to select the rows where there is no other row with the same value and a smaller ID.

### Method 6: Using `NOT IN` and `IN`

```sql
SELECT column_name
FROM table_name AS t1
WHERE column_name NOT IN (
    SELECT column_name
    FROM table_name
    GROUP BY column_name
    HAVING COUNT(*) = 1
);
```

This method uses a subquery to select the unique values and then selects the rows where the value is not in that list, which are the duplicates.

These methods can be used to find duplicate elements in SQL based on different criteria and requirements.

Citations:
[1] https://www.sqlshack.com/finding-duplicates-in-sql/
[2] https://stackoverflow.com/questions/2594829/finding-duplicate-values-in-a-sql-table/67821150
[3] https://learnsql.com/cookbook/how-to-find-duplicate-rows-in-sql/
[4] https://www.linkedin.com/pulse/how-find-duplicates-table-using-sql-learnsql-com
[5] https://www.atlassian.com/data/sql/how-to-find-duplicate-values-in-a-sql-table
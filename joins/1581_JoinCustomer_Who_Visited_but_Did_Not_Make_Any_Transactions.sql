/*1581. Customer Who Visited but Did Not Make Any Transactions

Topics-join

Table: Visits

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| visit_id    | int     |
| customer_id | int     |
+-------------+---------+
visit_id is the column with unique values for this table.
This table contains information about the customers who visited the mall.
 

Table: Transactions

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| transaction_id | int     |
| visit_id       | int     |
| amount         | int     |
+----------------+---------+
transaction_id is column with unique values for this table.
This table contains information about the transactions made during the visit_id.
 

Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.

Return the result table sorted in any order.

The result format is in the following example.

 

Example 1:

Input: 
Visits
+----------+-------------+
| visit_id | customer_id |
+----------+-------------+
| 1        | 23          |
| 2        | 9           |
| 4        | 30          |
| 5        | 54          |
| 6        | 96          |
| 7        | 54          |
| 8        | 54          |
+----------+-------------+
Transactions
+----------------+----------+--------+
| transaction_id | visit_id | amount |
+----------------+----------+--------+
| 2              | 5        | 310    |
| 3              | 5        | 300    |
| 9              | 5        | 200    |
| 12             | 1        | 910    |
| 13             | 2        | 970    |
+----------------+----------+--------+
Output: 
+-------------+----------------+
| customer_id | count_no_trans |
+-------------+----------------+
| 54          | 2              |
| 30          | 1              |
| 96          | 1              |
+-------------+----------------+
Explanation: 
Customer with id = 23 visited the mall once and made one transaction during the visit with id = 12.
Customer with id = 9 visited the mall once and made one transaction during the visit with id = 13.
Customer with id = 30 visited the mall once and did not make any transactions.
Customer with id = 54 visited the mall three times. During 2 visits they did not make any transactions, and during one visit they made 3 transactions.
Customer with id = 96 visited the mall once and did not make any transactions.
As we can see, users with IDs 30 and 96 visited the mall one time without making any transactions. Also, user 54 visited the mall twice and did not make any transactions.*/

# Write your MySQL query statement below
SELECT customer_id, COUNT(*) AS count_no_trans
FROM Visits
WHERE visit_id NOT IN (SELECT visit_id FROM Transactions)
GROUP BY customer_id;


/*
Solution:
SELECT V.customer_id, COUNT(V.visit_id) AS count_no_trans
FROM Visits V
LEFT JOIN Transactions T ON V.visit_id = T.visit_id
WHERE T.transaction_id IS NULL
GROUP BY V.customer_id;


SELECT V.customer_id, COUNT(V.visit_id) AS count_no_trans: In this part of the query, you specify the columns you want to retrieve in the result. You select the customer_id column from the Visits table and calculate the count of visit_id for each customer who visited without making transactions. You give this count an alias count_no_trans.
FROM Visits V: Here, you specify the source table, which is the Visits table. This is where you have information about customer visits.
LEFT JOIN Transactions T ON V.visit_id = T.visit_id: This is the crucial part of the query. You perform a LEFT JOIN between the Visits table (aliased as V) and the Transactions table (aliased as T) based on the visit_id column. This allows you to match visits with transactions. The LEFT JOIN ensures that all visits are included in the result, even if there are no corresponding transactions.
WHERE T.transaction_id IS NULL: In this part, you filter the results to exclude rows where there is a transaction (transaction_id is not NULL). This is how you identify visits without transactions.
GROUP BY V.customer_id: Finally, you group the results by customer_id. This is necessary because you want to count the number of times each customer visited without making transactions.
The result of this query is a table that shows the customer_id and the count of visits without transactions for each customer.*/

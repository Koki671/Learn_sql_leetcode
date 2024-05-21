/*1683. Invalid Tweets

Topics-select

Table: Tweets

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| tweet_id       | int     |
| content        | varchar |
+----------------+---------+
tweet_id is the primary key (column with unique values) for this table.
This table contains all the tweets in a social media app.
 

Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Tweets table:
+----------+----------------------------------+
| tweet_id | content                          |
+----------+----------------------------------+
| 1        | Vote for Biden                   |
| 2        | Let us make America great again! |
+----------+----------------------------------+
Output: 
+----------+
| tweet_id |
+----------+
| 2        |
+----------+
Explanation: 
Tweet 1 has length = 14. It is a valid tweet.
Tweet 2 has length = 32. It is an invalid tweet.

*/


select tweet_id 
from Tweets
where length(content) > 15;



/*solution:
Source Code 1
The first solution uses the LEN function to calculate the length of the tweet content:
SELECT tweet_id
FROM Tweets
WHERE LEN(content) > 15
This code's runtime is 1953ms, beating 19.62% of other submissions. Here's the performance snapshot:
s1

Source Code 2
The second solution differs from the first by using the DATALENGTH function instead of LEN:
SELECT tweet_id
FROM Tweets
WHERE DATALENGTH(content) > 15
This solution's runtime is 1522ms, beating 66.57% of other submissions. Here's the performance snapshot:
s2

Conclusion
These two solutions effectively determine the invalid tweets based on the content length, with the second solution performing significantly better on LeetCode. However, performance may vary in real-world RDMS due to different factors, such as data volume, system hardware, SQL server configurations, etc.

Here's a ranking of these solutions based on LeetCode performance:

Source Code 2
Source Code 1

count number of columns 
select count(*) as rename



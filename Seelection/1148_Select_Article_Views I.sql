/*1148. Article Views I
Topics - select

Table: Views

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| article_id    | int     |
| author_id     | int     |
| viewer_id     | int     |
| view_date     | date    |
+---------------+---------+
There is no primary key (column with unique values) for this table, the table may have duplicate rows.
Each row of this table indicates that some viewer viewed an article (written by some author) on some date. 
Note that equal author_id and viewer_id indicate the same person.
 

Write a solution to find all the authors that viewed at least one of their own articles.

Return the result table sorted by id in ascending order.

The result format is in the following example.

 

Example 1:

Input: 
Views table:
+------------+-----------+-----------+------------+
| article_id | author_id | viewer_id | view_date  |
+------------+-----------+-----------+------------+
| 1          | 3         | 5         | 2019-08-01 |
| 1          | 3         | 6         | 2019-08-02 |
| 2          | 7         | 7         | 2019-08-01 |
| 2          | 7         | 6         | 2019-08-02 |
| 4          | 7         | 1         | 2019-07-22 |
| 3          | 4         | 4         | 2019-07-21 |
| 3          | 4         | 4         | 2019-07-21 |
+------------+-----------+-----------+------------+
Output: 
+------+
| id   |
+------+
| 4    |
| 7    |
+------+

*/
--Write your MySQL query statement below
select distinct author_id as id 
from Views 
where author_id = viewer_id 
order by author_id;


/*Solution:
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id ASC;
SELECT DISTINCT author_id AS id: This part of the query selects the author_id from the Views table. You use DISTINCT to ensure that each author_id appears only once in the result set. Additionally, you alias the author_id as id to match the desired output format.
FROM Views: Here, you specify the table from which you want to select data, which is the Views table in this case.
WHERE author_id = viewer_id: This is the critical part of the query where you filter the rows. You're only interested in rows where the author_id is equal to the viewer_id, which means the author has viewed their own article.
ORDER BY id ASC: Finally, you sort the result set in ascending order based on the id. This step ensures that the result is sorted as per the problem's requirements.
The result of this query is a list of distinct authors who have viewed at least one of their own articles. By comparing author_id and viewer_id, you identify cases where the author and viewer are the same person, indicating self-viewed articles.*/




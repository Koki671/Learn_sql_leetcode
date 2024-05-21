/*595. Big Countries

SQL Schema
Pandas Schema
Table: World

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| name        | varchar |
| continent   | varchar |
| area        | int     |
| population  | int     |
| gdp         | bigint  |
+-------------+---------+
name is the primary key (column with unique values) for this table.
Each row of this table gives information about the name of a country, the continent to which it belongs, its area, the population, and its GDP value.
 

A country is big if:

it has an area of at least three million (i.e., 3000000 km2), or
it has a population of at least twenty-five million (i.e., 25000000).
Write a solution to find the name, population, and area of the big countries.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
World table:
+-------------+-----------+---------+------------+--------------+
| name        | continent | area    | population | gdp          |
+-------------+-----------+---------+------------+--------------+
| Afghanistan | Asia      | 652230  | 25500100   | 20343000000  |
| Albania     | Europe    | 28748   | 2831741    | 12960000000  |
| Algeria     | Africa    | 2381741 | 37100000   | 188681000000 |
| Andorra     | Europe    | 468     | 78115      | 3712000000   |
| Angola      | Africa    | 1246700 | 20609294   | 100990000000 |
+-------------+-----------+---------+------------+--------------+
Output: 
+-------------+------------+---------+
| name        | population | area    |
+-------------+------------+---------+
| Afghanistan | 25500100   | 652230  |
| Algeria     | 37100000   | 2381741 |
+-------------+------------+---------+

*/

--Write your MySQL query statement below

select name, population, area 
from World 
where area >= 3000000 or population >= 25000000


/* solution:
Approach: Filtering rows
Intuition
name	continent	area	population	gdp
Afghanistan	Asia	652230	25500100	20343000000
Albania	Europe	28748	2831741	12960000000
Algeria	Africa	2381741	37100000	188681000000
Andorra	Europe	468	78115	3712000000
Angola	Africa	1246700	20609294	100990000000

To determine whether a country is considered `big`, there are two conditions to verify, as stated in the description:
The country must have an area of at least three million square kilometers, denoted as area >= 3,000,000.

The population of the country should be a minimum of twenty-five million, expressed as population >= 25,000,000.

Algorithm
First, we apply row filtering to identify the countries that satisfy the conditions.

    df = world[(world['area'] >= 3000000) | (world['population'] >= 25000000)]
This step filters out the rows representing countries that do not meet the conditions, leaving the remaining table as follows.

name	continent	area	population	gdp
Afghanistan	Asia	652230	25500100	20343000000
Algeria	Africa	2381741	37100000	188681000000

Noting that the table has five columns, we need to return three columns according to the requirements of the problem. Thus the next step is returning the three required columns with the relative order as: name, population, and area.

    df = df[['name', 'population', 'area']]
name	population	area
Afghanistan	25500100	652230
Algeria	37100000	2381741

Implementation

import pandas as pd

def big_countries(world: pd.DataFrame) -> pd.DataFrame:
    df = world[(world['area'] >= 3000000) | (world['population'] >= 25000000)]
    return df[['name', 'population', 'area']]


database
Approach: Filtering rows using WHERE
Algorithm
To determine whether a country is considered big, there are two conditions to verify, as stated in the description:

The country must have an area of at least three million square kilometers, denoted as area >= 3,000,000.

The population of the country should be a minimum of twenty-five million, expressed as population >= 25,000,000.

SELECT 
    * 
FROM 
    world 
WHERE 
    area >= 3000000 
    OR population >= 25000000

Noting that we need to return three columns according to the requirements of the problem. Thus the next step is selecting the three required columns with the relative order as: name, population, and area. The complete answer is as follows.

SELECT
    name, population, area
FROM
    world
WHERE
    area >= 3000000 OR population >= 25000000
;

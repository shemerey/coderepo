-- https://leetcode.com/problems/delete-duplicate-emails/
--
-- Write a SQL query to delete all duplicate email entries in a table named
-- Person, keeping only unique emails based on its smallest Id.
--
--     +----+------------------+
--     | Id | Email            |
--     +----+------------------+
--     | 1  | john@example.com |
--     | 2  | bob@example.com  |
--     | 3  | john@example.com |
--     +----+------------------+
--
-- For example, after running your query, the above Person table should have
-- the following rows:
--
--     +----+------------------+
--     | Id | Email            |
--     +----+------------------+
--     | 1  | john@example.com |
--     | 2  | bob@example.com  |
--     +----+------------------+


DELETE FROM Person
 WHERE Id NOT IN (SELECT s.SmallestId
                    FROM (SELECT MIN(Id) AS SmallestId
                            FROM Person
                        GROUP BY Email
                    ) AS s
                 );

/*
You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.

Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.

Sample Output

1 Leaf
2 Inner
3 Leaf
5 Root
6 Leaf
8 Inner
9 Leaf

*/

DECLARE @BST AS TABLE(N INT, P INT);

INSERT INTO @BST (N, P) VALUES (1, 2), (3, 2), (5, 6), (7, 6), (2, 4), (6, 4), (4, 15), (8, 9), (10, 9), (12, 13), (14, 13), (9, 11), (13, 11), (11, 15)

;WITH CheckNodes AS
    (
    SELECT
    COUNT(n0.N) AS RChild
    ,n1.N AS Node
    ,COUNT(n2.N) AS RParent
    FROM @BST AS n1
    FULL JOIN @BST AS n2
        ON n2.N = n1.P
    FULL JOIN @BST AS n0 
        ON n1.N = n0.P
    WHERE n1.N IS NOT NULL
    GROUP BY n1.N
    )
    
SELECT 
    CN.Node
    ,CASE
        WHEN CN.RParent = 0 AND CN.RChild > 0 THEN 'Root'
        WHEN CN.RParent > 0 AND CN.RChild > 0 THEN 'Inner'
        WHEN CN.RParent > 0 AND CN.RChild = 0 THEN 'Leaf'
    END
FROM CheckNodes AS CN
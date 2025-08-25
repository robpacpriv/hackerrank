/*
P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

* * * * * 
* * * * 
* * * 
* * 
* 

Write a query to print the pattern P(20).
*/


DECLARE @P INT = 0
DECLARE @i INT = 20

WHILE (@i > @P)
    BEGIN
        SELECT REPLICATE('* ',@i)
        
        SET @i = @i - 1
    END
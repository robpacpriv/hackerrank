/*

Write a query to print all prime numbers less than or equal to 1000.
Print your result on a single line, and use the ampersand (&) character as your separator (instead of a space).

For example, the output for all prime numbers <= 10  would be: 2&3&5&7

*/

DECLARE @P INT = 1000
DECLARE @i INT = 1
DECLARE @modulo INT = 0

DECLARE @i2 INT = 1

DECLARE @string VARCHAR(max) = ''

WHILE (@i <= @P)
    BEGIN

		SET @modulo = 0

		SET @i2 = 1

		WHILE (@i2 <= @i)
			BEGIN
				IF (@i%@i2 < 1) SET @modulo = @modulo + 1

				--select '@i: ' + cast(@i as VARCHAR(10)) + ', @i2: ' + cast(@i2 as VARCHAR(10)) + ', @modulo: ' + cast(@modulo as VARCHAR(10))
				SET @i2 = @i2 + 1
			END

			IF (@modulo = 2 AND @i > 2) SET @string = @string + '&' + cast(@i AS VARCHAR(10))
			IF (@modulo = 2 AND @i = 2) SET @string = @string + cast(@i AS VARCHAR(10))

			--select '@i: ' + cast(@i as VARCHAR(10))
        
        SET @i = @i + 1
    END

PRINT @string

---------------------------------------------------------
--secound solution:
---------------------------------------------------------

DECLARE @P INT = 1000

;WITH allnumbers AS
(
    SELECT
        2 AS allnum
    UNION ALL
    SELECT
        allnum + 1 AS allnum
    FROM allnumbers 
WHERE allnum < @P
)
, onlyprimes AS 
(
    SELECT
        allnum
    FROM allnumbers AS a1
    WHERE NOT EXISTS (SELECT 1 FROM allnumbers AS a2 WHERE a2.allnum < a1.allnum and a1.allnum%a2.allnum = 0)
)

SELECT
	STRING_AGG(CAST(allnum AS VARCHAR), '&')
FROM onlyprimes OPTION (MAXRECURSION 0);

/*
Consider P1(a,c) and P2 (b,d  to be two points on a 2D plane where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.

Query the Euclidean Distance between points P1 and P2  and format your answer to display  decimal digits.

https://www.hackerrank.com/challenges/weather-observation-station-19/problem

*/

SELECT
    --a: min(LAT_N)
    --c: min(LONG_W)
    
    --b: max(LAT_N)
    --d: max(LONG_W)
    CAST(
        SQRT(
            POWER(ABS(MIN(LAT_N) - MAX(LAT_N)),2) + POWER(ABS(MIN(LONG_W) - MAX(LONG_W)),2)
            )
        AS DECIMAL(10,4)
        )
FROM STATION
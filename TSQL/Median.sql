/*
https://en.wikipedia.org/wiki/Median

A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.

https://www.hackerrank.com/challenges/weather-observation-station-20/problem

*/

SELECT
CAST (
    (
    (SELECT MAX(LAT_N) FROM (SELECT top 50 percent LAT_N FROM STATION ORDER BY LAT_N ASC) AS max)
    + (SELECT MIN(LAT_N) FROM (SELECT top 50 percent LAT_N FROM STATION ORDER BY LAT_N DESC) AS min)
    ) / 2
 AS DECIMAL(10,4))
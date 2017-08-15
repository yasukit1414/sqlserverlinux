SELECT datepart(minute,ts) As dategroup,Count(*)
 FROM expresslog
WHERE ts BETWEEN '2016-6-26 00:34:51.00' And '2016-6-26 02:34:51.00'
GROUP BY datepart(minute,ts) 
ORDER BY dategroup
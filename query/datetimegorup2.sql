SELECT
        CONVERT(NVARCHAR, ts, 111) AS 'access_date_char_yyyymmdd'
      , DATEPART ( hour , ts ) as access_date_hour
      ,count(*) as 'icount'
  FROM expresslog
group by
        CONVERT(NVARCHAR, ts, 111) 
      , DATEPART ( hour , ts ) 
order by access_date_char_yyyymmdd,access_date_hour
select datepart(hour,ts) as h,datepart(minute,ts) as m,avg(velocity)
 from expresslog
group by datepart(hour,ts),datepart(minute,ts)
order by h,m

select floor(velocity/10)*10 as x, count(*)
 from expresslog
group by floor(velocity/10)*10
order by floor(velocity/10)*10

DECLARE @Location geography
set @Location=geography::STGeomFromText('POINT(135.757800 34.985460)',4326)
select avg(velocity),floor(@Location.STDistance(geo)/5000)*5000 as distance from expresslog
where @Location.STDistance(geo) < 1000000 
group by floor(@Location.STDistance(geo)/5000)
order by distance


DECLARE @Location geometry
set @Location=geometry::STGeomFromText('POINT(135.757800 34.985460)',4326)
select @Location.STWithin((select ogr_geometry from japan_ver81)) 

SET @geom = GEOMETRY::STGeomFromText(@geo.STAsText(),@geo.STSrid);
SET @geo = GEOGRAPHY::STGeomFromText(@geom.STAsText(),@geom.STSrid);




with maxgeo(geo_express)
as
(
select velocity,geo.STAsText() from expresslog
where velocity= (select max(velocity) from expresslog)
)



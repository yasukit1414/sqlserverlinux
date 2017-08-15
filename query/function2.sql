CREATE FUNCTION IS_Within_japan_ver81_2
(
@param1 geography
)
RETURNS int
AS
BEGIN
DECLARE @ret int;
DECLARE @h geometry;
DECLARE @l geometry;
DECLARE @num int;
DECLARE @id int;
DECLARE @num_max int;
DECLARE @ret2 int;

select @l=GEOMETRY::STGeomFromText(@param1.STAsText(),0) 
set @num = 0
select @num_max=max(ogr_fid) from japan_ver81

WHILE @num <= @num_max
BEGIN
	select @id=ogr_fid ,@h=ogr_geometry from japan_ver81 where ogr_fid=@num
	set @ret2=@l.STWithin(@h) 	
	set @ret=@id
	if @ret2=1 break;
	set @num=@num+1
END
RETURN @ret
END 


drop function dbo.IS_Within_japan_ver81_2

select dbo.IS_Within_japan_ver81_2((select geo from expresslog where dataID=300))

select geo.STAsText(),geo.STSrid from expresslog where dataID=1187

select * from japan_ver81 where ogr_fid=1187 or ogr_fid=1165 or ogr_fid=1159 or ogr_fid=1167 or ogr_fid=1162


DECLARE @g geometry;
DECLARE @h geometry;
SET @g = geometry::STGeomFromText('POLYGON((0 0, 2 0, 2 2, 0 2, 0 0))', 0);
SET @h = geometry::STGeomFromText('POINT(1 1)', 0);
SELECT @h.STWithin(@g);

select * from geotable
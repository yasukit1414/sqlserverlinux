CREATE FUNCTION IS_Within_japan_ver81
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

select @l=GEOMETRY::STGeomFromText(@param1.STAsText(),@param1.STSrid) 

DECLARE crOgrList CURSOR FOR
select ogr_fid as id, ogr_geometry as h from japan_ver81 where ogr_fid=2

OPEN crOgrList;

FETCH NEXT FROM crOgrList
INTO @id,@h

WHILE @@FETCH_STATUS = 0
BEGIN
	set @num=@l.STWithin(@h) 
	set @ret=@id
	IF @num=1 BREAK
END;
CLOSE crOgrList
DEALLOCATE crOgrList
IF (@ret IS NULL)
	SET @ret = 0
RETURN @ret
END 


drop function dbo.IS_Within_japan_ver81

select dbo.IS_Within_japan_ver81((select geo from expresslog where dataID=2))


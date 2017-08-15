CREATE PROCEDURE IS_Within_japan_ver81_3
AS
BEGIN

	DECLARE @geog geography;
	DECLARE @geom geometry;
	DECLARE @num int;
	DECLARE @id int;
	DECLARE @num_max int;

	select @num_max=max(dataID) from expresslog

	set @num=0
	WHILE @num <= @num_max
	BEGIN
		select @geog=geo from expresslog where dataID=@num
		set @id=dbo.IS_Within_japan_ver81_2(@geog)
		select @geom=ogr_geometry, @id=ogr_fid from japan_ver81 where ogr_fid=@id

		insert into geotable(id,geom) values(@id,@geom)
		set @num=@num+1

	END
END 

exec IS_Within_japan_ver81_3

select * from geotable

drop PROCEDURE IS_Within_japan_ver81_3
create table geotable
(
id int,
geom geometry
) on GeoFG
Alter database tempdb modify file(name =tempdev, filename='/var/opt/mssql/data/tempdb01.mdf', SIZE = 250MB, FILEGROWTH= 50MB)
GO
 
Alter database tempdb add file(name =tempgeo02, filename='/var/opt/mssql/data/tempdb02.ndf', SIZE = 250MB, FILEGROWTH= 50MB)
GO

Alter database tempdb add file(name =tempgeo03, filename='/var/opt/mssql/data/tempdb03.ndf', SIZE = 250MB, FILEGROWTH= 50MB)
GO

Alter database tempdb add file(name =tempgeo04, filename='/var/opt/mssql/data/tempdb04.ndf', SIZE = 250MB, FILEGROWTH= 50MB)
GO
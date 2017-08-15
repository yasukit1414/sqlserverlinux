CREATE DATABASE GeoTest ON  PRIMARY 
( NAME = 'geo_file0', FILENAME = '/var/opt/mssql/data/geo_file0.mdf' , SIZE = 100MB , FILEGROWTH = 0 ),
Filegroup  GeoFG
( NAME = 'geo_file1' , FILENAME = '/var/opt/mssql/data/geo_file1.ndf' , SIZE = 1GB ,  FILEGROWTH = 0 ),
( NAME = 'geo_file2' , FILENAME = '/var/opt/mssql/data/geo_file2.ndf' , SIZE = 1GB ,  FILEGROWTH = 0 ),
( NAME = 'geo_file3' , FILENAME = '/var/opt/mssql/data/geo_file3.ndf' , SIZE = 1GB ,  FILEGROWTH = 0 ),
( NAME = 'geo_file4' , FILENAME = '/var/opt/mssql/data/geo_file4.ndf' , SIZE = 1GB ,  FILEGROWTH = 0 )
LOG ON
( NAME = 'geo_log1' , FILENAME = '/var/opt/mssql/data/geo_log1.ldf' , SIZE = 1GB , MAXSIZE = 10GB , FILEGROWTH = 50 )
GO

ALTER DATABASE  GeoTest
MODIFY FILEGROUP GeoFG
DEFAULT
GO
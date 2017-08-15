import pyodbc
server = 'localhost'
database = 'GeoTest'
username = 'sa'
password = ''

cnxn = pyodbc.connect('DRIVER={ODBC Driver 13 for SQL Server};SERVER='+server+';PORT=1443;DATABASE='+database+';UID='+username+';PWD='+ password)
cursor = cnxn.cursor()
fh = open('./log.csv')

for line in fh.readlines():
	tmp_string0=line.rstrip("\r\n")
	tmp_string=tmp_string0.split(",")
	tsql= "insert into expresslog(geo,ts,velocity,x,y,z,rx ,ry ,rz) values (geography::STGeomFromText('POINT("+tmp_string[1]+" "+tmp_string[0]+")',4326)" +","+"'"+tmp_string[2]+"'"+","+tmp_string[3]+","+tmp_string[4]+","+tmp_string[5]+","+tmp_string[6]+","+tmp_string[7]+","+tmp_string[8]+","+tmp_string[9]+")"

        print ('Inserting a new row into table')
        with cursor.execute(tsql):
             print ('Successfuly Inserted!')

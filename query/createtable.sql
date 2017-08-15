CREATE TABLE expresslog 
(  
    dataID int IDENTITY(1,1)
    ,geo geography 
    ,ts datetime
    ,velocity float 
    ,x int 
    ,y int 
    ,z int  
    ,rx int  
    ,ry int  
    ,rz int
) ON GeoFG; 
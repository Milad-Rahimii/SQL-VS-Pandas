Drop Table IF Exists Table1;
GO
Create Table Table1 (
Id int,
[FirstName] Varchar (10)
)
GO
Insert Into Table1 Values
(1 , 'Ali'),
(2 , 'sara'),
(3, 'Milad')

Select * From Table1


-----------
Drop Table If Exists Table1;
GO
Create Table Table1 (
Id  int,
[FirstName] Varchar(10)
)
GO
Insert Into Table1 Values
(1 , 'Ali'),
(2 , 'sara'),
(3, 'Milad')

Select [FirstName] From  Table1


---------
Drop Table If Exists Table1;
GO
Create Table Table1 (
Id  int,
FirstName Varchar(10),
LastName Varchar(10),
)
GO
Insert Into Table1 Values
(1 , 'Ali','Ahmadi'),
(2 , 'sara', 'Mohseni'),
(3, 'Milad','Rahmati')

Select FirstName, LastName From  Table1
-----------

Drop Table If Exists Table1;
GO
Create Table Table1 (
Id  int,
FirstName Varchar(10)
)
GO

Insert Into Table1 Values
(1 , 'Ali'),
(2 , 'Sara'),
(3, 'Milad')

Select *  From  Table1
Where Id=2


-----

Drop Table If Exists Table1;
GO

Create Table Table1(
Id  int,
FirstName Varchar(10)
)
 
Insert Into Table1 Values
(1 , 'Ali'),
(2 , 'Sara'),
(3, 'Milad')

Select Top 2 * From  Table1


-----  distinct
Drop Table If Exists Table1;
GO

Create Table Table1(
Id  int,
FirstName Varchar(10),
LastName Varchar(10)
)
GO
Insert Into Table1 Values
(1 , 'Ali','Ahmadi'),
(2 , 'Sara','Mohseni'),
(1, 'Ali','Rahmati')

Select *From  Table1

Select Distinct ID, FirstName From table1

-----  count of distinct
Drop Table Table1
GO
Create Table Table1(
Id  int,
FirstName Varchar(10)
)
GO 
Insert Into Table1 Values
(1 , 'Ali'),
(2 , 'Sara'),
(3, 'Milad'),
(1,'Banafshe')

Select * From Table1
GO
Select Count(Distinct Id) Id_CNT
From  Table1

---------- descriptive stat
Drop Table If Exists Table1
GO
Create Table Table1(
FirstName Varchar(10),
Age Int)
GO
Insert Into Table1 Values
('Ali', 18),('sara', 15),
('Milad', 20),('Banafshe', 19)
GO
;With tmp as (
Select Count(*) as [Count]
, Avg(Age)  As Mean ,STDEV(Age) As std
, min(Age) as [Min], MAx(Age) as [Max]
From Table1
)
Select distinct tmp.*,
PERCENTILE_CONT(.25) Within Group (order By Age ) Over() As [25%]
,PERCENTILE_CONT(.5) Within Group (order By Age ) Over() As [50%]
,PERCENTILE_CONT(.75) Within Group (order By Age ) Over() As [75%]
From Table1
cross join tmp


--------- single group by 

  Drop table Table1
  GO
  Create Table Table1(
  Gender  Varchar(1),
  [Population]  Int
  )
  GO
  Insert Into Table1 Values
  ('M', 5),('F', 1),('F', 7),('M', 4)
  
  Select * From Table1
  
  Select Gender, Sum([Population]) as [Population]
  From  Table1
  Group By Gender

----  SORT BY SINGLE COLUMN

DROP TABLE IF EXISTS Table1;
GO

  Create Table Table1(
  ID  Int,
  [FirstName]  Varchar(10),
  Age Int
  )
  GO
  Insert Into Table1 Values
  (5,'Ali', 20),(8,'Sara', 25),
  (1,'Banafshe', 27),(3,'Milad', 18)
  
  Select * From Table1 
  Order by Id

------------ SORT BY MULTIPLE COLUMN

  DROP TABLE IF EXISTS Table1;
  GO
  Create Table Table1(
  ID  Int,
  [FirstName]  Varchar(10),
  Age Int
  )
  GO 
  Insert Into Table1 Values
  (5,'Ali', 20),(8,'Sara', 25),
  (1,'Banafshe', 27),(1,'Milad', 18)
  
  Select * From Table1 
  Order by Id, [FirstName]

----------- COUNT OF UNIQUE VALUES

  DROP TABLE IF EXISTS Table1;
  GO
  Create Table Table1(
  [FirstName]  Varchar(10),
  Age Int
  )
  GO
  Insert Into Table1 Values
  ('Ali', 20),('Sara', 25),
  ('Banafshe', 27),('Milad', 18),('Banafshe', 25)
  
  Select [FirstName] , Age, Count(*) From Table1 
  Group By [FirstName], Age
  
  Select [FirstName], Count(*) From Table1 
  Group By [FirstName]

------------ DROP ROW - ALL COLUMNS DUPLICATED

 DROP TABLE IF EXISTS Table1;
 GO
 Create Table Table1(
 ID  Int,
 [FirstName]  Varchar(10)
 )
 GO
 Insert Into Table1 Values
 (1,'Ali'),(2,'Sara'),
 (3,'Banafshe'),(1,'Ali')

 Select * From Table1 

 Select Distinct * From Table1 

----------  DROP ROW - KEY COLUMN DUPLICATED

  DROP TABLE IF EXISTS Table1;
  GO
  Create Table Table1(
  ID  Int,
  [FirstName]  Varchar(10)
  ) 
  Insert Into Table1 Values
  (1,'Ali'),(2,'Sara'),(3,'Banafshe'),(4,'Milad')
  
  SELECT * FROM Table1
  
  ;With CTE AS (
  Select ID , [FirstName] 
  , DupRank = ROW_NUMBER() OVER (
                PARTITION BY ID
                ORDER BY (SELECT NULL)
  			  )
   
  From Table1 
  ) 
  Delete From CTE Where DupRank>1
  
  Select  * From Table1 

--------------- 

----------  Inner Join

DROP TABLE IF EXISTS Table1;
DROP TABLE IF EXISTS Table2;
GO
Create Table Table1(
ID  Int,
[FirstName]  Varchar(10)
)
GO
Create Table Table2(
ID  Int,
Age  Int
)
 
Insert Into Table1 Values
(1,'Ali'), (2,'Sara'), (3,'Milad')

Insert Into Table2 Values
(1,10) ,(2, 20),(4, 40)


Select t1.Id, FirstName, Age From Table1  t1
Inner Join  Table2  t2 on t1.Id=t2.ID

Select t1.Id, FirstName, Age From Table1  t1
Left Join  Table2  t2 on t1.Id=t2.ID

Select t2.Id, FirstName, Age From Table1  t1
Right Join  Table2  t2 on t1.Id=t2.ID

---------------  Full Join

Select Coalesce ( t1.id, t2.Id) AS Id, Name, Age From Table1  t1
Full Join  Table2  t2 on t1.Id=t2.ID

---------- Cross
DROP TABLE IF EXISTS Table1;
DROP TABLE IF EXISTS Table2;
GO
Create Table Table1(
ID  Int,
[FirstName]  Varchar(10)
)
GO
Create Table Table2(
ID  Int,
Age  Int
)
GO
Insert Into Table1 Values
(1,'Ali'), (2,'Sara')

Insert Into Table2 Values
(1,10) ,(2, 20)

Select * From Table1
Cross Join Table2

-------- Union All By Single Column

  DROP TABLE IF EXISTS Table1;
  DROP TABLE IF EXISTS Table2;
  GO
  Create Table Table1(
  ID  Int, [FirstName]  Varchar(10)
  )
  GO
  Create Table Table2(
  ID  Int, [FirstName]  Varchar(10)
  )
  GO 
  Insert Into Table1 Values (1,'Ali'), (2,'Sara')
  
  Insert Into Table2 Values (1,'Milad'), (3,'Banafshe')
  
  Select FirstName From Table1
  Union All
  Select FirstName From Table2

--------- UNION ALL BY ALL COLUMNS

  DROP TABLE IF EXISTS Table1;
  DROP TABLE IF EXISTS Table2;
  GO
  Create Table Table1(
  ID  Int, [FirstName]  Varchar(10)
  )
  GO
  Create Table Table2(
  ID  Int, [FirstName]  Varchar(10)
  )
  GO 
  Insert Into Table1 Values (1,'Ali'), (2,'Sara')
  
  Insert Into Table2 Values (1,'Milad'), (3,'Banafshe')

  Select * From Table1
  Union All
  Select * From Table2
  
-----------

-------- Union  By Single Column

  DROP TABLE IF EXISTS Table1;
  DROP TABLE IF EXISTS Table2;
  
  Create Table Table1(
  ID  Int, [FirstName]  Varchar(10)
  )
  
  Create Table Table2(
  ID  Int, [FirstName]  Varchar(10)
  )
   
  Insert Into Table1 Values (1,'Ali'), (2,'Sara')
  
  Insert Into Table2 Values (1,'ALi'), (3,'Maryam')
  
  Select FirstName From Table1
  Union 
  Select FirstName From Table2

------------ UNION BY ALL COLUMNS

  DROP TABLE IF EXISTS Table1;
  DROP TABLE IF EXISTS Table2;
  GO
  Create Table Table1(
  ID  Int, [FirstName]  Varchar(10)
  )
  
  Create Table Table2(
  ID  Int, [FirstName]  Varchar(10)
  )
  GO 
  Insert Into Table1 Values (1,'Ali'), (2,'Sara')
  
  Insert Into Table2 Values (1,'ALi'), (3,'Maryam')

  Select * From Table1
  Union 
  Select * From Table2

----------  Add Single Column
  DROP TABLE IF EXISTS Table1;
  GO
  Create Table Table1(
  ID  Int,
  [FirstName]  Varchar(10)
  )
  GO
  Insert Into Table1 Values
  (1,'Ali'), (2,'Hasan'), (3,'Maryam')
  GO
  Alter Table Table1
  Add  Age Int
  GO
  
  Update Table1 Set Age =25 Where Id=1
  Update Table1 Set Age =24 Where Id=2
  Update Table1 Set Age =20 Where Id=3
  
  Select * From Table1
  
-------- Drop Single Columns

DROP TABLE IF EXISTS Table1;
GO
Create Table Table1(
ID  Int,
[FirstName]  Varchar(10),
Age Int
)
GO
Insert Into Table1 Values
(1,'ALi', 25), (2,'Hasan', 24), (3,'Maryam', 20)
GO
Alter Table Table1 
Drop Column Age
GO
Select * from table1

-------- Drop Multiple Columns
DROP TABLE IF EXISTS Table1;
GO
Create Table Table1(
ID  Int,
[FirstName]  Varchar(10),
Age Int
)
GO
Insert Into Table1 Values
(1,'ALi', 25), (2,'Hasan', 24), (3,'Maryam', 20)
GO
Alter Table Table1 
Drop Column Age, [FirstName]
GO
Select * from table1

--------------- RENAME SINGLE COLUMN



DROP TABLE IF EXISTS Table1;
GO
Create Table Table1(
ID  Int,
[Nam]  Varchar(10),
Age1 Int
)
GO

Insert Into Table1 Values
(1,'ALi', 25), (2,'Hasan', 24), (3,'Maryam', 20)
GO
EXEC sp_rename 'dbo.Table1.[Nam]', 'Name', 'COLUMN';

Select * from table1


---------UPDATE SINGLE COLUMN SINGLE ROW
DROP TABLE IF EXISTS Table1;
GO
Create Table Table1(
ID  Int,
[FirstName]  Varchar(10),
Age Int
)
GO
Insert Into Table1 Values
(1,'ALi', 25), (2,'Hasan', 24), (3,'Maryam', 20)

GO
Update  Table1 
Set [FirstName]= 'Sara' Where Id=3

Select * from table1

--------- UPDATE MULTIPLE COLUMNS SINGLE ROW

DROP TABLE IF EXISTS Table1;

Create Table Table1(
ID  Int,
[FirstName]  Varchar(10),
Age Int
)
GO
Insert Into Table1 Values
(1,'ALi', 25), (2,'Hasan', 24), (3,'Maryam', 20)

GO
Update  Table1 
Set [FirstName]= 'Sara' , Age=23 Where Id=3

Select * from table1

----------- UPDATE SINGLE COLUMN MULTIPLE ROWS

DROP TABLE IF EXISTS Table1;

Create Table Table1(
ID  Int,
[FirstName]  Varchar(10),
Age Int
)
GO
Insert Into Table1 Values
(1,'ALi', 25), (2,'Hasan', 24), (3,'Maryam', 20)

GO
Update  Table1 
Set Age= 20  Where Id>=2

Select * from table1

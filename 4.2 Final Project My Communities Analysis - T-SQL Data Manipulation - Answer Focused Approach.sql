  --- Step 1 - Start with a Question
--- EC_IT143_W4.2_hello_world_s1_OS.sql
---Q: What position does each player play?
--- Step 2 - Begin Creating an Answer
--- EC_IT143_W4.2_hello_world_s2_OS.sql
---Q: What position does each player play?
---A: This is what I'm thinking I will need to do
/*******************
create a new view that shows players names, player ID, and position
But first I will need to create keys to join the tables together in a view
This should be simple to do with a join command
******************/
--- Step 3 - Create an Ad Hoc SQL Query
--- EC_IT143_W4.2_hello_world_s3_OS.sql
SELECT tblPositionDim.p_name, dbo.tblPlayerDim.pl_name
FROM dbo.tblPositionDim
LEFT JOIN dbo.tblPlayerDim ON dbo.tblPositionDim.p_id = dbo.tblPlayerDim.p_id
ORDER BY dbo.tblPlayerDim.pl_name
--- Step 4 - Turn the Ad Hoc SQL Query into a View
--- EC_IT143_W4.2_hello_world_s4_OS.sql
/*****************************************************************************************************************
NAME:    Step 4 view
PURPOSE: Create a view to query against in the future for the next steps
MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/23/2022   Samuel Obuobi       1. Built this script for EC IT143
RUNTIME: 
1 second
NOTES: 
Had to remove the Order By section since it's not allowed in the view, for the next part I'll add it back in so it gets ordered correctly
 
******************************************************************************************************************/
-- Q1: What postion does each player play?
-- A1: Execute the query and find out...
CREATE VIEW [PlayerPositions] AS
SELECT tblPositionDim.p_name, dbo.tblPlayerDim.pl_name
FROM dbo.tblPositionDim
LEFT JOIN dbo.tblPlayerDim ON dbo.tblPositionDim.p_id = dbo.tblPlayerDim.p_id
--- Step 5 - Turn the View into a Table
--- EC_IT143_W4.2_hello_world_s5_OS.sql
SELECT *
INTO PlayerPosition
FROM dbo.PlayerPositions
--- Step 6 - Load the Table from the View using an Ad Hoc SQL Script
--- EC_IT143_W4.2_hello_world_s6_OS.sql
SELECT *
INTO Debit_Totals
FROM dbo.FBS_Viza_Costmo
--- Step 7 - Turn the Ad Hoc SQL Script in a Stored Procedure
--- EC_IT143_W4.2_hello_world_s7_OS.sql
/*****************************************************************************************************************
NAME:    Step 7 procedure
PURPOSE: Create a procedure that can be easily executed in the future
MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/15/2024  Samuel Obuobi       1. Built this script for EC IT143
RUNTIME: 
1 second
NOTES: 
All this is going to do is create a procedure with a name from all the data we collect from the PlayerPositions table. It can be run as often as we want, kind of like a macro in excel
 
******************************************************************************************************************/
-- Q1: What postion does each player play?
-- A1: Execute the query and find out...
CREATE PROCEDURE PlayerPositionReset
AS
SELECT*FROM dbo.PlayerPositions
GO;
--- Step 8 - Call the Stored Procedure
--- EC_IT143_W4.2_hello_world_s8_OS.sql
EXEC PlayerPositionReset;
CREATE PROCEDURE SelectAllOrdersStart
AS BEGIN
select * from Orders
END


EXEC SelectAllOrdersStart;

CREATE PROCEDURE SelectAllOrders1 
@PersonID varchar(200)
AS BEGIN
SELECT * FROM Orders WHERE PersonID = @PersonID
END

EXEC SelectAllOrders1 @PersonID = "CSE 066 07000";

CREATE PROCEDURE SelectAllOrders2
@PersonID varchar(200), @OrderNumber int
AS BEGIN
SELECT * FROM Orders WHERE PersonID = @PersonID AND OrderNumber = @OrderNumber
END

EXEC SelectAllOrders2 @PersonID = "CSE 066 07000", @OrderNumber=2;
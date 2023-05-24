#Task 1

CREATE PROCEDURE GetMaxQuantity()
SELECT max(quantity) AS "Max Quantity in Order" FROM Orders;


#Task 2

PREPARE GetOrderDetail FROM 'SELECT OrderID, Quantity, TotalCost from Orders where OrderID=?';
SET @id = 1;
EXECUTE GetOrderDetail USING @id;


#Task 3 

CREATE PROCEDURE CancelOrder(IN OrderID INT)
DELETE FROM orders;


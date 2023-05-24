#Task 1

CREATE VIEW OrdersView AS
SELECT OrderID, Quantity, Cost
FROM orders
WHERE Quantity > 2;

#Task 2

CREATE VIEW CustomerView AS
SELECT 	c.CustomerID AS CustomerID,
		CONCAT(c.FirstName, c.LastName) as FullName,
        o.OrderID AS OrderID,
        o.TotalСost,
        p.ProductName
FROM customer c
JOIN orders o ON c.CustomerID = o.CustomerID
JOIN orderItem oi ON o.OrderID = oi.OrderID
JOIN product p ON oi.ProductID = p.ProductID
WHERE o.TotalСost > 150
ORDER BY o.TotalСost DESC;


USE WideWorldImporters

SELECT DISTINCT I.InvoiceID, C.CustomerID, C.CustomerName,
	   DM.DeliveryMethodName, P.FullName ,CreditLimit =
	   CASE
	   WHEN C.CreditLimit IS NULL THEN -1
	   ELSE C.CreditLimit
	   END
	   FROM Sales.Customers AS C INNER JOIN Application.DeliveryMethods AS DM
	   ON C.DeliveryMethodID=DM.DeliveryMethodID INNER JOIN Sales.Invoices AS I
	   ON DM.DeliveryMethodID=I.DeliveryMethodID INNER JOIN Application.People AS P
	   ON I.SalespersonPersonID=P.PersonID WHERE YEAR(I.InvoiceDate) BETWEEN '2013' AND '2015'
GO

SELECT C.CustomerID, C.CustomerName, SUM(I.CustomerID) AS TotalFacturas, ROW_NUMBER() OVER (ORDER BY C.CustomerID) AS Orden
FROM Sales.Customers AS C INNER JOIN Sales.Invoices AS I
ON C.CustomerID=I.CustomerID GROUP BY C.CustomerName, C.CustomerID ORDER BY TotalFacturas DESC , Orden ASC
GO


select * from sales.Invoices

SELECT * FROM Sales.Customers

SELECT COUNT(*) FROM SALES.Invoices WHERE YEAR(Sales.Invoices.InvoiceDate) BETWEEN '2013' AND '2015'

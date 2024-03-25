-- Вывести ко-во поставщиков не из UK и не из China

SELECT
	COUNT(*) AS total
FROM Suppliers
WHERE
	NOT Country IN ('UK', 'China')

-- Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5

SELECT
	AVG(Price) AS Average_price,
    MAX(Price) AS Maximal_price,
    MIN(Price) AS Minimal_price,
    COUNT(*) AS Products_quantity
FROM Products
WHERE
CategoryID IN (3, 5)

-- Вывести общую сумму проданных товаров

SELECT SUM(Price) AS Sum_of_all_sales FROM OrderDetails
JOIN Products On OrderDetails.ProductID = Products.ProductID

-- Вывести данные о заказах (номерзаказа, имяклиента, странаклиента, фамилияменеджера, названиекомпанииперевозчика)

SELECT OrderID, CustomerName, Country as Customer_Country, LastName as Employee_LastName, ShipperName FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID

-- Вывести сумму, на которую было отправлено товаров клиентам в Germany

SELECT SUM(Price) AS Sum_of_all_sales_In_Germany FROM OrderDetails
JOIN Products On OrderDetails.ProductID = Products.ProductID
JOIN Orders On OrderDetails.OrderID = Orders.OrderID
JOIN Customers On Orders.CustomerID = Customers.CustomerID 
WHERE Country = 'Germany'
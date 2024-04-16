-- 1. Вывести компании-перевозчиков, которые доставили клиентам более 250 заказов 
-- (проекция: название_компании, ко-во заказов)
    SELECT
	ShipperName,
    COUNT(*) AS total_orders
    FROM Orders
    JOIN Shippers ON Shippers.ShipperID = Orders.ShipperID
    GROUP BY ShipperName
    HAVING total_orders >= 250

-- 2. Вывести заказы, где ко-во товаров 3 и более (проекция: номерзаказа, ко-вотовароввзаказе)
    SELECT OrderID, Quantity FROM OrderDetails
    HAVING Quantity >=3 

-- 3. Вывести минимальную стоимость товара для каждой категории, кроме категории 2 
-- (проекция: названиекатегории, минстоимость_товара)
    SELECT CategoryName, MIN(Price) AS Minimal_price FROM Categories
    JOIN Products ON Categories.CategoryID = Products.CategoryID
   	WHERE
    NOT Categories.CategoryID = 2
    GROUP BY 
	CategoryName

-- 4. Вывести менеджера, который находится на 4 месте по ко-ву созданных заказов 
-- (проекция: фамилияменеджера, к-восозданных_заказов)
    SELECT Employees.LastName AS managerLastName, COUNT(*) AS total_orders FROM Orders
    JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
    GROUP BY Employees.EmployeeID
    ORDER BY total_orders DESC
    LIMIT 1 OFFSET 3

-- 5. Вывести данные о товарах от поставщиков 4 и 8 
-- (проекция: всеимеющиесяполя, ценасоскидкой1.5процента, ценаснаценкой0.5процента)
    SELECT *, 
    Price * 0.985 AS Price_with_sale, 
    Price * 1.005 AS Price_with_markup FROM Products
    WHERE SupplierID IN (4, 8)
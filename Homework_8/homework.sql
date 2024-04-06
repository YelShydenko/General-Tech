-- Вывести стоимость заказа 10258
   SELECT OrderID, SUM(Quantity * Price) As Cost FROM OrderDetails
   Join Products on OrderDetails.ProductID = Products.ProductID
   WHERE 
	   OrderID = 10258

-- Вывести кол/распределение заказов по клиентам (проекция: имяклиента, ко-возаказов)
   SELECT CustomerName, COUNT(Quantity) as Quantity FROM OrderDetails
	JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
   JOIN Customers ON Orders.CustomerID = Customers.CustomerID
      GROUP BY 
      CustomerName

-- Вывести кол/распределение заказов по менеджерам (проекция: фамилияменеджера, ко-возаказов)
   SELECT LastName as Employee_LastName, COUNT(Quantity) as Quantity FROM OrderDetails
	JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
   JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
      GROUP BY 
      LastName

-- Вывести минимальную стоимость товаров для каждой категории (проекция: названиекатегории, минстоимость_товаров)
   SELECT CategoryName, MIN(Price) as Minimal_price FROM Categories
   Join Products on Categories.CategoryID = Products.CategoryID
      Group by 
	   CategoryName

-- Вывести данные о заказах (проекция: номерзаказа, стоимостьзаказа)
   SELECT OrderID, SUM(Quantity * Price) as Cost FROM OrderDetails
	Join Products on OrderDetails.ProductID = Products.ProductID
 	   Group by 
      OrderID

-- Вывести доход каждого менеджера за весь период, исходя из ставки в 5% от суммы его заказов (проекция: фамилия_менеджера, доход)
   SELECT LastName as Employee_LastName, SUM(Quantity * Price * 0.05) as Income FROM Orders
   Join OrderDetails on Orders.OrderID = OrderDetails.OrderID
   Join Products on OrderDetails.ProductID = Products.ProductID
   Join Employees on Orders.EmployeeID = Employees.EmployeeID
      Group by 
      Employee_LastName

-- Завершите описание приложенной схемы БД "аудио-хостинг" функционалом плейлистов и групповых чатов
-- https://dbdiagram.io/d/homework_211123-659c4eeaac844320ae7b9797

-- Готовая диаграмма:
-- https://dbdiagram.io/d/Copy-of-homework_211123-66112d8603593b6b6156aa6d
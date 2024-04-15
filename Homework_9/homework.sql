-- 1. Вывести компании-перевозчиков, которые доставили клиентам более 250 заказов 
-- (проекция: название_компании, ко-во заказов)

-- 2. Вывести заказы, где ко-во товаров 3 и более (проекция: номерзаказа, ко-вотовароввзаказе)

-- 3. Вывести минимальную стоимость товара для каждой категории, кроме категории 2 
-- (проекция: названиекатегории, минстоимость_товара)
    SELECT CategoryName, MIN(Price) as Minimal_price FROM Categories
    Join Products on Categories.CategoryID = Products.CategoryID
   	    Where
            Not Categories.CategoryID = 2
	    Group by 
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
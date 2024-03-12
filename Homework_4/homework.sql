-- Вывести данные о товарах (проекция: названиетовара, цена, названиекатегории, названиекомпаниипоставщика)

SELECT ProductName, Price, CategoryName, SupplierName FROM Products
Join Categories on Products.CategoryiD = Categories.CategoryID
Join Suppliers on Products.SupplierID = Suppliers.SupplierID

-- Вывести заказы клиентов не из France  (номерзаказа, имяклиента, страна_клиента)

SELECT OrderID, CustomerName, Country FROM Orders
Join Customers on Orders.CustomerID = Customers.CustomerID
Where
	Not Country = "France"

-- Вывести название и стоимость в USD одного самого дорогого проданного товара

SELECT ProductName, Price as Price_USD FROM OrderDetails
Join Products on OrderDetails.ProductID = Products.ProductID
Order by Price DESC
Limit 1

-- Вывести список стран, которые поставляют морепродукты

SELECT Country FROM Products
Join Categories on Products.CategoryID = Categories.CategoryID
Join Suppliers on Products.SupplierID = Suppliers.SupplierID
Where
	CategoryName = "Seafood"

-- Вывести два самых дорогих товара из категории Beverages из USA

SELECT ProductName, Price FROM Products
Join Categories on Products.CategoryID = Categories.CategoryID
Join Suppliers on Products.SupplierID = Suppliers.SupplierID
Where
	CategoryName = "Beverages"
	And
	Country = "USA"
Order by Price DESC
Limit 2
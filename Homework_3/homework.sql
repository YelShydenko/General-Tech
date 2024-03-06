
-- Вывести данные о товарах не из категорий 2 и 4 и не от поставщиков 2 и 3 с ценой от 20 до 90 EUR 
-- (проекция: название, ценаснаценкой_6%)

SELECT *, 
Price * 1.06 AS Price_up
FROM Products
WHERE 
    CategoryID NOT IN (2, 4)
    AND
    SupplierID NOT IN (2, 3)
    AND
    Price BETWEEN 20 AND 90

-- Вывести клиентов не из Germany, имена которых не заканчиваются на букву t

SELECT * FROM Customers
WHERE 
	NOT Country = 'Germany'
    AND 
    ContactName NOT LIKE '%t'

-- Вывести два самых дешевых товара с ценой от 10 EUR и более 
-- (проекция: название, ценасоскидкой_20%)

SELECT ProductName,
Price * 0.8 AS Price_sale20
FROM Products
WHERE
    Price >= 10
    ORDER BY Price ASC
    LIMIT 2
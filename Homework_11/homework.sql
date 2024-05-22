
-- Создать таблицу друзей с использованием механизма валидации данных в SQL

CREATE TABLE friends (
    friend_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) NOT NULL,
    CHECK (LENGTH(phone) >= 10)
    )

-- Добавить в таблицу друзей несколько записей

INSERT INTO friends (name, email, phone) VALUES
('Harry Potter', 'harrythebest@gmail.com', '1234567890'),
('Hermione Granger', 'smartygranger@gmail.com', '0987654321'),
('Ron Weasley', 'rweasley1980@gmail.com', '4654824872');

-- Вывести сумму всех транзакций отдельно по каждой валюте (в упорядоченном виде)

SELECT sum(amount) AS total_amount, currency FROM txs
JOIN accounts ON txs.sender_account_id = accounts.id
GROUP BY accounts.currency
ORDER BY total_amount DESC
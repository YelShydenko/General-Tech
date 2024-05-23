
-- Создать таблицу друзей с использованием механизма валидации данных в SQL

CREATE TABLE friendship (
    friendship_id INT AUTO_INCREMENT PRIMARY KEY,
    user1_id int NOT NULL,
    user2_id int NOT NULL,
    created_at timestamp not null default current_timestamp,
    foreign key(user1_id) references users(id),
    foreign key(user2_id) references users(id)
    )


-- Добавить в таблицу друзей несколько записей

INSERT INTO friendship (user1_id, user2_id) VALUES
(1, 3),
(1, 2),
(2, 3),
(3, 4)

-- Вывести сумму всех транзакций отдельно по каждой валюте (в упорядоченном виде)

SELECT sum(amount) AS total_amount, currency FROM txs
JOIN accounts ON txs.sender_account_id = accounts.id
GROUP BY accounts.currency
ORDER BY total_amount DESC
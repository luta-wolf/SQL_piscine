INSERT INTO currency VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');
INSERT INTO currency VALUES (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH t3 AS (SELECT balance.user_id, currency.id, currency.name AS currency_name, balance.money AS balance_money,
-- ближайшее значение валюты в прошлом t1
	(SELECT currency.rate_to_usd
	FROM currency
	WHERE currency.id = balance.currency_id
	AND currency.updated < balance.updated
	ORDER BY currency.updated DESC
	LIMIT 1) AS t1,
-- ближайшее значение валюты в будущем t2
	(SELECT currency.rate_to_usd
	FROM currency
	WHERE currency.id = balance.currency_id
	AND currency.updated > balance.updated
	ORDER BY currency.updated
	LIMIT 1) AS t2
FROM currency INNER JOIN balance ON currency.id = balance.currency_id
GROUP BY balance.money, currency.name, currency.id, balance.updated,
		balance.currency_id,balance.user_id
ORDER BY t1 DESC, t2)

SELECT coalesce("user".name, 'not defined') AS name, coalesce("user".lastname, 'not defined') AS lastname,
		t3.currency_name, (t3.balance_money * coalesce(t3.t1, t3.t2)) AS currency_in_usd
FROM t3
LEFT JOIN "user" ON "user".id = t3.user_id
ORDER BY 1 DESC, 2, 3;

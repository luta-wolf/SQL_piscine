(SELECT t1.name, t1.lastname, t1.currency_name, t1.money FROM (
    SELECT COALESCE(u.name, '') name, COALESCE(u.lastname, '') lastname, COALESCE(c1.name, '') currency_name,
           b.money, MAX(c1.updated)
           FROM "user" u
    FULL JOIN balance b ON b.user_id = u.id
    INNER JOIN (
        SELECT * FROM currency c
        ORDER BY name, updated DESC) c1 ON c1.id = b.currency_id AND c1.updated <= b.updated
    GROUP BY 1, 2, 3, 4
    ORDER BY 1 DESC, 2, 3) t1)
UNION
(SELECT t1.name, t1.lastname, t1.currency_name, t1.money FROM (
    SELECT COALESCE(u.name, '') name, COALESCE(u.lastname, '') lastname, COALESCE(c1.name, '') currency_name,
           b.money, MAX(c1.updated)
           FROM "user" u
    FULL JOIN balance b ON b.user_id = u.id
    INNER JOIN (
        SELECT * FROM currency c
        ORDER BY name, updated DESC) c1 ON c1.id = b.currency_id AND c1.updated > b.updated
    GROUP BY 1, 2, 3, 4
    ORDER BY 1 DESC, 2, 3) t1)
ORDER BY 1 DESC, 2, 3

SELECT * FROM "user";
SELECT * FROM balance;
SELECT * FROM currency;


SELECT t1.name, t1.lastname, t1.currency_name, t1.money FROM (
    SELECT COALESCE(u.name, '') name, COALESCE(u.lastname, '') lastname, COALESCE(c1.name, '') currency_name,
           b.money
           FROM "user" u
    FULL JOIN balance b ON b.user_id = u.id
    INNER JOIN (
        SELECT * FROM currency c
        ORDER BY name, updated DESC) c1 ON c1.id = b.currency_id AND c1.updated < b.updated
    GROUP BY 1, 2, 3, 4
    ORDER BY 1 DESC, 2, 3) t1
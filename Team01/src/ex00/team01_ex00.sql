SELECT COALESCE(u.name, ''), COALESCE(u.lastname, ''), b.type, SUM(b.money) volume, COALESCE(c.name, '') currency_name,
       COALESCE(c2.rate_to_usd, '1') last_rate_to_usd, SUM(b.money) * COALESCE(c2.rate_to_usd, '1') total_volume_in_usd
       FROM "user" u
FULL JOIN balance b ON b.user_id = u.id
FULL JOIN (
    SELECT c.id, c.name, MAX(c.updated) last_update FROM currency c
    GROUP BY 1, 2) c ON c.id = b.currency_id
LEFT JOIN currency c2 on c2.updated = c.last_update AND c2.name = c.name
GROUP BY 1, 2, 3, 5, 6
ORDER BY 1 DESC, 2, 3;


-- SELECT balance_norm.name,
--    lastname,
--    type,
--    volume,
--    coalesce(currency_norm.name,'') AS currency_name,
--          coalesce(rate_to_usd, 1.0) AS last_rate_to_usd,
--          volume * coalesce(rate_to_usd, 1.0) AS total_volume_in_usd
-- FROM
--  (SELECT coalesce("user".name, '') AS name,
--          coalesce("user".lastname, '') AS lastname,
--          type,
--          bal1.sum AS volume,
--          bal1.currency_id
--  FROM
--   (SELECT user_id,
--    sum(money) AS sum,
--    type,
--    currency_id
--   FROM balance
--   GROUP BY  user_id, type, currency_id
--   ORDER BY  1) AS bal1 FULL
--   JOIN "user"
--    ON id = bal1.user_id) AS balance_norm
--      FULL JOIN
--             (SELECT DISTINCT *
--             FROM currency
--             WHERE updated =
--                 (SELECT MAX(updated)
--                 FROM currency)) AS currency_norm
--             ON currency_id = currency_norm.id
-- ORDER BY  1 DESC, 2 ASC, 3;

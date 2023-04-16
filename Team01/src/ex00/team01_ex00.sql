WITH c AS (
    SELECT id, name, MAX(updated) AS last_currency
    FROM currency
    GROUP BY 1, 2
)
SELECT coalesce(u.name, 'not defined') AS name, coalesce(lastname, 'not defined') AS lastname, b.type, sum(b.money) AS volume,
       coalesce(c.name, 'not defined') AS currency_name, coalesce(c2.rate_to_usd, '1') AS last_rate_to_usd,
       sum(b.money) * coalesce(c2.rate_to_usd, '1') AS total_volume_in_usd
FROM balance b
LEFT JOIN "user" u ON b.user_id = u.id
LEFT JOIN c ON b.currency_id = c.id
LEFT JOIN currency c2 ON c2.updated = c.last_currency AND c2.name = c.name
GROUP BY 1, 2, 3, c.name, c2.rate_to_usd
ORDER BY 1 DESC, 2, 3

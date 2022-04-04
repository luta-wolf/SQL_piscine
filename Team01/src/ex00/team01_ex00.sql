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

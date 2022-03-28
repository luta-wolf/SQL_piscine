SELECT * FROM total_cost
WHERE total_cost IN ((SELECT MIN(total_cost) FROM total_cost), (SELECT MAX(total_cost) FROM total_cost))
ORDER BY 1,2;

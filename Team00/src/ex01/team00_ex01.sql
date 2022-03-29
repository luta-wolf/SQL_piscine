SELECT * FROM total_cost
WHERE total_cost IN ((SELECT MIN(total_cost) FROM total_cost), (SELECT MAX(total_cost) FROM total_cost))
ORDER BY 1,2;

-- решение номер два (часть кода в первом)
--  SELECT total_cost, tour FROM all_traces
--      WHERE total_cost IN (SELECT min(total_cost) FROM all_traces)
--  UNION
--  SELECT total_cost, tour FROM all_traces
--      WHERE total_cost IN (SELECT max(total_cost) FROM all_traces)
--  ORDER BY 1,2;

CREATE VIEW total_cost (total_cost, tour) AS
(
WITH RECURSIVE cost AS (
    SELECT tours.node1 AS tour,
           tours.node1,
           tours.node2,
           tours.cost,
           tours.cost  AS summ
    FROM tours
    WHERE tours.node1 = 'A'
    UNION ALL
    SELECT parrent.tour || ',' || child.node1 AS tour,
           child.node1,
           child.node2,
           parrent.cost,
           parrent.summ + child.cost AS summ
    FROM tours AS child
             JOIN cost AS parrent ON child.node1 = parrent.node2
    WHERE parrent.tour NOT LIKE '%' || child.node1 || '%'
)
SELECT cost.summ AS total_cost,
       '{' || cost.tour || ',A}' AS tour
FROM cost
WHERE cost.node2 = 'A' AND length(cost.tour) = 7
);
SELECT * FROM total_cost WHERE total_cost IN (SELECT MIN(total_cost) FROM total_cost)
ORDER BY 1, 2;

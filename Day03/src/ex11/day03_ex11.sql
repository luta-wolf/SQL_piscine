UPDATE menu
SET price = round(((price / 100) * 90), 0)
WHERE pizza_name = 'greek pizza';

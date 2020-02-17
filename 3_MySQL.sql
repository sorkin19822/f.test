SELECT c.name AS category, count(*) AS cnt, MIN(p.price) as minPrice, MAX(p.price) as maxPrice,
max(char_length(p.description)) as maxLengthDescr, dis.description as longDescr, dis.name as longName FROM products AS p
INNER JOIN categories c ON p.category_id = c.id
INNER JOIN products dis ON p.id = dis.id
where char_length(dis.description) = (select max(char_length(dis.description)) from products)
GROUP BY p.category_id
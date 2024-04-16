-- ejercicio 1: consultando dos tablas
SELECT
    u.nombre
    ,u.email
    ,b.bitcoinAdress AS direccion
    ,b.monto
FROM
    usuarios AS u
    ,bitcoins AS b
WHERE
    u.email = b.email
;

-- ejercicio 2: usando inner join
SELECT
    u.nombre
    ,u.email
    ,b.bitcoinAdress AS direccion
    ,b.monto
FROM
    usuarios AS u
INNER JOIN
    bitcoins AS b
    ON u.email = b.email
;

-- ejercicio 3: usando left/right join
-- (1)
SELECT
    *
FROM
    bitcoins AS b
LEFT JOIN
    usuarios AS u
    ON b.email = u.email
;

-- (2)
SELECT
    *
FROM
    usuarios AS u
LEFT JOIN
    bitcoins AS b
    ON u.email = b.email
;

-- (4)
SELECT
    *
FROM
    bitcoins AS b
RIGHT JOIN
    usuarios AS u
    ON b.email = u.email
;

-- ejercicio 4: usando full join
SELECT
    *
FROM
    bitcoins AS b
FULL OUTER JOIN
    usuarios AS u
    ON b.email = u.email
;

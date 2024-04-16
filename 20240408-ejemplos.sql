-- creamos la primera tabla
CREATE TABLE IF NOT EXISTS
    public.posts
    (
        id SERIAL
        ,title VARCHAR(255)
        ,content TEXT
    )
;

-- insertamos datos en la tabla posts
INSERT INTO
    posts (title, content)
VALUES
    ('Como mejorar tus habilidades de SQL', 'Aprenderás diversas técnicas para mejorar tus habilidades de SQL...')
    ,('Introducción a las bases de datos relacionales', 'Descubre los conceptos fundamentales de las bases de datos relacionales...')
;

-- revisamos la data en la tabla
SELECT *
FROM
    public.posts
;

-- creamos la segunda tabla
CREATE TABLE IF NOT EXISTS
    public.comments
    (
        id SERIAL
        ,content TEXT
        ,post_id INTEGER
    )
;

-- insertamos datos dentro de la tabla comments
INSERT INTO
    comments (content, post_id)
VALUES
    ('Excelente articulo, muy informativo. Gracias por compartir', 1)
    ,('Tengo una pregunta sobre la técnica mencionada. ¿Puedes proporcionar más detalles?', 1)
    ,('Estoy emocionado de aplicar estos consejos en mi próximo proyecto', 2)
;

-- revisamos la data en la tabla
SELECT *
FROM
    public.comments
;

-- ejemplo 1: lamina 11
SELECT
    *
FROM
    comments
    ,posts
WHERE
    comments.post_id = posts.id
;

-- ejemplo 2: lamina 12
SELECT
    posts.*
    ,comments.*
FROM
    comments
    ,posts
WHERE
    comments.post_id = posts.id
;

-- aumentamos el ejemplo 2
SELECT
    p.*
    ,c.*
FROM
    comments AS c
    ,posts AS p
WHERE
    c.post_id = p.id
;

-- aumentamos aún más el ejemplo 2
SELECT
    posts.id
    ,posts.title
    ,posts.content AS post_content
    ,comments.content  AS comment_content
FROM
    comments
    ,posts
WHERE
    comments.post_id = posts.id
;

-- ejemplo 3: lamina 13
SELECT
    *
FROM
    posts
    ,comments
;

-- ejemplo 4: inner join: lamina 18
SELECT
    *
FROM
    posts
INNER JOIN
    comments
    ON posts.id = comments.post_id
;

-- procesamiento: lamina 19
UPDATE
    comments
SET
    post_id = NULL
WHERE
    content = 'comentario 2'
    OR post_id = 2
;

-- revisamos la data
SELECT
    *
FROM
    comments
WHERE
    post_id IS NULL
;

-- ejemplo 5: inner join con nulos: lamina 21
SELECT
    *
FROM
    posts
INNER JOIN
    comments
    ON posts.id = comments.post_id
;

-- aumentamos el ejemplo 5
SELECT
    p.id
    ,p.title
    ,p.content AS post_content
    ,c.content AS comment_content
FROM
    posts AS p
INNER JOIN
    comments AS c
    ON p.id = c.post_id
;

-- ejemplo 6: left join: lamina 26
SELECT
    *
FROM
    posts
LEFT JOIN
    comments
    ON posts.id = comments.post_id
;

-- aumentamos el ejemplo 6
SELECT
    p.id
    ,p.title
    ,p.content AS post_content
    ,c.content AS comment_content
FROM
    posts AS p
RIGHT JOIN
    comments AS c
    ON p.id = c.post_id
;

-- ejemplo 7: full join: lamina 29
SELECT
    *
FROM
    posts AS p
FULL JOIN
    comments AS c
    ON p.id = c.post_id
;

-- ejemplo 8: cross join: lamina 32
SELECT
    *
FROM
    posts
CROSS JOIN
    comments
;

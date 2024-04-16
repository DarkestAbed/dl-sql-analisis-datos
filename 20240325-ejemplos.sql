-- 
SELECT
	*
FROM
	demo
;

/*
SELECT * FROM demo
*/

--

SELECT
	name
FROM
	demo
;

/*
SELECT name FROM demo;
*/

--

SELECT
	id
    ,name
FROM
	demo
;

/* SELECT id, name FROM demo;*/

/*
SELECT
	id,
    name
FROM
	demo
*/

--

SELECT
	*
FROM
	demo
WHERE
	id > 4
;

--

SELECT
	*
FROM
	demo
ORDER BY
	name ASC
;

--

SELECT
	id
    ,name
    ,hint
FROM
	demo
ORDER BY
	id ASC
LIMIT 3
;

--

INSERT INTO
	demo (name, hint)
    VALUES
    (
		"Havee"
      	,"Este es un sobrenombre"
	),
    (
      	"Eustaquio"
      	,"Manos a la obra en una sola maniobra"
	)
;

SELECT
	*
FROM
	demo
;

INSERT INTO
	demo
    (name)
    VALUES
    (
     	"nombresito"
    )
;

SELECT * FROM demo;

--

SELECT
	*
FROM
	demo
WHERE
	hint IS NULL
;

--

INSERT INTO
	demo
	(
      	name
      	,hint
	)
    VALUES
    (
      	"Javi"
      	,"Justiciero postapocaliptico"
	),
    (
      	"Compañere"
      	,"Este es el nombre de alguien"
	)
;

SELECT
	*
FROM
	demo
ORDER BY
	id DESC
LIMIT 2
;

--

UPDATE
	demo
SET
	hint = "Aprendi a cambiar valores"
WHERE
	name = "Javi"
;

UPDATE
	demo
SET
	hint = "Cambio masivo"
WHERE
	id < 5
;


BEGIN;
COMMIT;

SELECT * FROM demo_update;

/* ============== */
UPDATE
	demo_update
SET
	hint = "Esto es un error grande"
;

--

DELETE FROM
	demo
WHERE
	id = 1
    OR id = 2
;

/*
DELETE FROM
	demo
WHERE
	id <= 2
*/

/*
DELETE FROM
	demo
WHERE
	id < 3
;
*/

/* ============== */
SELECT * FROM demo_delete;

DELETE FROM
	demo_delete
;

--

CREATE TABLE
	alumnos
    (
      	nombre VARCHAR
      	,nota1 INTEGER
      	,nota2 INTEGER
      	,nota3 INTEGER
	)
;

--

INSERT INTO alumnos (nombre, nota1, nota2, nota3) VALUES ("Elmira", 10, 1, 6);
INSERT INTO alumnos (nombre, nota1, nota2, nota3) VALUES ("Izak", 1, 6, 5);
INSERT INTO alumnos (nombre, nota1, nota2, nota3) VALUES ("Claudette", 5, 1, 3);
INSERT INTO alumnos (nombre, nota1, nota2, nota3) VALUES ("Noreen", 1, 6, 4);
INSERT INTO alumnos (nombre, nota1, nota2, nota3) VALUES ("Natalina", 8, 5, 3);
INSERT INTO alumnos (nombre, nota1, nota2, nota3) VALUES ("Jacky", 5, 2, 6);
INSERT INTO alumnos (nombre, nota1, nota2, nota3) VALUES ("Jilly", 6, 1, 2);
INSERT INTO alumnos (nombre, nota1, nota2, nota3) VALUES ("Robbie", 4, 8, 5);

SELECT * FROM alumnos;

SELECT * FROM alumnos WHERE nombre = "Izak";

--

DROP TABLE alumnos;

--

SELECT * FROM alumnos;

ALTER TABLE
	alumnos
DROP COLUMN
	nota3
;

ALTER TABLE
	alumnos
ADD COLUMN
	nota3 FLOAT
;

UPDATE
	alumnos
SET
	nota3 = 1.45
;

UPDATE
	alumnos
SET
	nota2 = 1.4
WHERE
	nombre = "Elmira"
;

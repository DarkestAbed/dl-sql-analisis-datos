/* ========================== */
/* configuracion del ambiente */
/* ========================== */

/* creamos la tabla 'ventas' */
CREATE TABLE
	public.ventas
	(
		categoria VARCHAR(50)
		,monto INT
	)
;

/* insertamos datos en la tabla 'ventas'*/
INSERT INTO
	public.ventas
	(
		categoria
		,monto
	)
VALUES
	('Books', 214)
	,('Games', 293)
	,('Baby', 241)
	,('Tools', 719)
	,('Tools', 385)
	,('Movies', 882)
	,('Outdoors', 654)
	,('Baby', 332)
	,('Grocery', 332)
	,('Toys', 952)
	,('Games', 682)
	,('Books', 527)
	,('Kids', 980)
	,('Grocery', 300)
;

/* creamos la tabla 'transacciones' */
CREATE TABLE
	public.transacciones
	(
		id INT
		,monto INT
	)
;

/* insertamos datos en la tabla 'transacciones' */
INSERT INTO transacciones (id, monto) VALUES (4, 490);
INSERT INTO transacciones (id, monto) VALUES (4, 159);
INSERT INTO transacciones (id, monto) VALUES (2, 1000);
INSERT INTO transacciones (id, monto) VALUES (2, 578);
INSERT INTO transacciones (id, monto) VALUES (1, 613);
INSERT INTO transacciones (id, monto) VALUES (3, 366);
INSERT INTO transacciones (id, monto) VALUES (2, 546);
INSERT INTO transacciones (id, monto) VALUES (5, 265);
INSERT INTO transacciones (id, monto) VALUES (1, 163);
INSERT INTO transacciones (id, monto) VALUES (2, 135);
INSERT INTO transacciones (id, monto) VALUES (2, 404);
INSERT INTO transacciones (id, monto) VALUES (4, 885);
INSERT INTO transacciones (id, monto) VALUES (2, 309);
INSERT INTO transacciones (id, monto) VALUES (5, 78);

/* ===================================== */
/* respuestas de clases a los ejercicios */
/* ===================================== */

-- EJERCICIO: Contando en nuestra tabla
-- pagina 13

/* consulta para contar la cantidad de registros */
SELECT
	COUNT(*)
FROM
	public.ventas
;

/* consulta para contar la cantidad de registros con distinta categoria */
SELECT
	COUNT(DISTINCT(categoria))
FROM
	public.ventas
;

/* consulta para contar la cantidad de registros con distinto monto */
SELECT
	COUNT(DISTINCT(monto))
FROM
	public.ventas
;

/* consulta para contar la cantidad de registros de tipo "Tool" o "Games" */
SELECT
	COUNT(*)
FROM
	public.ventas
WHERE
	categoria IN ('Tools', 'Games')
;

/* ========== */

-- EJERCICIO: Conteo agrupado
-- pagina 19

/* consulta para contar cuantas veces se repite cada categoria */
SELECT
	categoria
	,COUNT(*) AS conteo
FROM
	ventas
GROUP BY
	categoria
;

/* ========== */

-- EJERCICIO: Consultas y clausulas
-- pagina 29

/* consulta para listar el monto total en transacciones por usuario */
SELECT
	id
	,SUM(monto) AS sum
FROM
	public.transacciones
GROUP BY
	id
ORDER BY
	id ASC
;

/* consulta para listar el monto total en transacciones por usuario filtrando transacciones con UM menor que 500 */
SELECT
	id
	,SUM(monto) AS sum
FROM
	public.transacciones
WHERE
	monto >= 500
GROUP BY
	id
ORDER BY
	id ASC
;

/* consulta para listar el monto total de transacciones solo si como monto total se superan la 1,000 UM */
SELECT
	id
	,SUM(monto) AS sum
FROM
	public.transacciones
GROUP BY
	id
HAVING
	SUM(monto) > 1000
ORDER BY
	id ASC
;

/* ========== */

-- EJERCICIO: Subconsultas
-- pagina 35

/* consulta para listar todas las transacciones que superen el monto de transaccion promedio */
/* AVG(monto) = 427.93 */
SELECT
	AVG(monto)
FROM
	public.transacciones
;

SELECT
	id
	,monto
	-- ,(
	-- 	SELECT
	-- 		AVG(monto)
	-- 	FROM
	-- 		public.transacciones
	-- ) AS avg_monto
FROM
	public.transacciones
WHERE
	monto > (
		SELECT
			AVG(monto)
		FROM
			public.transacciones
	)
ORDER BY
	id ASC
;

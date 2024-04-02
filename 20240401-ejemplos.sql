/* Creamos la tabla */
CREATE TABLE public.monedas
(
	nombre VARCHAR(50)
)
;

/* Insertamos valores en la tabla */
INSERT INTO monedas (nombre)
VALUES
	('Guarani')
	,('Rupiah')
	,('Ruble')
	,('Peso')
	,('Peso')
	,('Yuan Renminbi')
	,('Yuan Renminbi')
	,('Yuan Renminbi')
	,('Euro')
	,('Ariary')
	,('Denar')
	,('Rupiah')
	,('Ruble')
	,('Yuan Renminbi')
	,('Lek')
;

/* Contamos todos los registros */
SELECT
	COUNT(*)
FROM
	public.monedas
;

/* Contamos todos los registros cuyo nombre sean "Peso" */
SELECT
	COUNT(*)
FROM
	public.monedas
WHERE
	nombre = 'Peso'
;

/* Contamos todos los registros cuyo nombre sea "Peso" o "Euro" */
SELECT
	COUNT(*)
FROM
	public.monedas
WHERE
	nombre = 'Peso'
	OR nombre = 'Euro'
;

/* Otra forma de contar todos los registros cuyo nombre sea "Peso" o "Euro" */
SELECT
	COUNT(*)
FROM
	public.monedas
WHERE
	nombre IN ('Peso', 'Euro')
;

/* Listamos todas las monedas con distinto nombre */
SELECT
	DISTINCT(nombre)
FROM
	public.monedas
;

/* Contamos todos los registros con distinto nombre */
SELECT
	COUNT(DISTINCT(nombre))
FROM
	public.monedas
;

/* Contamos cuántas veces aparece cada registro repetido */
SELECT
	nombre
	,COUNT(*) AS cnt
FROM
	public.monedas
GROUP BY
	nombre
;

/* Suma de ventas por categoria */
SELECT
	categoria
	,SUM(monto) AS total
--	,COUNT(*) AS cnt
--	,SUM(monto) / COUNT(monto) AS promedio
--	,AVG(monto) AS average
FROM
	public.ventas
GROUP BY
	categoria
;

/* Promedio de ventas por categoria */
SELECT
	categoria
	,AVG(monto)
FROM
	public.ventas
GROUP BY
	categoria
;

/* Obtener las categorias con suma de monto mayores a 900 */
/* incorrecto */
SELECT
	categoria
	,SUM(monto)
FROM
	public.ventas
WHERE
	monto > 900
GROUP BY
	categoria
;

/* correcto */
SELECT
	categoria
	,SUM(monto)
FROM
	public.ventas
GROUP BY
	categoria
HAVING
	SUM(monto) > 900
;

/* Obtener las ventas con venta mayor al promedio */
EXPLAIN
SELECT
	*
FROM
	public.ventas
WHERE
	monto > (
		SELECT
			AVG(monto)
		FROM
			public.ventas
	)
;

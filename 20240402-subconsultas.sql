/*
Material de apoyo: subconsultas
-------------------------------

En este script SQL vamos a revisar algunos ejemplos de consultas filtradas
y subconsultas.
*/

/* Para comenzar, creamos una tabla, 'classes', que contiene el nombre
de los estudiantes, el identificador de la clase que están tomando, y
una nota que hayan obtenido en dicho ramo. Este tipo de tablas se denominan
"tablas largas", por su forma "alargada" (muchos registros con llaves repetidas).
De hecho, en este caso seremos capaces de agregar múltiples notas a la base de
datos, repitiendo las llaves `studentName` y `classId`. */
CREATE TABLE
	public.classes
	(
        studentName VARCHAR(50)
		,classId INT
        ,grade FLOAT
	)
;

/* Luego de crear la tabla, agregaremos algunos registros a ella. */
INSERT INTO
    public.classes
    (
        studentName
        ,classId
        ,grade
    )
VALUES
    ('Javier', 1, 4.5),
    ('Angela', 1, 6.7),
    ('Javier', 2, 5.3),
    ('Esteban', 1, 3.1),
    ('Victoria', 2, 5.8),
    ('Javier', 2, 6.0),
    ('Angela', 1, 4.9),
    ('Angela', 2, 2.1),
    ('Victoria', 1, 3.7),
    ('Victoria', 2, 3.7),
    ('Esteban', 1, 1.5),
    ('Esteban', 1, 6.9),
    ('Esteban', 3, 5.6),
    ('Javier', 4, 5.5),
    ('Angela', 2, 4.7),
    ('Angela', 1, 5.1),
    ('Estela', 5, 2.3),
    ('Javier', 1, 5.4),
    ('Esteban', 2, 5.0),
    ('Angela', 3, 5.0),
    ('Angela', 3, 4.3),
    ('Victoria', 1, 4.1),
    ('Esteban', 2, 4.2),
    ('Alexis', 8, 3.9),
    ('Javier', 2, 4.0),
    ('Angela', 2, 6.7),
    ('Victoria', 2, 6.1),
    ('Esteban', 2, 3.6),
    ('Javier', 3, 5.8),
    ('Angela', 3, 5.9),
    ('Esteban', 3, 6.0),
    ('Victoria', 3, 6.1)
;

/* Finalmente, seleccionamos todos los datos de la tabla para ver su forma. */
SELECT
    *
FROM
    public.classes
;

/* La tabla recién creada se ve más o menos así:

|                     studentname        |                     classid        |                     grade        | --row-header |
| -------------------------------------- | ---------------------------------- | -------------------------------- | ------------ |
| Javier                                 | 1                                  | 4.5                              |              |
| Angela                                 | 1                                  | 6.7                              |              |
| Javier                                 | 2                                  | 5.3                              |              |
| Esteban                                | 1                                  | 3.1                              |              |
| Victoria                               | 2                                  | 5.8                              |              |
| Javier                                 | 2                                  | 6                                |              |
| Angela                                 | 1                                  | 4.9                              |              |
| Angela                                 | 2                                  | 2.1                              |              |
| Victoria                               | 1                                  | 3.7                              |              |
| Victoria                               | 2                                  | 3.7                              |              |
*/

/* La primera pregunta que nos hacemos es: cuantos alumnos hay por clase?
Para responderla, seleccionamos el identificador de la clase y contamos cuántos registros 
existen para cada ramo. */
SELECT
    classId
    ,COUNT(*)
FROM
    public.classes
GROUP BY
    classId
ORDER BY
    classId ASC
;

/* Luego, contestaremos la pregunta: cual es el promedio general de cada alumno? */
SELECT
    studentName
    ,AVG(grade) AS general_avg
FROM
    public.classes
GROUP BY
    studentName
ORDER BY
    studentName ASC
;

/* Cae de cajón la siguiente interrogante: cual es el promedio por ramo de cada alumno? *
En este caso, elegimos el nombre del estudiante y luego el ramo, para que la tabla de
resultados tenga sentido para nosotros. */
SELECT
    studentName
    ,classId
    ,AVG(grade) AS class_avg
FROM
    public.classes
GROUP BY
    studentName
    ,classId
ORDER BY
    studentName ASC
    ,classId ASC
;

/* Dado que podemos agregar una cantidad arbitraria de notas a cada alumno por ramo,
debemos entender cuantas notas tiene cada alumno en cada asignatura. */
SELECT
    studentName
    ,classId
    ,COUNT(grade) AS q_grade
FROM
    public.classes
GROUP BY
    studentName
    ,classId
ORDER BY
    studentName ASC
    ,classId ASC
;

/* Si nos preguntamos cuantas notas reprobatorias tiene cada alumno en cada ramo
(donde una nota reprobatoria cumple la condición grade < 4), debemos usar un filtro
a nivel de filas para obtener los registros que nos sean útiles. */
SELECT
    studentName
    ,classId
    ,COUNT(*) AS q_fail_grades
FROM
    public.classes
WHERE
    grade < 4
GROUP BY
    studentName
    ,classId
ORDER BY
    studentName ASC
    ,classId ASC
;

/* Ahora, queremos saber: cuantos alumnos estan reprobando el ramo 1, 2 o 3? 
Para determinarlo, debemos agrupar primero y luego filtrar, considerando la
condición de reprobación de un ramo. */
SELECT
    classId
    ,COUNT(*)
FROM
    public.classes
WHERE
    classId IN (1, 2, 3)
GROUP BY
    classId
HAVING
    AVG(grade) < 4
;

/* Cuantos alumnos tienen un promedio general reprobatorio? */
SELECT
    studentName
    ,AVG(grade) AS failing_avg
FROM
    public.classes
GROUP BY
    studentName
HAVING
    AVG(grade) < 4
;

/* Introducimos las subconsultas: queremos saber que notas tiene cada alumno en
cada clase que sean menores que el promedio total de notas. Para ello, realizamos una
subconsulta dos veces: queremos obtener el promedio general de notas, y luego comparar
la nota obtenida con dicho promedio */
SELECT
    classId
    ,studentName
    ,(
        SELECT AVG(grade)
        FROM public.classes
    ) AS total_avg
    ,grade
FROM
    public.classes
WHERE
    grade < (
        SELECT AVG(grade)
        FROM public.classes
    )
ORDER BY
    classId
    ,studentName
;

/* Que notas son ser menores que el promedio total de notas? Aquí usamos una
subconsulta y, ademas, creamos un atributo booleano, con la fórmula directamente
escrita en la definición de la columna. A esto, en el mundo laboral, se le conoce
como "regla de negocio": aplicar una fórmula que nos permita obtener información
a partir de los datos. */
SELECT
    classId
    ,studentName
    ,grade
    ,(
        SELECT AVG(grade)
        FROM public.classes
    ) AS total_avg
    ,grade < (
        SELECT AVG(grade)
        FROM public.classes
    ) AS fail_fg
FROM
    public.classes
ORDER BY
    classId
    ,studentName
;

/* El último tipo de subconsulta que veremos es la que existe en la cláusula FROM.
Para saber cuántos alumnos estan reprobando cada ramo, debemos primero obtener una
tabla intermedia, que nos indique, para cada estudiante y cada asignatura, quién está
reprobando. La forma mostrada aquí es una de varias que nos permiten obtener dicha
información; recuerda que no existe una "forma correcta" de obtener los resultados, sólo
existen formas que cumplen con nuestras condiciones. */
SELECT
    q1.classId AS classId
    ,COUNT(q1.studentName) AS q_failing
FROM
    (
        SELECT
            classId
            ,studentName
            ,COUNT(*)
        FROM
            public.classes
        GROUP BY
            classId
            ,studentName
        HAVING
            AVG(grade) < 4.0
    ) AS q1
GROUP BY
    q1.classId
ORDER BY
    q1.classId ASC
;

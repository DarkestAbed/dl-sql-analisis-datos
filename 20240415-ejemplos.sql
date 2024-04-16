-- lamina 14
-- pk on create
CREATE TABLE
    users
    (
        id INTEGER PRIMARY KEY
        ,nombre VARCHAR
        ,edad INTEGER
    )
;

-- agregamos pk para columna ya existente
ALTER TABLE
    users
ADD 
    PRIMARY KEY (id)
;

-- agregamos pk para columna nueva
ALTER TABLE
    users
ADD 
    COLUMN id INT PRIMARY KEY
;

-- lamina 15
INSERT INTO
    users (id, nombre, edad)
VALUES
    (1, 'Consuelo', 27)
;

INSERT INTO
    users (id, nombre, edad)
VALUES
    (NULL, 'Consuelo', 32)
;

INSERT INTO
    users (id, nombre, edad)
VALUES
    (3, 'Francisco', 27)
;

INSERT INTO
    users (id, nombre, edad)
VALUES
    (3, 'Javier', 10)
;

-- lamina 19
CREATE TABLE
    pagos
    (
        id INT PRIMARY KEY
        ,monto INT
        ,usuario_id INT
        ,FOREIGN KEY (usuario_id)
            REFERENCES users(id)
    )
;

INSERT INTO
    pagos (id, monto, usuario_id)
VALUES
    (1, 237, 1)
;

DELETE FROM
    users
WHERE
    id = 1
;

-- lamina 31
-- codigo generado por drawDB
CREATE TABLE "Usuarios" (
	"id" serial NOT NULL,
	"nombre" varchar(255),
	"edad" int,
	PRIMARY KEY("id")
);

CREATE TABLE "Proyectos" (
	"id" serial NOT NULL,
	"nombre" varchar(255),
	PRIMARY KEY("id")
);

CREATE TABLE "UsuarioProyecto" (
	"usuario_id" int,
	"proyecto_id" int
);

ALTER TABLE "UsuarioProyecto"
ADD 
    FOREIGN KEY("usuario_id")
    REFERENCES "Usuarios"("id")
ON UPDATE
    NO ACTION
ON DELETE
    NO ACTION
;

ALTER TABLE "UsuarioProyecto"
ADD
    FOREIGN KEY("proyecto_id")
    REFERENCES "Proyectos"("id")
ON UPDATE
    NO ACTION
ON DELETE
    NO ACTION
;

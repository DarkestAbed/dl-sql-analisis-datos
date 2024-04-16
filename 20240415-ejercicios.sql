-- ejercicio 1
-- ingresamos posts con el mismo id
INSERT INTO
    posts (id, title, content)
VALUES
    (1, 'Mi primer post', 'Este post explica como usar SQL')
;

INSERT INTO
    posts (id, title, content)
VALUES
    (1, 'Mi camino como analista de datos', 'Les quiero compartir mi camino como analista y cientifico de datos')
;

-- ingresamos un post sin id
INSERT INTO
    posts (id, title, content)
VALUES
    (NULL, 'Me seteé para el fracaso', 'No se si esto va a quedar grabado...')
;

-- ejercicio 2
-- añadir un comentario al post 1
INSERT INTO
    comments (id, content, post_id)
VALUES
    (1, 'Que buen post!', 1)
;

DELETE FROM
    posts
WHERE
    id = 1
;

-- ejercicio 3
-- codigo generado por drawDB
CREATE TABLE "Peliculas" (
	"id" int,
	"nombre" varchar(255),
	"anno" int,
	PRIMARY KEY("id")
);

CREATE TABLE "Actores" (
	"id" int NOT NULL,
	"nombre" varchar(255),
	"edad" int,
	PRIMARY KEY("id")
);

CREATE TABLE "PeliculaActor" (
	"id" int NOT NULL,
	"pelicula_id" int,
	"actor_id" int,
	PRIMARY KEY("id")
);

ALTER TABLE "PeliculaActor"
ADD
    FOREIGN KEY("pelicula_id")
    REFERENCES "Peliculas"("id")
ON UPDATE
    NO ACTION
ON DELETE
    NO ACTION
;

ALTER TABLE "PeliculaActor"
ADD
    FOREIGN KEY("actor_id")
    REFERENCES "Actores"("id")
ON UPDATE
    NO ACTION
ON DELETE
    NO ACTION
;

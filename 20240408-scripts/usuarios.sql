drop table if exists
	public.usuarios
;

create table usuarios (
	email VARCHAR(50),
	nombre VARCHAR(100)
);

insert into usuarios (email, nombre) values ('camila@email.com', 'Camila');
insert into usuarios (email, nombre) values ('francisca@email.com', 'Francisca');
insert into usuarios (email, nombre) values ('diego@email.com', 'Diego');
insert into usuarios (email, nombre) values ('jaime@email.com', 'Jaime');
insert into usuarios (email, nombre) values ('fernanda@email.com', 'Fernanda');
insert into usuarios (email, nombre) values ('pedro@email.com', 'Pedro');
insert into usuarios (email, nombre) values ('josefina@email.com', 'Josefina');
insert into usuarios (email, nombre) values ('pp@email.com', 'Pepe');
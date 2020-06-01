#Autor: Yelson Monge
#Fecha: 31/05/2020
#IMPORTANTE: Para llevar un estándar, y debido a que el editor tiene
#las palabras reservadas (INT, NOT, CREATE..) por default en minúscula
# y además todo lo pone en minúscula, voy a manejar todas las palabras
# reservadas y nombres de tablas en minúscula. Las columnas van a empezar
# con mayúsucula para que se más fácil a la hora de hacer los select
#Descripción: En este script se van a crear la base de datos
#Vamos a crear sólo las tablas necesarias para la primera iteración

create database if not exists athletistics_db;

use athletistics_db;

#Creamos la tabla carrera
create table if not exists carrera(
	IdCarrera int not null auto_increment,
    Nombre varchar(50) not null,
    Borrado bool default false,
    primary key (IdCarrera)
)Engine = INNODB;

#Creamos la tabla disciplina
create table if not exists disciplina(
	IdDisciplina int not null auto_increment,
    Nombre varchar(50) not null,
    Borrado bool default false,
    primary key (IdDisciplina)
)Engine = INNODB;

#Creamos la tabla de estudiante
#Las imágenes las agregamos cuando sepa cómo hacerlo, alter table nada más
create table if not exists estudiante(
	Carnet int not null,
    Nombre varchar(100) not null,
    FechaNacimiento date not null,
    Telefono int not null,
    Correo varchar(100) not null,
    Altura float not null,
    Peso float not null,
    IdCarrera int not null,
    IdDisciplina int not null,
    Borrado bool default false,
    primary key (Carnet),
    constraint fkEstCarr
    foreign key (IdCarrera) references carrera(IdCarrera),
    constraint fkEstDisc
    foreign key (IdDisciplina) references disciplina(IdDisciplina)
)Engine = INNODB;

#Creamos la tabla de administrador
#Las imágenes las agregamos cuando sepa cómo hacerlo, alter table nada más


create table if not exists administrador(
	IdAdministrador int not null auto_increment,
    Nombre varchar(100) not null,
    FechaNacimiento date not null,
    Telefono int not null,
    Correo varchar(100) not null,
    IdDisciplina int not null,
    Borrado bool default false,
    primary key (IdAdministrador),
    constraint fkAdmiDisc
    foreign key (IdDisciplina) references disciplina(IdDisciplina)
)Engine = INNODB;
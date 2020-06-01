#Autor: Yelson Monge
#Fecha: 31/05/2020
#Descripción: Los scripts del CRUD de Carreras

use athletistics_db;

#---------------------------- Insertar Carrera --------------------------------
delimiter $$
create procedure insertarCarrera(
in pNombre varchar(50))
begin
	if exists(select IdCarrera from carrera where Nombre = pNombre and Borrado = 0) then
		select 'ERROR: La carrera ya existe';
    else
		insert into carrera(Nombre) values(pNombre);
	end if;
end $$

#---------------------------- Ver Carreras --------------------------------
delimiter $$
create procedure verCarreras()
begin
	select Nombre from carrera
    where Borrado = false
    order by Nombre;
end $$

#---------------------------- Modificar Carrera --------------------------------
delimiter $$
create procedure modificarCarrera(
in pNombre varchar(50),
in pNombreNuevo varchar(50))
begin
	if exists(select IdCarrera from carrera where Nombre = pNombre and Borrado = 0) then
		update carrera
        set Nombre = pNombreNuevo
        where IdCarrera = (select IdCarrera from Carrera where Nombre = pNombre);
    else
        select 'ERROR: La carrera no existe';
	end if;
end $$


#---------------------------- Eliminar Carrera --------------------------------
delimiter $$
create procedure eliminarCarrera(
in pNombre varchar(50))
begin
	if exists(select IdCarrera from carrera where Nombre = pNombre and Borrado = 0) then
		update carrera
        set Borrado = true
        where IdCarrera = (select IdCarrera from Carrera where Nombre = pNombre);
    else
        select 'ERROR: La carrera no existe';
	end if;
end $$
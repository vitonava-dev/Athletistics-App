#Autor: Yelson Monge
#Fecha: 31/05/2020
#Descripción: Los scripts del CRUD de disciplinas

#---------------------------- Insertar Disciplina --------------------------------
delimiter $$
create procedure insertarDisciplina(
in pNombre varchar(50))
begin
	if exists(select IdDisciplina from disciplina where Nombre = pNombre and Borrado = 0) then
		select 'ERROR: La disciplina ya existe';
    else
		insert into disciplina(Nombre) values(pNombre);
	end if;
end $$

#---------------------------- Ver Disciplinas --------------------------------
delimiter $$
create procedure verDisciplinas()
begin
	select Nombre from disciplina
    where Borrado = false
    order by Nombre;
end $$

#---------------------------- Modificar Disciplina --------------------------------
delimiter $$
create procedure modificarDisciplina(
in pNombre varchar(50),
in pNombreNuevo varchar(50))
begin
	if exists(select IdDisciplina from disciplina where Nombre = pNombre and Borrado = 0) then
		update disciplina
        set Nombre = pNombreNuevo
        where IdDisciplina = (select IdDisciplina from Disciplina where Nombre = pNombre);
    else
        select 'ERROR: La disciplina no existe';
	end if;
end $$


#---------------------------- Eliminar Disciplina --------------------------------
delimiter $$
create procedure eliminarDisciplina(
in pNombre varchar(50))
begin
	if exists(select IdDisciplina from disciplina where Nombre = pNombre and Borrado = 0) then
		update disciplina
        set Borrado = true
        where IdDisciplina = (select IdDisciplina from Disciplina where Nombre = pNombre);
    else
        select 'ERROR: La disciplina no existe';
	end if;
end $$
#Autor: Yelson Monge
#Fecha: 31/05/2020
#Descripción: Los scripts del CRUD de administrador
use athletistics_db;

#---------------------------- Insertar Administrador --------------------------------
delimiter $$
create procedure insertarAdministrador(
in pNombre varchar(100),
in pFechaNacimiento date,
in pTelefono int,
in pCorreo varchar(100),
in pDisciplina varchar(50))
begin
	if exists(select Nombre from Administrador where Correo = pCorreo and Borrado = 0) then
		select 'ERROR: La cuenta de corero ya existe en el sistema';
	elseif not exists (select IdDisciplina from disciplina where Nombre = pDisciplina and Borrado = 0) then
    	select 'ERROR: La disciplina no existe';
    else
		insert into Administrador(Nombre, FechaNacimiento, Telefono, Correo, IdDisciplina)
        values(pNombre, pFechaNacimiento, pTelefono, pCorreo, (select IdDisciplina from disciplina where Nombre = pDisciplina));
	end if;
end $$



#---------------------------- Consultar Administradore --------------------------------
delimiter $$
create procedure consultarAdministrador(
in pId int)
begin
	if exists(select Nombre from Administrador where pId = IdAdministrador and Borrado = 0) then
		select A.Nombre, A.FechaNacimiento as 'Fecha de Nacimiento', A.Telefono, A.Correo, D.Nombre as 'Disciplina'
		from administrador A inner join disciplina D on A.IdDisciplina = D.IdDisciplina
		where A.IdAdministrador = pId and A.Borrado = 0
		order by A.Nombre;
    else
		select 'ERROR: El administrador no existe';
	end if;
end $$


#---------------------------- Ver Administradores --------------------------------
delimiter $$
create procedure verAdministradores()
begin
	select A.Nombre, D.Nombre as 'Disciplina'
    from administrador A inner join disciplina D on A.IdDisciplina = D.IdDisciplina
    where A.Borrado = 0;
end $$


#---------------------------- Ver Todo Administradores --------------------------------
delimiter $$
create procedure verTodoAdministradores()
begin
	select A.IdAdministrador,A.Nombre, A.FechaNacimiento as 'Fecha de Nacimiento', A.Telefono, A.Correo, D.Nombre as 'Disciplina'
	from administrador A inner join disciplina D on A.IdDisciplina = D.IdDisciplina
    where A.Borrado = 0
    order by A.Nombre;
end $$


#---------------------------- Modificar Administrador --------------------------------
delimiter $$
create procedure modificarAdministrador(
in pId int,
in pTelefono int,
in pCorreo varchar(100),
in pDisciplina varchar(50))
begin
	if exists(select IdAdministrador from administrador where IdAdministrador = pId and Borrado = 0) then
		update administrador
        set Telefono = ifnull(pTelefono, Telefono),
        Correo = ifnull(pCorreo, Correo),
        IdDisciplina = ifnull((select IdDisciplina from disciplina where Nombre = pDisciplina),IdDisciplina)
        where IdAdministrador = pId and Borrado = 0;
    else
		select 'ERROR: El administrador no existe';
	end if;
end $$

#---------------------------- Eliminar Administrador --------------------------------
delimiter $$
create procedure eliminarAdministrador(
in pId int)
begin
	if exists(select Nombre from administrador where IdAdministrador = pId and Borrado = 0) then
		update administrador
        set Borrado = true
        where IdAdministrador = pId;
    else
		select 'ERROR: El administrador no existe';
	end if;
end $$

#---------------------------- Validar Login --------------------------------

delimiter $$
create procedure iniciarSesionAdministrador(
in pCorreo varchar(100),
in pContrasenna varchar(100))
begin
	if exists(select Nombre from administrador where Correo = pCorreo and Borrado = 0) then
		select A.Nombre, A.FechaNacimiento as 'Fecha de Nacimiento', A.Telefono, A.Correo, D.Nombre as 'Disciplina'
		from administrador A inner join disciplina D on A.IdDisciplina = D.IdDisciplina
        where Correo = pCorreo; #and Password = pPassword;
    else
		select 'ERROR: El administrador no existe';
	end if;
end $$


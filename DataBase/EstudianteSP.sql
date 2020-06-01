#Autor: Yelson Monge
#Fecha: 31/05/2020
#Descripción: Los scripts del CRUD de estudiante

#---------------------------- Insertar Estudiante --------------------------------
delimiter $$
create procedure insertarEstudiante(
in pCarnet int,
in pNombre varchar(100),
in pFechaNacimiento date,
in pTelefono int,
in pCorreo varchar(100),
in pAltura float,
in pPeso float,
in pCarrera varchar(50),
in pDisciplina varchar(50))
begin
	if exists(select Carnet from estudiante where Carnet = pCarnet and Borrado = 0) then
		select 'ERROR: El estudiante ya existe';
	elseif not exists (select IdCarrera from carrera where Nombre = pCarrera and Borrado = 0) then
    	select 'ERROR: La carrera no existe';
	elseif not exists (select IdDisciplina from disciplina where Nombre = pDisciplina and Borrado = 0) then
    	select 'ERROR: La disciplina no existe';
    else
		insert into estudiante(Carnet, Nombre, FechaNacimiento, Telefono, Correo, Peso, Altura, IdCarrera, IdDisciplina)
        values(pCarnet, pNombre, pFechaNacimiento, pTelefono, pCorreo, pPeso, pAltura, (select IdCarrera from carrera where Nombre = pCarrera),(select IdDisciplina from disciplina where Nombre = pDisciplina));
	end if;
end $$

#---------------------------- Consultar Estudiante --------------------------------
delimiter $$
create procedure consultarEstudiante(
in pCarnet int)
begin
	if exists(select Carnet from estudiante where Carnet = pCarnet and Borrado = 0) then
		select E.Carnet, E.Nombre, C.Nombre as 'Carrera', E.FechaNacimiento as 'Fecha de Nacimiento', E.Telefono, E.Correo, E.Altura, E.Peso 
		from estudiante E inner join carrera C on E.IdCarrera = C.IdCarrera
		where E.Carnet = pCarnet and E.Borrado = 0
		order by E.Nombre;
    else
		select 'ERROR: El estudiante no existe';
	end if;
end $$

#---------------------------- Ver Estudiantes --------------------------------
delimiter $$
create procedure verEstudiantes()
begin
	select Carnet, Nombre from estudiante
    where Borrado = 0;
end $$

#---------------------------- Ver Todo Estudiantes --------------------------------
delimiter $$
create procedure verTodoEstudiantes()
begin
	select E.Carnet, E.Nombre, C.Nombre as 'Carrera', E.FechaNacimiento as 'Fecha de Nacimiento', E.Telefono, E.Correo, E.Altura, E.Peso 
    from estudiante E inner join carrera C on E.IdCarrera = C.IdCarrera
    where E.Borrado = 0
    order by E.Nombre;
end $$

#---------------------------- Modificar Estudiante --------------------------------
delimiter $$
create procedure modificarEstudiante(
in pCarnet int,
in pTelefono int,
in pCorreo varchar(100),
in pAltura float,
in pPeso float,
in pCarrera varchar(50),
in pDisciplina varchar(50))
begin
	if exists(select Carnet from estudiante where Carnet = pCarnet and Borrado = 0) then
		update estudiante
        set Telefono = ifnull(pTelefono, Telefono),
        Correo = ifnull(pCorreo, Correo),
        Altura = ifnull(pAltura, Altura),
        Peso = ifnull(pPeso, Peso),
        IdCarrera = ifnull((select IdCarrera from carrera where Nombre = pCarrera), IdCarrera),
        IdDisciplina = ifnull((select IdDisciplina from disciplina where Nombre = pDisciplina),IdDisciplina)
        where Carnet = pCarnet and Borrado = 0;
    else
		select 'ERROR: El estudiante no existe';
	end if;
end $$

#---------------------------- Eliminar Estudiante --------------------------------
delimiter $$
create procedure eliminarEstudiante(
in pCarnet int)
begin
	if exists(select Carnet from estudiante where Carnet = pCarnet and Borrado = 0) then
		update estudiante
        set Borrado = true
        where Carnet = pCarnet;
    else
		select 'ERROR: El estudiante no existe';
	end if;
end $$

#------------------ Ver Todo Estudiantes po Disciplina -----------------------
delimiter $$
create procedure verEstudiantesPorDisciplina(
in pDisciplina varchar(50))
begin
	if exists(select IdDisciplina from disciplina where Nombre = pDisciplina) then
		select E.Carnet, E.Nombre, C.Nombre as 'Carrera', E.FechaNacimiento as 'Fecha de Nacimiento', E.Telefono, E.Correo, E.Altura, E.Peso 
		from estudiante E inner join carrera C on E.IdCarrera = C.IdCarrera
		where E.Borrado = 0 and IdDisciplina = (select IdDisciplina from disciplina where Nombre = pDisciplina)
		order by E.Nombre;
	else
		select 'ERROR: La disciplina no existe';
	end if;
end $$


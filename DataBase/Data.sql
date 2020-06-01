#Autor: Yelson Monge
#Fecha: 31/05/2020
#Descripción: Script del llenado de datos de prueba

use athletistics_db;

# Carreras
call insertarCarrera('Ing. en Computacion');
call insertarCarrera('Administracion de Empresas');
call insertarCarrera('Ing. en Produccion Industrial');
call insertarCarrera('Ing. Forestal');
call insertarCarrera('Ing. Fisica');

# Disciplinas
call insertarDisciplina('Atletismo');
call insertarDisciplina('Futbol');

# Estudiantes
# El date tiene el formato YYYY-MM-DD
call insertarEstudiante(2016089657,'Yelson Andres Monge Roa', '1998-05-11', 86215526, 'yelmonge@gmail.com', 1.83, 86.1 , 'Ing. en Computacion', 'Futbol');
call insertarEstudiante(2016200200,'Carlos Vega Lopez', '1998-08-23', 70098776, 'cali124@gmail.com', 1.73, 66.8 , 'Ing. en Computacion', 'Futbol');
call insertarEstudiante(2016089650,'Yeltsin Tejeda Valverde', '1990-08-10', 89210021, 'yeltsintejeda@gmail.com', 1.83, 86.1 , 'Ing. Fisica', 'Futbol');
call insertarEstudiante(2020123123,'Ronaldo de Asis Moreira', '1980-08-10', 70245571, 'ronaldinho@gmail.com', 1.80, 81.7 , 'Ing. en Produccion Industrial', 'Futbol');
select * from estudiante;

# Administradores
call insertarAdministrador('Gustabo Flores','1986-05-25', 54775566,'gustabogatita@gmail.com','Futbol');
call iniciarSesionAdministrador('gustabogatita@gmail.com','caca');

call verTodoAdministradores

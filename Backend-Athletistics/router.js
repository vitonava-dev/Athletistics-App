const express = require("express");
const router = express.Router();
const controlador= require("./Controlador/controlador.js");

//En esta seccion se asignan las direcciones para realizar solicitudes a la base de datos.
router.get("/Estudiantes",controlador.leerEstudiantes);

router.get("/Estudiantes/PorDisciplina",controlador.leerEstudiantesxDisciplina);

router.get("/Estudiantes/Agregar",controlador.agregarEstudiantes);

router.get("/Estudiantes/Consulta",controlador.consultaEstudiante);

router.get("/Estudiantes/Eliminar",controlador.eliminarEstudiante);


router.get("/Administradores",controlador.leerAdministradores);

router.get("/Administradores/Consulta",controlador.consultaAdministrador);

router.get("/Administradores/Eliminar",controlador.eliminarAdministrador);

router.get("/Administradores/Login",controlador.loginAdmi);

router.get("/Administradores/Agregar",controlador.agregarAdministrador);



module.exports = router;

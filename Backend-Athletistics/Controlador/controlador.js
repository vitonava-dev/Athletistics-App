
const mysql= require('mysql');
const Estudiante= require('../Modelo/Estudiante')
const Administrador= require('../Modelo/Administrador')

//Conexion con la base de datos
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'athletistics_db'
    
});

connection.connect(err =>  {
    if(err){
        console.log("Not Connected");
        return err;
    }
    console.log("Connected!");
})

//Funcion para Realizar un Login del Administrador
exports.loginAdmi= (req,res)=>{
    const{correo,contrasenna} = req.query;
    if(correo=="" || contrasenna==""){
        return res.send("Error... hay campo vacio")
    }
    else{
        const SP_LOGIN=`call iniciarSesionAdministrador('${correo}','${contrasenna}');`

        connection.query(SP_LOGIN,(err, results)=>{
            if(err){
                return res.send(err)
            }
            else{
                return res.json({
                    data: results
                })
            }
        });
    }
};

//Funcion para agregar Administrador
exports.agregarAdministrador = (req, res)=>{
    const {nombre,
        fechaNacimiento,
        telefono,
        correo,
        disciplina}=req.query;

        //console.log(fechaNacimiento)
    const administrador= new Administrador(nombre,
                                    fechaNacimiento,
                                    telefono,
                                    correo,
                                    disciplina)  
    administrador.validateUserInput();
    if(administrador.errors.length){
        return res.send(administrador.errors.toString())
    }
    else{
        const agregarAdministrador= `call insertarAdministrador('${administrador.nombre}',
                                                          '${administrador.fechaNacimiento}',
                                                          ${administrador.telefono},
                                                          '${administrador.correo}',
                                                          '${administrador.disciplina}')`; 
        //res.send('adding product');
        connection.query(agregarAdministrador,(err,results)=>{
            if(err){
                return res.send(err)
            }
            else{
                return res.send('successfully added admi')
            }
        });
    }

};

//Funcion para agregar Estudiantes
exports.agregarEstudiantes = (req, res)=>{
    const {carnet,
        nombre,
        fechaNacimiento,
        telefono,
        correo,
        altura,
        peso,
        carrera,
        disciplina}=req.query;

        //console.log(fechaNacimiento)
    const estudiante= new Estudiante(carnet,
                                    nombre,
                                    fechaNacimiento,
                                    telefono,
                                    correo,
                                    altura,
                                    peso,
                                    carrera,
                                    disciplina)  
    estudiante.validateUserInput();
    if(estudiante.errors.length){
        return res.send(estudiante.errors.toString())
    }
    else{
        const agregarEstudiante= `call insertarEstudiante('${estudiante.carnet}',
                                                          '${estudiante.nombre}',
                                                          '${estudiante.fechaNacimiento}',
                                                          ${estudiante.telefono},
                                                          '${estudiante.correo}',
                                                          ${estudiante.altura},
                                                          ${estudiante.peso},
                                                          '${estudiante.carrera}',
                                                          '${estudiante.disciplina}')`; 
        //res.send('adding product');
        connection.query(agregarEstudiante,(err,results)=>{
            if(err){
                return res.send(err)
            }
            else{
                return res.send('successfully added student')
            }
        });
    }

};


//Funcion para leer a todos los estudiantes
exports.leerEstudiantes = (req, res) => {

    const SP_VER_TODO_ESTUDIANTE=`call verTodoEstudiantes`

    connection.query(SP_VER_TODO_ESTUDIANTE,(err, results)=>{
        if(err){
            return res.send(err)
        }
        else{
            return res.json({
                data: results
            })
        }
    });

};

//Funcion para leer a todos los administradores existentes
exports.leerAdministradores = (req, res) => {

    const SP_VER_TODO_ADMINISTRADORES=`call verTodoAdministradores`

    connection.query(SP_VER_TODO_ADMINISTRADORES,(err, results)=>{
        if(err){
            return res.send(err)
        }
        else{
            return res.json({
                data: results
            })
        }
    });

};

//Funcion para leer a los estudiantes por Disciplina.
exports.leerEstudiantesxDisciplina = (req, res) => {
    const {disciplina}=req.query;
    const SP_VER_TODO_ESTUDIANTE=`call verEstudiantesPorDisciplina("${disciplina}")`

    connection.query(SP_VER_TODO_ESTUDIANTE,(err, results)=>{
        if(err){
            return res.send(err)
        }
        else{
            return res.json({
                data: results
            })
        }
    });

};

//funcion para consultar un Estudiante

exports.consultaEstudiante = (req,res)=>{
    const {carnet}=req.query;
    if(carnet==""){
        return res.send("ERROR... no hay carnet");
    }
    else{
        const SP_CONSULTA_ESTUDIANTE=`call consultarEstudiante(${carnet})`

        connection.query(SP_CONSULTA_ESTUDIANTE,(err, results)=>{
            if(err){
                return res.send(err)
            }
            else{
                return res.json({
                    data: results
                })
            }
        });
    }
};

//Funcion para consultar administrador
exports.consultaAdministrador = (req,res)=>{
    const {id}=req.query;
    if(id==""){
        return res.send("ERROR... no hay id");
    }
    else{
        const SP_CONSULTA_ADMINISTRADOR=`call consultarAdministrador(${id})`

        connection.query(SP_CONSULTA_ADMINISTRADOR,(err, results)=>{
            if(err){
                return res.send(err)
            }
            else{
                return res.json({
                    data: results
                })
            }
        });
    }
};

//Funcion Eliminar Estudiante
exports.eliminarEstudiante = (req,res)=>{
    const {carnet}=req.query;
    if(carnet==""){
        return res.send("ERROR... no hay carnet");
    }
    else{
        const SP_ELIMINAR_ESTUDIANTE=`call eliminarEstudiante(${carnet})`

        connection.query(SP_ELIMINAR_ESTUDIANTE,(err, results)=>{
            if(err){
                return res.send(err)
            }
            else{
                return res.json({
                    data: results
                })
            }
        });
    }
};


//Funcion Eliminar Administrador
exports.eliminarAdministrador = (req,res)=>{
    const {id}=req.query;
    if(id==""){
        return res.send("ERROR... no hay id");
    }
    else{
        const SP_ELIMINAR_ADMINISTRADOR=`call eliminarAdministrador(${id})`

        connection.query(SP_ELIMINAR_ADMINISTRADOR,(err, results)=>{
            if(err){
                return res.send(err)
            }
            else{
                return res.json({
                    data: results
                })
            }
        });
    }
};
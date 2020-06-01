//Entidad Estudiante
const Estudiante = function(carnet,
                            nombre,
                            fechaNacimiento,
                            telefono,
                            correo,
                            altura,
                            peso,
                            carrera,
                            disciplina
                            ){
    this.carnet=carnet;
    this.nombre=nombre;
    this.fechaNacimiento=fechaNacimiento;
    this.telefono=telefono;
    this.correo=correo;
    this.altura=altura;
    this.peso=peso;
    this.carrera=carrera;
    this.disciplina=disciplina;
    this.errors=[]
}

//Funcion para validar que no existen espacios vacios
Estudiante.prototype.validateUserInput=function(){
    if(this.carnet=="" ||
       this.nombre=="" ||
       this.fechaNacimiento=="" ||
       this.telefono=="" ||
       this.correo=="" ||
       this.altura==""||
       this.peso==""||
       this.carrera==""||
       this.disciplina==""){

        this.errors.push("ERROR.. Hay campos vacios")
    }

}



module.exports= Estudiante
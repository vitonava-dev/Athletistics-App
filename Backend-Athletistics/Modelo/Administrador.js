//Entidad Administrador
const Administrador = function(nombre,
                               fechaNacimiento,
                               telefono,
                               correo,
                               disciplina){
    this.nombre=nombre;
    this.fechaNacimiento=fechaNacimiento;
    this.telefono=telefono;
    this.correo=correo;
    this.disciplina=disciplina;
    this.errors=[];             
}
//Funcion para validar si no hay vacios.
Administrador.prototype.validateUserInput=function(){
    if(this.nombre==""||
       this.fechaNacimiento==""||
       this.telefono==""||
       this.correo==""||
       this.disciplina==""){
        this.errors.push("ERROR... Hay campos vacios");
       }
}
module.exports=Administrador
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Usuarios
    {
        public  int id_Usuario;
        public  int id_especialidad;
        public  int id_localidad;
        public  int id_provincia;
        public  int id_rol;
        public  string obra_social;
        public  string nombre;
        public  string apellido;
        public  string sexo;
        public  string nacionalidad;
        public  string direccion;
        public  string correo_electronico;
        public  string telefono;
        public  string legajo;
        public  string dni;
        public  string nombre_usuario;
        public  string contraseña;
        public  DateTime fecha_nacimiento;
        public int activo { get; set; }


        public Usuarios()
        {

            activo = 1;
        }
        public void setIdUsuario(int id)
        {
            this.id_Usuario = id;
        }
        public void setNombre(string nombre)
        {
            this.nombre = nombre;
        }



        public void setApellido(string apellido)
        {
            this.apellido = apellido;
        }

        public void setObraSocial(string obra_social)
        {
            this.obra_social = obra_social;
        }

        public void setTelefono(string telefono)
        {
            this.telefono = telefono;
        }

        public void setDni(string dni)
        {
            this.dni = dni;
        }

        public void setFechaNacimiento(DateTime fecha_nacimiento)
        {
            this.fecha_nacimiento = fecha_nacimiento;
        }

        public void setDireccion(string direccion)
        {
            this.direccion = direccion;
        }


        public int getIdUsuario()
        {
            return id_Usuario;
        }
        public string getNombre()
        {
            return nombre;
        }


        public string getApellido()
        {
            return apellido;

        }

        public string getObraSocial()
        {
            return obra_social;
        }

        public string getTelefono()
        {
            return telefono;
        }


        public string getDni()
        {
            return dni;
        }

        public DateTime getFechaNacimiento()
        {
            return fecha_nacimiento;
        }

        public string getDireccion()
        {
            return direccion;
        }

        public int getProvincia()
        {
            return id_provincia;
        }



    }
}

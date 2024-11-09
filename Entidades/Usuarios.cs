using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Usuarios
    {
        private int id_Usuario;
        private int id_especialidad;
        private int id_localidad;
        private int id_provincia;
        private int id_rol;
        private string obra_social;
        private string nombre;
        private string apellido;
        private string sexo;
        private string nacionalidad;
        private string direccion;
        private string correo_electronico;
        private string telefono;
        private string legajo;
        private string dni;
        private string nombre_usuario;
        private string contraseña;
        private DateTime fecha_nacimiento;






        public Usuarios()
        {

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



    }
}

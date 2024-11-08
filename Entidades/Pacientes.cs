using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    internal class Pacientes
    {
        private string nombre;
        private string apellido;
        private string obra_social;
        private string telefono;
        private string dni;
        private DateTime fecha_nacimiento;
        private string direccion;
        private DateTime fecha_baja;




        public Pacientes()
        {

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


        public void setFechaBaja(DateTime fecha_baja)
        {
            this.fecha_baja = fecha_baja;
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

        public DateTime getFechaBaja()
        {
            return fecha_baja;
        }


    }

}

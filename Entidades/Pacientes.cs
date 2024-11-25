using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Pacientes
    {
        public string nombre;
        public string apellido;
        public string telefono;
        public string dni;
        public string sexo;
        public string nacionalidad;
        public string correo_electronico;
        public DateTime fecha_nacimiento;
        public string direccion;
        public int id_paciente;
        public int id_localidad;
        public int id_provincia;
        public int activo { get; set; }




        public Pacientes()
        {
            //cuando se crea el paciente, ya esta activo
            activo = 1 ;
        }

        public void setNombre(string nombre)
        {
            this.nombre = nombre;
        }

        public void setApellido(string apellido)
        {
            this.apellido = apellido;
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

        public void setNacionalidad( string nacionalidad)
        {
            this.nacionalidad = nacionalidad;
        }

        public void setSexo(string sexo)
        {
            this.sexo = sexo;
        }

        public void setCorreoElectronico (string correoElectronico)
        {
            this.correo_electronico = correoElectronico;
        }

        public void setId_Localidad (int  id_localidad)
        {
            this.id_localidad = id_localidad;
        }
        public void setId_Provincia(int id_provincia)
        {
            this.id_provincia = id_provincia;
        }

        public void setId_Paciente (int id_paciente)
        {
            this.id_paciente = id_paciente;
        }



        public string getNombre()
        {
            return nombre;
        }


        public string getApellido()
        {
            return apellido;
            
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


        public int getIdLocalidad()
        {
            return id_localidad;
        }

        public int getIdProvincia()
        {
            return id_provincia;
        }

        public string getNacionalidad()
        {
            return nacionalidad;
        }

        public string getSexo()
        { return sexo;}

        public string getCorreoElectronico()
        {
            return correo_electronico;
        }

        public int getIdPaciente()
        {
            return id_paciente;
        }




    }

}

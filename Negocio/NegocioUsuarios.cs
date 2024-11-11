using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using DATOS;
using Entidades;

namespace Negocio
{
    public class NegocioUsuarios
    {
        DatosUsuarios dts = new DatosUsuarios();
        DatosPacientes dps = new DatosPacientes();

        public Boolean verificarUsuario(string usuario)
        {
            return dts.verificarUsuario(usuario);


        }


        public Boolean verificarContraseña(string usuario,string contraseña)
        {
            return dts.verificarContraseña(usuario,contraseña);


        }


        public (string nombre, int id) traerNombre_Rol(string usuario, string contraseña)
        {
            return dts.traerNombre_Rol(usuario, contraseña);


        }


        public DataSet obtenerTablaMedicos()
        {
            return dts.obtenerTablaMedicos();


        }


        public DataSet traerDiasHorarios(int idMedico)
        {
            return dts.traerDiasHorarios(idMedico);


        }


        public DataSet obtenerDatosMedicos(string idMedico)
        {
            return dts.obtenerDatosMedicos(idMedico);


        }
        public bool EliminarMedico(int id)
        {
            DatosUsuarios du = new DatosUsuarios();
            Usuarios us = new Usuarios();
            us.setIdUsuario(id);
            int op = du.EliminarMed(us);
            if (op == 1)
                return true;
            else
                return false;
        }

        public bool AltaMedicos(int idProvincia, int idLocalidad, int idEspecialidad, int idRol, string dni, string legajo, string nombre, string apellido, string sexo, string nacionalidad, string direccion, string correoElectronico, string telefono, string nombre_usuario, string contraseña)
        {
            DatosUsuarios ds = new DatosUsuarios();
            Usuarios usuario = new Usuarios
            {
                id_provincia = idProvincia,
                id_localidad = idLocalidad,
                id_especialidad = idEspecialidad,
                id_rol = idRol,
                dni = dni,
                legajo = legajo,
                nombre = nombre,
                apellido = apellido,
                sexo = sexo,
                nacionalidad = nacionalidad,
                direccion = direccion,
                correo_electronico = correoElectronico,
                telefono = telefono,
                nombre_usuario = nombre_usuario,
                contraseña = contraseña
            };

            // Aquí puedes agregar cualquier otra validación necesaria
            if (string.IsNullOrWhiteSpace(nombre) || string.IsNullOrWhiteSpace(apellido))
            {
                Console.WriteLine("El nombre y el apellido son obligatorios.");
                return false;
            }

            if (dni.Length != 8)
            {
                Console.WriteLine("El DNI debe tener 8 caracteres.");
                return false;
            }

            return ds.AgregarMedico(usuario) == 1;
        }

        public DataTable ObtenerProvincias()
        {
            return dps.ObtenerProvincias();
        }

        public DataTable ObtenerLocalidades(int idProvincia)
        {
            return dps.ObtenerLocalidades(idProvincia);
        }

        public DataTable ObtenerRoles()
        {
            return dts.ObtenerRoles();
        }









    }
}

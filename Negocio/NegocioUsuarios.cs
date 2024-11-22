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

        public int TraerID(string usuario)
        {
            return dts.TraerIdUsuario(usuario);
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

        public int AltaMedicos(int idProvincia, int idLocalidad, int idEspecialidad, int idRol, string dni, string nombre, string apellido, string sexo, string nacionalidad, string direccion, string legajo, string correoElectronico, string telefono, string nombre_usuario, string contraseña)
        {
            Console.WriteLine("Valor de legajo en negocio: " + legajo);

            DatosUsuarios ds = new DatosUsuarios();
            Usuarios usuario = new Usuarios
            {
                id_provincia = idProvincia,
                id_localidad = idLocalidad,
                id_especialidad = idEspecialidad,
                id_rol = idRol,
                dni = dni,
                nombre = nombre,
                apellido = apellido,
                sexo = sexo,
                nacionalidad = nacionalidad,
                direccion = direccion,
                legajo = legajo,
                correo_electronico = correoElectronico,
                telefono = telefono,
                nombre_usuario = nombre_usuario,
                contraseña = contraseña
            };

            // Aquí puedes agregar cualquier otra validación necesaria
            if (string.IsNullOrWhiteSpace(nombre) || string.IsNullOrWhiteSpace(apellido))
            {
                Console.WriteLine("El nombre y el apellido son obligatorios.");
                return -1;
            }

            if (dni.Length != 8)
            {
                Console.WriteLine("El DNI debe tener 8 caracteres.");
                return -1;
            }

            return ds.AgregarMedico(usuario);
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




        public DataSet medicosFiltrados(string legajo,string apellido,string especialidad)
        {
            return dts.medicosFiltrados(legajo,apellido,especialidad);


        }


        public Boolean medicoEditado(string id, string idEspecialidad, string idProvincia, string idLocalidad, string nombre, string apellido, string sexo, string nacionalidad, string direccion, string correo, string telefono, string legajo, string dni)
        {
            int filasAfectadas = dts.medicoEditado(id, idEspecialidad, idProvincia, idLocalidad, nombre, apellido, sexo, nacionalidad, direccion, correo, telefono, legajo, dni);
            if (filasAfectadas > 0)
            {
            return true;

            }
            return false;

        }

        public DataSet selectMedicosPorEspecialidad(string idEspecialidad)
        {
            return dts.selectMedicosPorEspecialidad(idEspecialidad);


        }


        //Falopeada de Fran pero que si les copa dejenla (es para saber la especialidad del medico porque no me acordaba
        //cual era cual)
        public string ObtenerEspecialidadMedico(int idUsuario)
        {
            DatosUsuarios datosMedicos = new DatosUsuarios();
            return datosMedicos.ObtenerEspecialidad(idUsuario);
        }




    }
}

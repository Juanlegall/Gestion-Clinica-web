using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DATOS;
using Entidades;

namespace Negocio
{
    public class NegocioUsuarios
    {
        DatosUsuarios dts = new DatosUsuarios();

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






    }
}

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DATOS;

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










    }
}

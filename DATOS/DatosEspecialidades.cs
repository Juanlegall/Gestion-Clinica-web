using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DATOS
{
    public class DatosEspecialidades
    {
        Conexion accesoDatos = new Conexion();
        public DataSet obtenerEspecialidades()
        {
            DataSet ds = new DataSet();
            string consulta = $"select id_especialidad , nombre_especialidad as especialidad from especialidades";
            ds = accesoDatos.getData(consulta);

            return ds;


        } 
    }
}

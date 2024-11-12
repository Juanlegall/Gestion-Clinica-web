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

        public DataTable ObtenerEspecialidades()
        {
            string consulta = "SELECT id_especialidad, nombre_especialidad FROM Especialidades";
            DataSet ds = accesoDatos.getData(consulta);
            return ds.Tables[0]; // Devolver la primera tabla
        }

    }
}

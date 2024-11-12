using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DATOS
{
    public class DatosProvincias
    {

        Conexion accesoDatos = new Conexion();
        public DataSet obtenerProvincias()
        {
            DataSet ds = new DataSet();
            string consulta = $"select id_provincia , nombre_provincia as provincia from provincias";
            ds = accesoDatos.getData(consulta);

            return ds;


        }
    }
}

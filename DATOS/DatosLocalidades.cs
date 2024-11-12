using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DATOS

{
public class DatosLocalidades
{
    Conexion accesoDatos = new Conexion();
    public DataSet obtenerLocalidades()
    {
        DataSet ds = new DataSet();
        string consulta = $"select id_localidad , nombre_localidad as localidad from localidades";
        ds = accesoDatos.getData(consulta);

        return ds;


    }
}

}



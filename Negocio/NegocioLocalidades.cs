using DATOS;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DATOS;

namespace Negocio
{
    public class NegocioLocalidades
    {
        DatosLocalidades dt = new DatosLocalidades();

        public DataSet obtenerLocalidades()
        {
            return dt.obtenerLocalidades();


        }
    }
}

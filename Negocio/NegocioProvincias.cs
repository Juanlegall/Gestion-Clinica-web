using DATOS;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioProvincias
    {

        DatosProvincias dtp = new DatosProvincias();
        
        public DataSet obtenerProvincias()
        {
            return dtp.obtenerProvincias();


        }
    }
}

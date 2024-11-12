using DATOS;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioEspecialidades
    {

        DatosEspecialidades des = new DatosEspecialidades();
        public DataTable ObtenerEspecialidades()
        {
            return des.ObtenerEspecialidades();
        }
    }
}

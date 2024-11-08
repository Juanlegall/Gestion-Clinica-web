using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    internal class Roles
    {
        private string nombre;
        private DateTime fecha_baja;

        public Roles()
        {

        }

        public void setNombre(string nombre)
        {
            this.nombre = nombre;
        }

        public void setFechaBaja(DateTime fecha)
        {
            this.fecha_baja = fecha;
        }

        public string getNombre()
        {
            return nombre;
        }

        public DateTime getFechaBaja()
        {
            return fecha_baja;
        }
    }
}

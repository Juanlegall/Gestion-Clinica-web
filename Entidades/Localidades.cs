using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    internal class Localidades
    {
        private string nombreLocalidad;

        public Localidades()
        {

        }

        public void setNombre(string nombre)
        {
            this.nombreLocalidad = nombre;
        }

        public string getNombre()
        {
            return nombreLocalidad;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    internal class Especialidades
    {
        private string nombreEspecialidad;
       
        public Especialidades()
        {

        }

        public void setNombre(string nombre)
        {
            this.nombreEspecialidad = nombre;
        }

        public string getNombre()
        {
            return nombreEspecialidad;
        }

    }
}

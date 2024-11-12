using DATOS;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioHorariosMedicos
    {
        private DatosHorariosMedicos dHorario= new DatosHorariosMedicos();

        public void AltaHorario(HorariosMedicos horario)
        {
            dHorario.AgregarHorario(horario);
        }
    }
}

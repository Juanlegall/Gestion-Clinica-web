using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class HorariosMedicos
    {
        private int id_horario_medico;
        private int id_medico;
        private string dias;
        private TimeSpan horaInicio;
        private TimeSpan horaFin;

        public int Id_horario_medico { get => id_horario_medico; set => id_horario_medico = value; }
        public int Id_medico { get => id_medico; set => id_medico = value; }
        public string Dias { get => dias; set => dias = value; }
        public TimeSpan HoraInicio { get => horaInicio; set => horaInicio = value; }
        public TimeSpan HoraFin { get => horaFin; set => horaFin = value; }
    }
}

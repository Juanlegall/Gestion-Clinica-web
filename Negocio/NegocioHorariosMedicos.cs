using DATOS;
using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioHorariosMedicos
    {
        private DatosHorariosMedicos dHorario = new DatosHorariosMedicos();

        public void AltaHorario(List<HorariosMedicos> listaHorarios,int idMedico)
        {

            foreach (HorariosMedicos horario in listaHorarios)
            {
                dHorario.AgregarHorario(horario, idMedico);
            }
        }


        public DataSet traerHorariosPorDia(string diaSemana , string idMedico, string fechaSeleccionada)
        {

            DataSet ds = dHorario.traerHorariosPorDia(diaSemana, idMedico,fechaSeleccionada);
            return ds;
        }

        



    }
}

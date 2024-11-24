using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DATOS;
using Entidades;
using System.Collections;
using System.Data;

namespace Negocio
{
    public class NegocioTurnos
    {
        DatosTurnos datos = new DatosTurnos();

        public string obtenerDatosPresentismo(int anio)
        {
            DataTable datosPresentismo = datos.obtenerPresentismoTurnos(anio).Tables[0];
            string strDatos;
            strDatos = "[['Presentismo', 'Total'],";

            //Formato de tabla para el grafico
            foreach (DataRow dr in datosPresentismo.Rows)
            {
                strDatos = strDatos + "[";
                strDatos = strDatos + "'"+ dr[0] + "',"+ dr[1];
                strDatos = strDatos + "],";
            }
            strDatos = strDatos + "]";
            return strDatos;
        }


        public string obtenerDatosEspecialides(int anio)
        {
            DataTable datosPresentismo = datos.obtenerEspecialidadTurnos(anio).Tables[0];

            string strDatos;
            strDatos = "[['Especialidades', 'Total'],";

            //Formato de tabla para el grafico
            foreach (DataRow dr in datosPresentismo.Rows)
            {
                strDatos = strDatos + "[";
                strDatos = strDatos + "'" + dr[0] + "'," + dr[1];
                strDatos = strDatos + "],";
            }
            strDatos = strDatos + "]";
            return strDatos;
        }

        public DataSet obtenerAniosCargados() /*obtener los años de los turnos cargados*/
        {
            return datos.obtenerAniosCargados();
        }

        public int agregarTurno(string idPaciente, string idMedico, string fechaSeleccionada, string horaSeleccionada, string obs)
        {
            int filasAfectadas = datos.agregarTurno(idPaciente,idMedico,fechaSeleccionada,horaSeleccionada,obs);
            return filasAfectadas;
        }
        public void actualizarPresente(bool realizado, int IdTurno)
        {
            datos.actualizarPresente(realizado, IdTurno);
        }

        public bool GuardarObservacionTurno(int idTurno, string titulo)
        {
            if (idTurno <= 0 || string.IsNullOrWhiteSpace(titulo))
            {
                return false; // Valida que los datos sean válidos
            }

            datos.ActualizarObservacionTurno(idTurno, titulo);
            return true; // Indica éxito
        }


    }
}

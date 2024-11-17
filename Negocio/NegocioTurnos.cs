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

        public string obtenerDatosPresentismo()
        {
            DataTable datosPresentismo = datos.obtenerPresentismoTurnos().Tables[0];
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

        public string obtenerDatosEspecialides()
        {
            DataTable datosPresentismo = datos.obtenerEspecialidadTurnos().Tables[0];
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
    }
}

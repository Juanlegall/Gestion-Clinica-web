using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace DATOS
{
    public class DatosHorariosMedicos
    {
        Conexion con = new Conexion();

        public int AgregarHorario(HorariosMedicos hm)
        {
            using (SqlConnection conexion = con.obtenerConexion())
            {
                //conexion.Open();
                using (SqlCommand comando = new SqlCommand("SP_Horario", conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    ArmarParametrosHorarioAgregar(comando, hm);

                    return comando.ExecuteNonQuery();
                }
            }
        }
        private void ArmarParametrosHorarioAgregar(SqlCommand comando, HorariosMedicos hm)
        {
            comando.Parameters.Add("@dias", SqlDbType.VarChar, 10).Value = hm.Dias;
            comando.Parameters.Add("@HorarioInicio", SqlDbType.Time).Value = hm.HoraInicio;
            comando.Parameters.Add("@HorarioFin", SqlDbType.Time).Value = hm.HoraFin;
        }
    }
}

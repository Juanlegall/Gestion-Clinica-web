using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Microsoft.SqlServer.Server;

namespace DATOS
{
    public class DatosHorariosMedicos
    {
        Conexion con = new Conexion();

        public int AgregarHorario(HorariosMedicos hm,int idMedico)
        {
            using (SqlConnection conexion = con.obtenerConexion())
            {   
                //conexion.Open();
                using (SqlCommand comando = new SqlCommand("SP_Horario", conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    ArmarParametrosHorarioAgregar(comando, hm,idMedico);

                   comando.ExecuteNonQuery();

                    return idMedico;
                }
            }
        }
        private void ArmarParametrosHorarioAgregar(SqlCommand comando, HorariosMedicos hm,int idMedico)
        {
            comando.Parameters.Add("@id_usuario", SqlDbType.Int).Value = idMedico;
            comando.Parameters.Add("@dias", SqlDbType.VarChar, 10).Value = hm.Dias;
            comando.Parameters.Add("@HorarioInicio", SqlDbType.Time).Value = hm.HoraInicio;
            comando.Parameters.Add("@HorarioFin", SqlDbType.Time).Value = hm.HoraFin;
        }

        public DataSet traerHorariosPorDia(string diaSemana,string idMedico,string fechaSeleccionada)
        {
            string consulta = $"select fh.Hora horario_libre " +
                $"from HorariosMedicos hm " +
                $"cross apply (SELECT Hora FROM franja_horaria(hm.horario_inicio, hm.horario_fin)) as fh " +
                $"left join turnos t on t.hora_consulta = fh.Hora and t.fecha_consulta = '{fechaSeleccionada}' " +
                $"where hm.id_usuario_HM = {idMedico} and dias = '{diaSemana}'  and t.hora_consulta is null";

            DataSet ds = con.getData(consulta);
            return ds;
        }




    }
}

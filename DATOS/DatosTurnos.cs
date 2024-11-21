using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entidades;
using System.Collections;

namespace DATOS
{
    public class DatosTurnos
    {
        Conexion cn = new Conexion();

        public DataSet obtenerPresentismoTurnos()
        {
            DataSet ds = new DataSet();
            string consulta = "SELECT CASE " +
                "WHEN realizado_t = 1 THEN 'Presente' " +
                "WHEN realizado_t = 0 THEN 'Ausente' " +
                "ELSE 'Desconocido'" +
                "END AS Estado, COUNT(realizado_t) AS Total FROM Turnos GROUP BY realizado_t ORDER BY Total";
            ds = cn.getData(consulta);

            return ds;
        }

        public DataSet obtenerEspecialidadTurnos()
        {
            DataSet ds = new DataSet();
            string consulta = "SELECT e.nombre_especialidad AS Especialidad, COUNT(t.id_turno) AS Total FROM Turnos t INNER JOIN Usuarios u ON t.id_usuario_t = u.id_usuario " +
                "INNER JOIN Especialidades e ON u.id_especialidad_us = e.id_especialidad " +
                "GROUP BY e.nombre_especialidad ORDER BY Total";
            ds = cn.getData(consulta);

            return ds;
        }


        public int agregarTurno(string idPaciente,string idMedico,string fechaSeleccionada,string horaSeleccionada,string obs)
        {
            string consulta = $"insert into turnos (id_paciente_t,id_usuario_t,fecha_consulta,hora_consulta,observaciones) " +
                $"select {idPaciente},{idMedico}, '{fechaSeleccionada}','{horaSeleccionada}','{obs}'";
                 return cn.execute(consulta);

        }
        public void actualizarPresente(bool realizado, int IdTurno)
        {
            string consulta = $"update Turnos set realizado_t = '{realizado}' where id_turno = {IdTurno}";
            cn.getData(consulta);
        }

    }
}

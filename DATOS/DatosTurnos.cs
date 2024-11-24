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

        public DataSet obtenerPresentismoTurnos(int anio)
        {
            DataSet ds = new DataSet();
            string consulta = "";
            if (anio > 0)
            {
                /*consulta con año*/
                consulta = $"SELECT CASE WHEN realizado_t = 1 THEN 'Presente' WHEN realizado_t = 0 THEN 'Ausente' ELSE 'Desconocido' END AS Estado, COUNT(realizado_t) AS Total FROM Turnos WHERE YEAR(fecha_consulta) = {anio} GROUP BY realizado_t ORDER BY Total";
            }
            else
            {
                /*consulta sin año*/
                consulta = $"SELECT CASE WHEN realizado_t = 1 THEN 'Presente' WHEN realizado_t = 0 THEN 'Ausente' ELSE 'Desconocido' END AS Estado, COUNT(realizado_t) AS Total FROM Turnos GROUP BY realizado_t ORDER BY Total";
            }
            ds = cn.getData(consulta);

            return ds;
        }

        public DataSet obtenerEspecialidadTurnos(int anio)
        {
            DataSet ds = new DataSet();
            string consulta ="";
            if (anio > 0)
            {
                /*consulta con año*/
                consulta = $"SELECT e.nombre_especialidad AS Especialidad, COUNT(t.id_turno) AS Total FROM Turnos t INNER JOIN Usuarios u ON t.id_usuario_t = u.id_usuario INNER JOIN Especialidades e ON u.id_especialidad_us = e.id_especialidad WHERE YEAR(t.fecha_consulta) = {anio} GROUP BY e.nombre_especialidad";
            }
            else
            {
                /*consulta sin año*/
                consulta = "SELECT e.nombre_especialidad AS Especialidad, COUNT(t.id_turno) AS Total FROM Turnos t INNER JOIN Usuarios u ON t.id_usuario_t = u.id_usuario INNER JOIN Especialidades e ON u.id_especialidad_us = e.id_especialidad GROUP BY e.nombre_especialidad ";
            }
            ds = cn.getData(consulta);

            return ds;
        }

        public DataSet obtenerAniosCargados()
        {
            DataSet ds = new DataSet();
            string consulta = "SELECT DISTINCT YEAR(fecha_consulta) AS Año FROM Turnos ORDER BY Año ";
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

        public void ActualizarObservacionTurno(int idTurno, string titulo)
        {
            using (SqlConnection conexion = cn.obtenerConexion())
            {
                // Usamos un bloque `using` para asegurar que la conexión se cierre
                using (SqlCommand comando = new SqlCommand("UPDATE Turnos SET observaciones = @Titulo WHERE id_turno = @IdTurno", conexion))
                {
                    // Definir parámetros
                    comando.Parameters.Add("@Titulo", SqlDbType.VarChar).Value = titulo;
                    comando.Parameters.Add("@IdTurno", SqlDbType.Int).Value = idTurno;

                    // Ejecutar la consulta
                    comando.ExecuteNonQuery();
                }
            }
        }

        public void InsertarObservacion(string idElemento, string titulo, string descripcion)
        {
            string query = "INSERT INTO Observaciones (IdElemento, Titulo, Descripcion) VALUES (@Id, @Titulo, @Descripcion)";

            using (SqlConnection conexion = cn.obtenerConexion()) // Conexión obtenida desde tu clase Conexion
            {
                using (SqlCommand cmd = new SqlCommand(query, conexion))
                {
                    // Configuramos los parámetros
                    cmd.Parameters.AddWithValue("@Id", idElemento);
                    cmd.Parameters.AddWithValue("@Titulo", titulo);
                    cmd.Parameters.AddWithValue("@Descripcion", descripcion);

                    // Ejecutamos la consulta
                    cmd.ExecuteNonQuery();
                }
            }
        }



    }
}

using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DATOS
{
    public class Conexion
    {
        private string ruta = "Data Source=EMARD\\SQLEXPRESS;Initial Catalog=TP_FINAL;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

        public SqlConnection obtenerConexion()
        {
            SqlConnection conexion = new SqlConnection(ruta);
            try
            {
                conexion.Open();
                return conexion;

            }
            catch
            {
                return null;
            }
        }

        public int execute(string consulta) // ES PARA LOS INSERT Y LOS DELETE
        {
            SqlConnection conexion = obtenerConexion();

            try
            {
                SqlCommand comando = new SqlCommand(consulta, conexion);
                int filasAfectadas = comando.ExecuteNonQuery();

                return filasAfectadas;

            }
            catch (Exception ex)
            {

            }

            return 0;

        }
        

        public DataSet getData(string consulta) // Es para los select
        {

            DataSet ds = new DataSet();
            SqlConnection conexion = obtenerConexion();

            try
            {
                SqlDataAdapter adapter = new SqlDataAdapter(consulta, conexion);
                adapter.Fill(ds); // Llenamos el DataSet con los datos de la consulta
                return ds;
            }
            catch (Exception ex)
            {

                Console.WriteLine(ex.Message);
            }
            finally
            {
                conexion.Close();
            }

            return ds;
        }

        public DataSet getData(SqlCommand cmd) // Modificado para aceptar SqlCommand
        {
            DataSet ds = new DataSet();
            SqlConnection conexion = obtenerConexion();

            try
            {
                cmd.Connection = conexion;
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(ds); // Llenamos el DataSet con los datos de la consulta
                return ds;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                conexion.Close();
            }

            return ds;
        }



        public Boolean existe(string consulta)
        {
            Boolean estado = false;
            SqlConnection conexion = obtenerConexion();
            SqlCommand comando = new SqlCommand(consulta, conexion);
            SqlDataReader datos = comando.ExecuteReader();
            if (datos.Read())//si encuentra un registros para leer
            {
                estado = true;
            }

            return estado;

        }

        public SqlDataAdapter Adapter(string consulta, SqlConnection cn)
        {
            if (cn == null || cn.State != ConnectionState.Open)
            {
                throw new Exception("Conexión no válida.");
            }

            try
            {
                return new SqlDataAdapter(consulta, cn);
            }
            catch (Exception ex)
            {
                throw new Exception("Error al crear el adaptador: " + ex.Message);
            }
        }
        public int ExecProceAlmace(SqlCommand comando, string nombreSP)
        {
            int FilasCambiadas;
            SqlConnection conexion = obtenerConexion();
            SqlCommand cmd = new SqlCommand();
            cmd = comando;
            cmd.Connection = conexion;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = nombreSP;
            FilasCambiadas = cmd.ExecuteNonQuery();
            conexion.Close();
            return FilasCambiadas;
        }




    }
}

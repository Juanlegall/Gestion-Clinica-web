using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace DATOS
{
    public class DatosPacientes
    {
        Conexion accesoDatos = new Conexion();

        public DataSet ObtenerTablaPacientes()
        {
            DataSet ds = new DataSet();
            string consulta = "SELECT p.id_paciente AS idPaciente, p.nombre_p AS nombre, p.apellido_p AS apellido, p.dni_p AS dni, p.sexo_p AS sexo, p.nacionalidad, p.direccion, p.correo_electronico AS correo, p.telefono, p.fecha_nacimiento_p AS fechaNacimiento, prov.nombre_provincia AS provincia, loc.nombre_localidad AS localidad FROM Pacientes AS p INNER JOIN Provincias AS prov ON prov.id_provincia = p.id_provincia_P INNER JOIN Localidades AS loc ON loc.id_localidad = p.id_localidad_P";

            // Obteniendo el conjunto de datos
            ds = accesoDatos.getData(consulta);

            // Devuelve el DataSet
            return ds;
        }

        private void ArmarParametrosPacienteAgregar(SqlCommand comando, Pacientes paciente)
        {
            comando.Parameters.Add("@id_provincia_P", SqlDbType.Int).Value = paciente.id_provincia;
            comando.Parameters.Add("@id_localidad_P", SqlDbType.Int).Value = paciente.id_localidad;
            comando.Parameters.Add("@dni_p", SqlDbType.VarChar).Value = paciente.dni;
            comando.Parameters.Add("@nombre_p", SqlDbType.VarChar).Value = paciente.nombre;
            comando.Parameters.Add("@apellido_p", SqlDbType.VarChar).Value = paciente.apellido;
            comando.Parameters.Add("@sexo_p", SqlDbType.VarChar).Value = paciente.sexo;
            comando.Parameters.Add("@nacionalidad", SqlDbType.VarChar).Value = paciente.nacionalidad;
            comando.Parameters.Add("@direccion", SqlDbType.VarChar).Value = paciente.direccion;
            comando.Parameters.Add("@correo_electronico", SqlDbType.VarChar).Value = paciente.correo_electronico;
            comando.Parameters.Add("@telefono", SqlDbType.VarChar).Value = paciente.telefono;
            comando.Parameters.Add("@fecha_nacimiento_p", SqlDbType.Date).Value = paciente.fecha_nacimiento;
        }

        public int AgregarPaciente(Pacientes paciente)
        {
            using (SqlConnection conexion = accesoDatos.obtenerConexion())
            {
                //conexion.Open();
                using (SqlCommand comando = new SqlCommand("SP_AgregarPaciente", conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    ArmarParametrosPacienteAgregar(comando, paciente);

                    return comando.ExecuteNonQuery();
                }
            }
        }
    





        public DataTable ObtenerProvincias()
        {
            string consulta = "SELECT id_provincia, nombre_provincia FROM Provincias";
            DataSet ds = accesoDatos.getData(consulta);
            return ds.Tables[0]; // Devolver la primera tabla
        }

        public DataTable ObtenerLocalidades(int idProvincia)
        {
            string consulta = "SELECT id_localidad, nombre_localidad FROM Localidades WHERE id_provincia = @idProvincia";
            SqlCommand cmd = new SqlCommand(consulta);
            cmd.Parameters.AddWithValue("@idProvincia", idProvincia);

            DataSet ds = accesoDatos.getData(cmd);
            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                return ds.Tables[0];
            }
            return null;
        }
        private void ArmaraParametrosPacienteEliminar(ref SqlCommand comando, Pacientes pa)
        {
            SqlParameter sqlparametros = new SqlParameter();
            sqlparametros = comando.Parameters.Add("@idpaciente", SqlDbType.Int);
            sqlparametros.Value = pa.getIdPaciente();
        }
        public int EliminarPac(Pacientes pa)
        {
            SqlCommand comando = new SqlCommand();
            ArmaraParametrosPacienteEliminar(ref comando, pa);
            return accesoDatos.ExecProceAlmace(comando, "SP_EliminarPaciente");

        }
        public DataSet ObtenerPacientesPorDni(string dni)
        {
            DataSet ds = new DataSet();
            string consulta = "SELECT p.id_paciente AS idPaciente, p.nombre_p AS nombre, p.apellido_p AS apellido, p.dni_p AS dni, " +
                              "p.sexo_p AS sexo, p.nacionalidad, p.direccion, p.correo_electronico AS correo, p.telefono, " +
                              "p.fecha_nacimiento_p AS fechaNacimiento, prov.nombre_provincia AS provincia, loc.nombre_localidad AS localidad " +
                              "FROM Pacientes AS p " +
                              "INNER JOIN Provincias AS prov ON prov.id_provincia = p.id_provincia_P " +
                              "INNER JOIN Localidades AS loc ON loc.id_localidad = p.id_localidad_P " +
                              "WHERE p.dni_p LIKE @dni";

            SqlCommand cmd = new SqlCommand(consulta);
            cmd.Parameters.AddWithValue("@dni", "%" + dni + "%"); // Uso de LIKE para que el filtro sea flexible (por ejemplo, DNI parcial)

            ds = accesoDatos.getData(cmd);
            return ds;
        }
        public DataSet ObtenerDatosPacientes(string id)
        {
            DataSet ds = new DataSet();
            string consulta = $"SELECT p.id_paciente AS idPaciente, p.nombre_p AS nombre, p.apellido_p AS apellido, p.dni_p AS dni, p.sexo_p AS sexo, p.nacionalidad, p.direccion, p.correo_electronico AS correo, p.telefono, p.fecha_nacimiento_p AS fechaNacimiento, prov.nombre_provincia AS provincia, loc.nombre_localidad AS localidad FROM Pacientes AS p INNER JOIN Provincias AS prov ON prov.id_provincia = p.id_provincia_P INNER JOIN Localidades AS loc ON loc.id_localidad = p.id_localidad_P where p.id_paciente = {id}";

            // Obteniendo el conjunto de datos
            ds = accesoDatos.getData(consulta);

            // Devuelve el DataSet
            return ds;
        }
    }
    
}

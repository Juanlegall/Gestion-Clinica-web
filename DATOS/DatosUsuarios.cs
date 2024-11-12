using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Collections;

namespace DATOS
{
    public class DatosUsuarios
    {
        Conexion accesoDatos = new Conexion();
        public Boolean verificarUsuario(string usuario)
        {
            string consulta = $"Select * from usuarios where nombre_usuario = '{usuario}'";
            return accesoDatos.existe(consulta);

        }

        public Boolean verificarContraseña(string usuario , string contraseña)
        {
            string consulta = $"Select * from usuarios where nombre_usuario = '{usuario}' and contraseña COLLATE Latin1_General_CS_AS = '{contraseña}'";
            return accesoDatos.existe(consulta);


        }


        public (string nombre, int id) traerNombre_Rol(string usuario, string contraseña)
        {
            DataSet ds = new DataSet();
            string consulta = $"Select nombre,id_rol_us from usuarios where nombre_usuario = '{usuario}' and contraseña COLLATE Latin1_General_CS_AS = '{contraseña}'";
            ds = accesoDatos.getData(consulta);
            if (ds.Tables[0].Rows.Count > 0)
            {
                string nombre = ds.Tables[0].Rows[0]["nombre"].ToString();
                int id = Convert.ToInt32(ds.Tables[0].Rows[0]["id_rol_us"]);
                return (nombre, id);
            }
            else
            {
                return (string.Empty, 0);
            }


        }




        public DataSet obtenerTablaMedicos()
        {
            DataSet ds = new DataSet();
            string consulta = $"select id_usuario as idMedico, nombre , apellido ,legajo , p.nombre_provincia as provincia, lo.nombre_localidad as localidad , es.nombre_especialidad as especialidad from usuarios inner join provincias as p on p.id_provincia = id_provincia_us inner join localidades as lo on lo.id_localidad =id_localidad_us inner join Especialidades as es on es.id_especialidad = id_especialidad_us where id_rol_us = 2";
            ds = accesoDatos.getData(consulta);
            return ds;

        }




        public DataSet traerDiasHorarios(int idMedico)
        {
            DataSet ds = new DataSet();
            string consulta = $"SELECT CONCAT(LTRIM(RTRIM(dias)), ' ', LTRIM(RTRIM(horario_inicio)), '-', LTRIM(RTRIM(horario_fin))) AS DiasHorarios FROM HorariosMedicos INNER JOIN usuarios AS us ON us.id_usuario = id_usuario_HM WHERE us.id_usuario = '{idMedico}'";
            ds = accesoDatos.getData(consulta);

            return ds;


        }


        public DataSet obtenerDatosMedicos(string idMedico)
        {
            DataSet ds = new DataSet();
            string consulta = $"select nombre , apellido , sexo ,  nacionalidad , direccion , correo_electronico , telefono , legajo , dni , id_especialidad_us as idEspecialidad,es.nombre_especialidad as especialidad,id_provincia_us as idProvincia ,pr.nombre_provincia as provincia , id_localidad_us as idLocalidad, lo.nombre_localidad as localidad from usuarios inner join especialidades as es on es.id_especialidad = id_especialidad_us inner join localidades as lo on lo.id_provincia = id_provincia_us and lo.id_localidad = id_localidad_us inner join provincias as pr on pr.id_provincia = id_provincia_us where id_usuario = {idMedico}";
            ds = accesoDatos.getData(consulta);

            return ds;


        }
        private void ArmaraParametrosMedicoEliminar(ref SqlCommand comando, Usuarios us)
        {
            SqlParameter sqlparametros = new SqlParameter();
            sqlparametros = comando.Parameters.Add("@idusuario", SqlDbType.Int);
            sqlparametros.Value = us.getIdUsuario();
        }
        public int EliminarMed(Usuarios us)
        {
            SqlCommand comando = new SqlCommand();
            ArmaraParametrosMedicoEliminar(ref comando, us);
            return accesoDatos.ExecProceAlmace(comando, "SP_EliminarMedico");

        }


 

        public DataSet medicosFiltrados(string legajo, string apellido, string especialidad)
        {
            DataSet ds = new DataSet();
            string consulta = $"select id_usuario as idMedico, nombre , apellido ,legajo , p.nombre_provincia as provincia, lo.nombre_localidad as localidad , es.nombre_especialidad as especialidad from usuarios inner join provincias as p on p.id_provincia = id_provincia_us inner join localidades as lo on lo.id_localidad =id_localidad_us inner join Especialidades as es on es.id_especialidad = id_especialidad_us where id_rol_us = 2 and 1=1";
            if (legajo!="")
            {
                consulta += $" AND legajo = '{legajo}'";
            }
            if (apellido!="")
            {
                consulta += $" AND apellido = '{apellido}' ";
            }
            if (especialidad != "")
            {
                consulta += $" AND id_especialidad_us = {especialidad} ";
            }
            ds = accesoDatos.getData(consulta);
            return ds;

        }


        public int medicoEditado(string id , string idEspecialidad , string idProvincia, string idLocalidad , string nombre , string apellido , string sexo , string nacionalidad , string direccion  , string correo , string telefono , string legajo , string dni)
        {
            string consulta = $"update usuarios set id_especialidad_us = {idEspecialidad} ,  id_provincia_us = {idProvincia} , id_localidad_us = {idLocalidad} , id_rol_us = 2 ,  nombre = '{nombre}' , apellido = '{apellido}' , sexo = '{sexo}' ,  nacionalidad = '{nacionalidad}' , direccion = '{direccion}' ,  correo_electronico  = '{correo}' ,  telefono = '{telefono}' ,  legajo = '{legajo}' ,  dni = '{dni}' where id_usuario = {id}";
            
            int filasAfectadas =  accesoDatos.execute(consulta);
            return filasAfectadas;

        }




    }
}
